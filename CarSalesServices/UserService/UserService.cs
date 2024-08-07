using CarSalesRepositories;
using CarSalesModels;
using System.Threading.Tasks;

namespace CarSalesServices
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
