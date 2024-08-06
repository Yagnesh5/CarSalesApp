using CarSalesApp.Model;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CarSalesApp.Interfaces
{
    public interface ICommissionRepository
    {
        Task<IEnumerable<SalesmanCommission>> GetSalesmanCommissionReport();
    }
}
