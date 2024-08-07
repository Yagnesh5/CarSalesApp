using CarSalesModels;

namespace CarSalesServices
{
    public interface ICarService
    {
        Task<IEnumerable<CarViewModel>> GetAll();
        Task<CarViewModel> GetById(int id);
        Task Add(CarViewModel carModel);
        Task Update(CarViewModel carModel);
        Task Delete(int id);
    }
}
