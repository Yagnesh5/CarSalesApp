using CarSalesApp.Model;
using CarSalesApp.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace CarSalesApp.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class CarController : ControllerBase
    {
        private static readonly string[] Brand = new[]
        {
            "Audi", "jaguar", "Land rover", "Renault"
        };

        private static readonly string[] Class = new[]
        {
            "A-Class", "B-Class", "C-Class"
        };

        private readonly ILogger<CarController> _logger;
        private readonly ICarService _carService;

        public CarController(ILogger<CarController> logger, ICarService carService)
        {
            _logger = logger;
            _carService = carService;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<CarViewModel>>> GetCarModels()
        {
            var carModels = await _carService.GetAll();
            return Ok(carModels);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<CarViewModel>> GetCarModel(int id)
        {
            var carModel = await _carService.GetById(id);
            if (carModel == null)
            {
                return NotFound();
            }
            return Ok(carModel);
        }

        [HttpPost]
        public async Task<ActionResult<CarViewModel>> PostCarModel(CarViewModel carModel)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            await _carService.Add(carModel);
            return CreatedAtAction(nameof(GetCarModel), new { id = carModel.Id }, carModel);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutCarModel(int id, CarViewModel carModel)
        {
            if (id != carModel.Id)
            {
                return BadRequest();
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            await _carService.Update(carModel);
            return Ok(new { message = "Car updated successfully" });
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCarModel(int id)
        {
            await _carService.Delete(id);
            return Ok(new { message = "Car deleted successfully" });
        }
    }
}
