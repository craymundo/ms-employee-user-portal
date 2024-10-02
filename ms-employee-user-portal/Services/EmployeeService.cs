using ms_employee_user_portal.Models;
using ms_employee_user_portal.Repository;

public class EmployeeService
{
    private readonly IEmployeeRepository _employeeRepository;

    public EmployeeService(IEmployeeRepository employeeRepository)
    {
        _employeeRepository = employeeRepository;
    }

    public async Task<(List<Employee>, int)> GetAll(int page, int rowsPerPage,
    string? name = null,
    string? position = null)
    {
        return await _employeeRepository.GetAll(page, rowsPerPage, name , position);
    }

    public async Task<Employee> GetById(int id)
    {
        return await _employeeRepository.GetById(id);
    }

    public async Task<int> Create(Employee employee)
    {
        return await _employeeRepository.Create(employee);
    }

    public async Task Update(Employee employee)
    {
        await _employeeRepository.Update(employee);
    }

    public async Task Delete(int id)
    {
        await _employeeRepository.Delete(id);
    }
}
