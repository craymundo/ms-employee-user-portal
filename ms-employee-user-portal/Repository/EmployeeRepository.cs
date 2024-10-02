using Dapper;
using ms_employee_user_portal.Data;
using ms_employee_user_portal.Models;
using ms_employee_user_portal.Repository;
using System.Data;

public class EmployeeRepository : IEmployeeRepository
{
    private readonly DapperContext _context;

    public EmployeeRepository(DapperContext context)
    {
        _context = context;
    }

    public async Task<(List<Employee>, int)> GetAll(int page, int rowsPerPage, string? name = null, string? position = null)
    {
        using (var con = _context.CreateConnection())
        {
            string query = "usp_GetAllEmployees";
            var parametros = new DynamicParameters();
            parametros.Add("@page", page, dbType: DbType.Int32);
            parametros.Add("@rowsPerPage", rowsPerPage, dbType: DbType.Int32);
            parametros.Add("@name", name, DbType.String);
            parametros.Add("@position", position, DbType.String);


            using (var multi = await con.QueryMultipleAsync(query, parametros, commandType: CommandType.StoredProcedure))
            {
                var employees = multi.Read<Employee>().ToList();
                var totalRecords = multi.Read<int>().Single();
                return (employees, totalRecords);
            }
        }
    }

    public async Task<Employee> GetById(int id)
    {
        using (var con = _context.CreateConnection())
        {
            string query = "usp_GetEmployeeById";
            var parametros = new DynamicParameters();
            parametros.Add("@id", id, dbType: DbType.Int32);

            return await con.QueryFirstOrDefaultAsync<Employee>(query, parametros, commandType: CommandType.StoredProcedure);
        }
    }

    public async Task<int> Create(Employee employee)
    {
        using (var con = _context.CreateConnection())
        {
            string query = "usp_CreateEmployee";
            var parametros = new DynamicParameters();
            parametros.Add("@name", employee.Name, DbType.String);
            parametros.Add("@position", employee.Position, DbType.String);
            parametros.Add("@description", employee.Description, DbType.String);
            parametros.Add("@isActive", employee.IsActive, DbType.Boolean);

            return await con.QuerySingleAsync<int>(query, parametros, commandType: CommandType.StoredProcedure);
        }
    }

    public async Task Update(Employee employee)
    {
        using (var con = _context.CreateConnection())
        {
            string query = "usp_UpdateEmployee";
            var parametros = new DynamicParameters();
            parametros.Add("@id", employee.Id, dbType: DbType.Int32);
            parametros.Add("@name", employee.Name, DbType.String);
            parametros.Add("@position", employee.Position, DbType.String);
            parametros.Add("@description", employee.Description, DbType.String);
            parametros.Add("@isActive", employee.IsActive, DbType.Boolean);

            await con.ExecuteAsync(query, parametros, commandType: CommandType.StoredProcedure);
        }
    }

    public async Task Delete(int id)
    {
        using (var con = _context.CreateConnection())
        {
            string query = "usp_DeleteEmployee";
            var parametros = new DynamicParameters();
            parametros.Add("@id", id, dbType: DbType.Int32);

            await con.ExecuteAsync(query, parametros, commandType: CommandType.StoredProcedure);
        }
    }
}
