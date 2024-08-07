using CarSalesRepositories;
using CarSalesModels;
using CarSalesServices;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CarSalesServices
{
    public class CommissionService : ICommissionService
    {
        private readonly ICommissionRepository _commissionRepository;

        public CommissionService(ICommissionRepository commissionRepository)
        {
            _commissionRepository = commissionRepository;
        }

        public async Task<IEnumerable<SalesmanCommission>> GetSalesmanCommissionReport()
        {
            return await _commissionRepository.GetSalesmanCommissionReport();
        }
    }
}
