using CarSalesModels;

namespace CarSalesServices
{
    public interface IUserService
    {
        Task<User> ValidateUser(string username, string password);
    }
}
