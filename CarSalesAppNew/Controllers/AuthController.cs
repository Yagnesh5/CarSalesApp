using CarSalesModels;
using Microsoft.AspNetCore.Mvc;
using CarSalesServices;

namespace CarSalesApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IAuthenticationService _authenticationService;
        private readonly IUserService _userService;

        public AuthController(IAuthenticationService authenticationService, IUserService userService)
        {
            _authenticationService = authenticationService;
            _userService = userService;
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] User user)
        {
            var validUser = await _userService.ValidateUser(user.Username, user.Password);
            if (validUser == null)
            {
                return Unauthorized(new { message = "Invalid username or password" });
            }
            var token = _authenticationService.GenerateToken(user);
            return Ok(new { Token = token });
        }
    }
}
