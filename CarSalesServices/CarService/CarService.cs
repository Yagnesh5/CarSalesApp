using CarSalesModels;
using CarSalesRepositories;

namespace CarSalesServices
{
    public class CarService : ICarService
    {
        private readonly ICarRepository _repository;

        public CarService(ICarRepository repository)
        {
            _repository = repository;
        }

        public async Task<IEnumerable<CarViewModel>> GetAll()
        {
            return await _repository.GetAll();
        }

        public async Task<CarViewModel> GetById(int id)
        {
            return await _repository.GetById(id);
        }

        public async Task Add(CarViewModel carModel)
        {
            await _repository.Add(carModel);
        }

        public async Task Update(CarViewModel carModel)
        {
            await _repository.Update(carModel);
        }

        public async Task Delete(int id)
        {
            await _repository.Delete(id);
        }
    }
}
