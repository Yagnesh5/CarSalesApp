using Dapper;
using Microsoft.Data.SqlClient;
using CarSalesApp.Model;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;

namespace CarSalesApp.Repositories
{
    public class CarRepository : ICarRepository
    {
        private readonly string _connectionString;

        public CarRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        private IDbConnection Connection => new SqlConnection(_connectionString);

        public async Task<IEnumerable<CarViewModel>> GetAll()
        {
            using (var dbConnection = Connection)
            {
                var carModels = await dbConnection.QueryAsync<CarViewModel>("GetAllCars", commandType: CommandType.StoredProcedure);
                foreach (var carModel in carModels)
                {
                    var images = await dbConnection.QueryAsync<ModelImage>("GetImagesByCarId", new { CarId = carModel.Id }, commandType: CommandType.StoredProcedure);
                    carModel.Images = images.ToList();
                }
                return carModels;
            }
        }

        public async Task<CarViewModel> GetById(int id)
        {
            using (var dbConnection = Connection)
            {
                var carModel = await dbConnection.QuerySingleOrDefaultAsync<CarViewModel>("GetCarById", new { Id = id }, commandType: CommandType.StoredProcedure);
                if (carModel != null)
                {
                    var images = await dbConnection.QueryAsync<ModelImage>("GetImagesByCarId", new { CarId = carModel.Id }, commandType: CommandType.StoredProcedure);
                    carModel.Images = images.ToList();
                }
                return carModel;
            }
        }

        public async Task Add(CarViewModel carModel)
        {
            using (var dbConnection = Connection)
            {
                var parameters = new DynamicParameters();
                parameters.Add("Brand", carModel.Brand);
                parameters.Add("Class", carModel.Class);
                parameters.Add("ModelName", carModel.ModelName);
                parameters.Add("ModelCode", carModel.ModelCode);
                parameters.Add("Description", carModel.Description);
                parameters.Add("Features", carModel.Features);
                parameters.Add("Price", carModel.Price);
                parameters.Add("DateOfManufacturing", carModel.DateOfManufacturing);
                parameters.Add("Active", carModel.Active);
                parameters.Add("NewId", dbType: DbType.Int32, direction: ParameterDirection.Output);

                await dbConnection.ExecuteAsync("AddCar", parameters, commandType: CommandType.StoredProcedure);
                carModel.Id = parameters.Get<int>("NewId");

                foreach (var image in carModel.Images)
                {
                    image.CarId = carModel.Id;
                    await dbConnection.ExecuteAsync("AddCarImage", new { CarId = image.CarId, ImageUrl = image.ImageUrl }, commandType: CommandType.StoredProcedure);
                }
            }
        }

        public async Task Update(CarViewModel carModel)
        {
            using (var dbConnection = Connection)
            {
                var parameters = new
                {
                    carModel.Id,
                    carModel.Brand,
                    carModel.Class,
                    carModel.ModelName,
                    carModel.ModelCode,
                    carModel.Description,
                    carModel.Features,
                    carModel.Price,
                    carModel.DateOfManufacturing,
                    carModel.Active
                };

                await dbConnection.ExecuteAsync("UpdateCar", parameters, commandType: CommandType.StoredProcedure);

                await dbConnection.ExecuteAsync("DELETE FROM CarImages WHERE CarId = @Id", new { carModel.Id });

                foreach (var image in carModel.Images)
                {
                    await dbConnection.ExecuteAsync("AddCarImage", new { CarId = carModel.Id, image.ImageUrl }, commandType: CommandType.StoredProcedure);
                }
            }
        }

        public async Task Delete(int id)
        {
            using (var dbConnection = Connection)
            {
                await dbConnection.ExecuteAsync("DeleteCar", new { Id = id }, commandType: CommandType.StoredProcedure);
            }
        }
    }
}
