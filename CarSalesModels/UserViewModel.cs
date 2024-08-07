namespace CarSalesModels
{
    public class User
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }

    public class JwtSettings
    {
        public string Key { get; set; }
        public string Issuer { get; set; }
        public string Audience { get; set; }
    }
}
