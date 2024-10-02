using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ms_employee_user_portal.Common;
using ms_employee_user_portal.DTO;
using ms_employee_user_portal.Repository;

namespace ms_employee_user_portal.Controllers
{
    [Route("api/[controller]")]
    [AllowAnonymous]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserRepository _userRepository;
        private readonly Utilidades _utilidades;

        public UserController(IUserRepository userRepository, Utilidades utilidades)
        {
            _userRepository = userRepository;
            _utilidades = utilidades;
        }

        [HttpPost]
        [Route("Create")]
        public async Task<IActionResult> Create(UserDto objeto)
        {
            if (string.IsNullOrWhiteSpace(objeto.UserName) || string.IsNullOrWhiteSpace(objeto.Password))
            {
                return BadRequest(new ApiResponse<string>(false, "Username and Password are required fields.", null));
            }

            var usuario = new Models.User
            {
                UserName = objeto.UserName,
                Password = _utilidades.EncriptarSHA256(objeto.Password)
            };

            try
            {
                var result = await _userRepository.Create(usuario);

                if (result > 0)
                    return Ok(new ApiResponse<int>(true, "User created successfully", result));
                else
                    return StatusCode(StatusCodes.Status500InternalServerError, new ApiResponse<string>(false, "An error occurred while creating the user.", null));
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new ApiResponse<string>(false, "Error creating the user.", ex.Message));
            }
        }

        [HttpPost]
        [Route("Login")]
        public async Task<IActionResult> Login(LoginDto objeto)
        {
            if (string.IsNullOrWhiteSpace(objeto.UserName) || string.IsNullOrWhiteSpace(objeto.Password))
            {
                return BadRequest(new ApiResponse<string>(false, "Username and Password are required fields.", null));
            }

            var claveEncriptada = _utilidades.EncriptarSHA256(objeto.Password);

            try
            {
                var usuarioEncontrado = await _userRepository.Login(objeto.UserName, claveEncriptada);

                if (usuarioEncontrado == null)
                    return Ok(new ApiResponse<string>(false, "Invalid credentials", null));
                else
                    return Ok(new ApiResponse<string>(true, "Login successful", _utilidades.GenerarJWT(usuarioEncontrado)));
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new ApiResponse<string>(false, "Error during login.", ex.Message));
            }
        }
    }
}