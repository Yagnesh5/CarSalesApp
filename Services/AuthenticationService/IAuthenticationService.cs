using CarSalesApp.Model;

namespace CarSalesApp.Services
{
    public interface IAuthenticationService
    {
        string GenerateToken(User user);
    }
}
