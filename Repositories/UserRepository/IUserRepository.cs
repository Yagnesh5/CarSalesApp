using CarSalesApp.Model;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CarSalesApp.Interfaces
{
    public interface IUserRepository
    {
        Task<User> GetUserByUsernameAndPassword(string username, string password);
    }
}
