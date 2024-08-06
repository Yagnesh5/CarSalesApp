using System.ComponentModel.DataAnnotations;

namespace CarSalesApp.Model
{
    public class CarViewModel
    {
        public int Id { get; set; }
        public required string Brand { get; set; }
        public required string Class { get; set; }
        public required string ModelName { get; set; }

        [StringLength(10, MinimumLength = 10, ErrorMessage = "Model Code must be exactly 10 characters.")]
        [RegularExpression("^[a-zA-Z0-9]*$", ErrorMessage = "Model Code must be alphanumeric.")]
        public required string ModelCode { get; set; }
        public required string Description { get; set; }
        public required string Features { get; set; }

        [Range(0, double.MaxValue, ErrorMessage = "Price must be a positive number.")]
        public required decimal Price { get; set; }
        public required DateTime DateOfManufacturing { get; set; }
        public required bool Active { get; set; }
        public List<ModelImage>? Images { get; set; }
    }
    public class ModelImage
    {
        public int Id { get; set; }
        public int CarId { get; set; }
        public required string ImageUrl { get; set; }
    }
}
