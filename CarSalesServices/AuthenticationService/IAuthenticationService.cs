using CarSalesModels;

namespace CarSalesServices
{
    public interface IAuthenticationService
    {
        string GenerateToken(User user);
    }
}
