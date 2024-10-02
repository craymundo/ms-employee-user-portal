using ms_employee_user_portal.Models;

namespace ms_employee_user_portal.Repository
{
    public interface IEmployeeRepository
    {
        Task<(List<Employee>, int)> GetAll(int page, int rowsPerPage, string? name = null, string? position = null);
        Task<Employee> GetById(int id);
        Task<int> Create(Employee employee);
        Task Update(Employee employee);
        Task Delete(int id);
    }
}
