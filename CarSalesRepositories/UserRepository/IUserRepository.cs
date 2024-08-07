using CarSalesModels;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CarSalesRepositories
{
    public interface IUserRepository
    {
        Task<User> GetUserByUsernameAndPassword(string username, string password);
    }
}
