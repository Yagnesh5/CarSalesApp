using CarSalesApp.Model;

namespace CarSalesApp.Services
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
