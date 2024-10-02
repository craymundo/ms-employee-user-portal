using ms_employee_user_portal.Models;

namespace ms_employee_user_portal.Repository
{
    public interface IUserRepository
    {

        Task<int> Create(User user);

        Task<User> Login(string usuario, string clave);
    }
}
