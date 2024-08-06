using CarSalesApp.Model;

namespace CarSalesApp.Services
{
    public interface ICommissionService
    {
        Task<IEnumerable<SalesmanCommission>> GetSalesmanCommissionReport();
    }
}
