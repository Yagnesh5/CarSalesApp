using CarSalesApp.Model;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CarSalesApp.Repositories
{
    public interface ICarRepository
    {
        Task<IEnumerable<CarViewModel>> GetAll();
        Task<CarViewModel> GetById(int id);
        Task Add(CarViewModel carModel);
        Task Update(CarViewModel carModel);
        Task Delete(int id);
    }
}