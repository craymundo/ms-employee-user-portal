using ms_employee_user_portal.Models;

namespace ms_employee_user_portal.DTO
{
    public class EmployeeDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Position { get; set; }
        public string Description { get; set; }
        public bool IsActive { get; set; }
    }

    public class PagedEmployeeResponse
    {
        public List<Employee> Employees { get; set; }
        public int TotalRecords { get; set; }
    }

    public class CreateEmployeeDto
    {
        public string Name { get; set; }
        public string Position { get; set; }
        public string Description { get; set; }
        public bool IsActive { get; set; }
    }

    public class UpdateEmployeeDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Position { get; set; }
        public string Description { get; set; }
        public bool IsActive { get; set; }
    }
}
