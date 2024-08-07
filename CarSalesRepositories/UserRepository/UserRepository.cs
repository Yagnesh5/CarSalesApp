using Dapper;
using CarSalesRepositories;
using CarSalesModels;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace CarSalesRepositories
{
    public class UserRepository : IUserRepository
    {
        private readonly string _connectionString;

        public UserRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        private IDbConnection Connection => new SqlConnection(_connectionString);

        public async Task<User> GetUserByUsernameAndPassword(string username, string password)
        {
            using (var dbConnection = Connection)
            {
                var user = await dbConnection.QuerySingleOrDefaultAsync<User>(
                    "SELECT * FROM Users WHERE Username = @Username AND Password = @Password",
                    new { Username = username, Password = password });
                return user;
            }
        }
    }
}
