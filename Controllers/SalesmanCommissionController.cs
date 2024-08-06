using CarSalesApp.Model;
using CarSalesApp.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace CarSalesApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SalesmanCommissionController : ControllerBase
    {
        private readonly ICommissionService _commissionService;

        public SalesmanCommissionController(ICommissionService commissionService)
        {
            _commissionService = commissionService;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<SalesmanCommission>>> GetSalesmanCommissionReport()
        {
            var commissions = await _commissionService.GetSalesmanCommissionReport();
            return Ok(commissions);
        }
    }
}
