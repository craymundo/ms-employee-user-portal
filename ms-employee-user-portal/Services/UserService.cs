using ms_employee_user_portal.Models;
using ms_employee_user_portal.Repository;

namespace ms_employee_user_portal.Services
{
    public class UserService
    {
        private readonly IUserRepository _userRepository;

        public UserService(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        public async Task<int> Create(User user)
        {
            return await _userRepository.Create(user);
        }

        public async Task<User> Login(string usuario, string clave)
        {
            return await _userRepository.Login(usuario, clave);
        }


    }
}
