using CarSalesModels;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CarSalesRepositories
{
    public interface ICommissionRepository
    {
        Task<IEnumerable<SalesmanCommission>> GetSalesmanCommissionReport();
    }
}
