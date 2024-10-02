using Dapper;
using ms_employee_user_portal.Data;
using ms_employee_user_portal.Models;
using System.Data;

namespace ms_employee_user_portal.Repository
{
    public class UserRepository : IUserRepository
    {

        private readonly DapperContext _context;

        public UserRepository(DapperContext context)
        {
            _context = context;
        }
        public async Task<int> Create(User user)
        {
            using (var con = _context.CreateConnection())
            {
                string query = "usp_CreateUser";
                var parametros = new DynamicParameters();
                parametros.Add("@userName", user.UserName, DbType.String);
                parametros.Add("@password", user.Password, DbType.String);


                return await con.QuerySingleAsync<int>(query, parametros, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<User> Login(string usuario, string clave)
        {

            using (var con = _context.CreateConnection())
            {
                string query = "usp_Login";
                var parametros = new DynamicParameters();
                parametros.Add("@userName", usuario, DbType.String);
                parametros.Add("@password", clave, DbType.String);

                return await con.QueryFirstOrDefaultAsync<User>(query, parametros, commandType: CommandType.StoredProcedure);
            }
               
        }
    }
}
