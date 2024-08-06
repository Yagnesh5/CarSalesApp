using CarSalesApp.Interfaces;
using CarSalesApp.Model;
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
            var commissions = new List<SalesmanCommission>();

            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                SqlCommand cmd = new SqlCommand("CalculateSalesmanCommission", conn)
                {
                    CommandType = CommandType.StoredProcedure
                };

                await conn.OpenAsync();
                using (SqlDataReader reader = await cmd.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        commissions.Add(new SalesmanCommission
                        {
                            SalesmanId = reader.GetInt32(0),
                            Name = reader.GetString(1),
                            TotalCommission = reader.GetDecimal(2)
                        });
                    }
                }
            }

            return commissions;
        }
    }
}
