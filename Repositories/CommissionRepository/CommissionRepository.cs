using CarSalesApp.Interfaces;
using CarSalesApp.Model;
using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace CarSalesApp.Repositories
{
    public class CommissionRepository : ICommissionRepository
    {
        private readonly string _connectionString;

        public CommissionRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public async Task<IEnumerable<SalesmanCommission>> GetSalesmanCommissionReport()
        {
            using (IDbConnection conn = new SqlConnection(_connectionString))
            {
                string storedProcedure = "CalculateSalesmanCommission";

                var commissions = await conn.QueryAsync<SalesmanCommission>(
                    storedProcedure,
                    commandType: CommandType.StoredProcedure
                );

                return commissions;
            }
        }
    }
}
