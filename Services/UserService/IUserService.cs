using CarSalesApp.Model;

namespace CarSalesApp.Services
{
    public interface IUserService
    {
        Task<User> ValidateUser(string username, string password);
    }
}
