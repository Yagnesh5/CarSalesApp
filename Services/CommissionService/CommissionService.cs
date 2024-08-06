using CarSalesApp.Interfaces;
using CarSalesApp.Model;
using CarSalesApp.Services;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CarSalesApp.Services
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
