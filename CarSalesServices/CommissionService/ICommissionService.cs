using CarSalesModels;

namespace CarSalesServices
{
    public interface ICommissionService
    {
        Task<IEnumerable<SalesmanCommission>> GetSalesmanCommissionReport();
    }
}
