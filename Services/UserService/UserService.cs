using CarSalesApp.Interfaces;
using CarSalesApp.Model;
using System.Threading.Tasks;

namespace CarSalesApp.Services
{
    public class UserService : IUserService
    {
        private readonly IUserRepository _userRepository;

        public UserService(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        public async Task<User> ValidateUser(string username, string password)
        {
            return await _userRepository.GetUserByUsernameAndPassword(username, password);
        }
    }
}
