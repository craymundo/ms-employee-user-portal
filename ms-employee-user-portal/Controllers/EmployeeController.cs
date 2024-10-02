using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using ms_employee_user_portal.Common;
using ms_employee_user_portal.DTO;
using ms_employee_user_portal.Hubs;
using ms_employee_user_portal.Models;

namespace ms_employee_user_portal.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class EmployeeController : ControllerBase
    {
        private readonly EmployeeService _employeeService;
        private readonly IHubContext<NotificationHub> _hubContext;

        public EmployeeController(EmployeeService service, IHubContext<NotificationHub> hubContext)
        {
            _employeeService = service;
            _hubContext = hubContext;
        }

        [HttpGet]
        [Route("GetAll")]
        public async Task<ActionResult<ApiResponse<List<Employee>>>> GetAll(int page = 1, int rowsPerPage = 10, string? name = null, string? position = null)
        {
            try
            {


                var (employees, totalRecords) = await _employeeService.GetAll(page, rowsPerPage, name, position);
                var result = new PagedEmployeeResponse
                {
                    Employees = employees,
                    TotalRecords = totalRecords
                };

                return Ok(new ApiResponse<PagedEmployeeResponse>(true, "Employees retrieved successfully", result));

            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = "Error retrieving data from the database.", details = ex.Message });
            }
        }

        [HttpGet]
        [Route("GetById/{id}")]
        public async Task<ActionResult<ApiResponse<Employee>>> GetById(int id)
        {
            if (id <= 0)
                return BadRequest("Invalid employee ID");

            try
            {
                var employee = await _employeeService.GetById(id);
                if (employee == null)
                    return NotFound("Employee not found");

                return Ok(new ApiResponse<Employee>(true, "Employee retrieved successfully", employee));
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = "Error retrieving data from the database.", details = ex.Message });
            }
        }

        [HttpPost]
        [Route("Create")]
        public async Task<ActionResult> Create([FromBody] CreateEmployeeDto dto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (string.IsNullOrWhiteSpace(dto.Name) || string.IsNullOrWhiteSpace(dto.Position))
            {
                return BadRequest("Name and Position are required fields.");
            }

            try
            {
                var newEmployee = new Employee
                {
                    Name = dto.Name,
                    Position = dto.Position,
                    Description = dto.Description,
                    IsActive = dto.IsActive
                };

                var result = await _employeeService.Create(newEmployee);

                if (result == -1)
                    return StatusCode(StatusCodes.Status500InternalServerError, "An error occurred while creating the employee.");

                await _hubContext.Clients.All.SendAsync("ReceiveCreateNotification", newEmployee.Name);
            
                return Ok(new ApiResponse<int>(true, "Employee created successfully", result));
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = "Error creating the employee.", details = ex.Message });
            }
        }

        [HttpPut]
        [Route("Update")]
        public async Task<ActionResult> Update([FromBody] UpdateEmployeeDto dto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (dto.Id <= 0 || string.IsNullOrWhiteSpace(dto.Name) || string.IsNullOrWhiteSpace(dto.Position))
            {
                return BadRequest("Id, Name, and Position are required fields.");
            }

            try
            {
                var updatedEmployee = new Employee
                {
                    Id = dto.Id,
                    Name = dto.Name,
                    Position = dto.Position,
                    Description = dto.Description,
                    IsActive = dto.IsActive
                };

                await _employeeService.Update(updatedEmployee);
                await _hubContext.Clients.All.SendAsync("ReceiveUpdateNotification", updatedEmployee.Name);

                return Ok(new ApiResponse<string>(true, "Employee updated successfully", null));
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = "Error updating the employee.", details = ex.Message });
            }
        }

        [HttpDelete]
        [Route("Delete/{id}")]
        public async Task<ActionResult> Delete(int id)
        {
            if (id <= 0)
                return BadRequest("Invalid employee ID");

            try
            {
                await _employeeService.Delete(id);
                await _hubContext.Clients.All.SendAsync("ReceiveDeleteNotification", id);
                return Ok(new ApiResponse<string>(true, "Employee deleted successfully", null));
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = "Error deleting the employee.", details = ex.Message });
            }
        }
    }
}