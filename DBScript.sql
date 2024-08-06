CREATE DATABASE [CarSalesDB];
GO
USE [CarSalesDB]
GO

/****** Object:  Table [dbo].[CarBrandCommission]    Script Date: 06-08-2024 11:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarBrandCommission](
	[CarBrand] [varchar](50) NOT NULL,
	[FixedCommission] [decimal](18, 2) NULL,
	[ClassACommissionPercent] [decimal](5, 2) NULL,
	[ClassBCommissionPercent] [decimal](5, 2) NULL,
	[ClassCCommissionPercent] [decimal](5, 2) NULL,
	[FixedCommissionThreshold] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CarBrand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarImages]    Script Date: 06-08-2024 11:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarId] [int] NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 06-08-2024 11:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Brand] [nvarchar](50) NOT NULL,
	[Class] [nvarchar](50) NOT NULL,
	[ModelName] [nvarchar](100) NOT NULL,
	[ModelCode] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Features] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[DateOfManufacturing] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarSales]    Script Date: 06-08-2024 11:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarSales](
	[SalesmanId] [int] NULL,
	[CarBrand] [varchar](50) NULL,
	[CarClass] [char](1) NULL,
	[NumberOfCarsSold] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salesmen]    Script Date: 06-08-2024 11:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salesmen](
	[SalesmanId] [int] NOT NULL,
	[Name] [varchar](100) NULL,
	[LastYearSalesAmount] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesmanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 06-08-2024 11:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CarBrandCommission] ([CarBrand], [FixedCommission], [ClassACommissionPercent], [ClassBCommissionPercent], [ClassCCommissionPercent], [FixedCommissionThreshold]) VALUES (N'Audi', CAST(800.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(5, 2)), CAST(6.00 AS Decimal(5, 2)), CAST(4.00 AS Decimal(5, 2)), CAST(25000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CarBrandCommission] ([CarBrand], [FixedCommission], [ClassACommissionPercent], [ClassBCommissionPercent], [ClassCCommissionPercent], [FixedCommissionThreshold]) VALUES (N'Jaguar', CAST(750.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(5, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(35000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CarBrandCommission] ([CarBrand], [FixedCommission], [ClassACommissionPercent], [ClassBCommissionPercent], [ClassCCommissionPercent], [FixedCommissionThreshold]) VALUES (N'Land Rover', CAST(850.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(5, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(4.00 AS Decimal(5, 2)), CAST(30000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CarBrandCommission] ([CarBrand], [FixedCommission], [ClassACommissionPercent], [ClassBCommissionPercent], [ClassCCommissionPercent], [FixedCommissionThreshold]) VALUES (N'Renault', CAST(400.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(20000.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[CarImages] ON 
GO
INSERT [dbo].[CarImages] ([Id], [CarId], [ImageUrl]) VALUES (1, 2, N'string')
GO
INSERT [dbo].[CarImages] ([Id], [CarId], [ImageUrl]) VALUES (2, 3, N'string')
GO
INSERT [dbo].[CarImages] ([Id], [CarId], [ImageUrl]) VALUES (3, 4, N'string')
GO
INSERT [dbo].[CarImages] ([Id], [CarId], [ImageUrl]) VALUES (4, 5, N'string')
GO
INSERT [dbo].[CarImages] ([Id], [CarId], [ImageUrl]) VALUES (9, 7, N'string')
GO
INSERT [dbo].[CarImages] ([Id], [CarId], [ImageUrl]) VALUES (10, 6, N'string')
GO
SET IDENTITY_INSERT [dbo].[CarImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Cars] ON 
GO
INSERT [dbo].[Cars] ([Id], [Brand], [Class], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [Active]) VALUES (1, N'Audi', N'A', N'Q1', N'lsCyytwKun', N'car description here', N'string', CAST(2000000.00 AS Decimal(18, 2)), CAST(N'2024-08-05T07:48:25.633' AS DateTime), 1)
GO
INSERT [dbo].[Cars] ([Id], [Brand], [Class], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [Active]) VALUES (2, N'Land Rover', N'A', N'Defender', N'lsCyytwKun', N'test', N'string', CAST(7000000.00 AS Decimal(18, 2)), CAST(N'2024-08-05T07:51:53.850' AS DateTime), 1)
GO
INSERT [dbo].[Cars] ([Id], [Brand], [Class], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [Active]) VALUES (3, N'Audi', N'C', N'Q3', N'lsCyytwKun', N'test', N'string', CAST(3000000.00 AS Decimal(18, 2)), CAST(N'2024-08-05T07:51:53.850' AS DateTime), 1)
GO
INSERT [dbo].[Cars] ([Id], [Brand], [Class], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [Active]) VALUES (4, N'Land Rover', N'B', N'Evoke', N'lsCyytwKun', N'test new', N'string', CAST(5000000.00 AS Decimal(18, 2)), CAST(N'2024-08-05T11:26:50.563' AS DateTime), 1)
GO
INSERT [dbo].[Cars] ([Id], [Brand], [Class], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [Active]) VALUES (5, N'Renault', N'C', N'Duster', N'lsCyytwKun', N'test 1', N'string', CAST(1500000.00 AS Decimal(18, 2)), CAST(N'2024-08-05T11:26:50.563' AS DateTime), 1)
GO
INSERT [dbo].[Cars] ([Id], [Brand], [Class], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [Active]) VALUES (6, N'Jaguar', N'B', N'XK120', N'3y8RomUkeD', N'test desc', N'string', CAST(6000000.00 AS Decimal(18, 2)), CAST(N'2024-08-05T13:34:46.053' AS DateTime), 1)
GO
INSERT [dbo].[Cars] ([Id], [Brand], [Class], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [Active]) VALUES (7, N'Jaguar', N'A', N'R1', N'3y8RomUkeD', N'new desc', N'string', CAST(5000000.00 AS Decimal(18, 2)), CAST(N'2024-08-05T13:34:46.053' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Cars] OFF
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (1, N'Audi', N'A', 1)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (1, N'Jaguar', N'A', 3)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (1, N'Renault', N'A', 6)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (1, N'Audi', N'B', 2)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (1, N'Jaguar', N'B', 4)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (1, N'Land Rover', N'B', 2)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (1, N'Renault', N'B', 2)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (1, N'Audi', N'C', 3)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (1, N'Jaguar', N'C', 6)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (1, N'Land Rover', N'C', 1)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (1, N'Renault', N'C', 1)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (2, N'Jaguar', N'A', 5)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (2, N'Land Rover', N'A', 5)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (2, N'Renault', N'A', 3)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (2, N'Jaguar', N'B', 4)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (2, N'Land Rover', N'B', 2)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (2, N'Renault', N'B', 2)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (2, N'Jaguar', N'C', 2)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (2, N'Land Rover', N'C', 1)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (2, N'Renault', N'C', 1)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (3, N'Audi', N'A', 4)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (3, N'Jaguar', N'A', 2)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (3, N'Land Rover', N'A', 1)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (3, N'Renault', N'A', 6)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (3, N'Audi', N'B', 2)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (3, N'Jaguar', N'B', 7)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (3, N'Land Rover', N'B', 2)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (3, N'Renault', N'B', 3)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (3, N'Jaguar', N'C', 1)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (3, N'Land Rover', N'C', 3)
GO
INSERT [dbo].[CarSales] ([SalesmanId], [CarBrand], [CarClass], [NumberOfCarsSold]) VALUES (3, N'Renault', N'C', 1)
GO
INSERT [dbo].[Salesmen] ([SalesmanId], [Name], [LastYearSalesAmount]) VALUES (1, N'John Smith', CAST(490000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Salesmen] ([SalesmanId], [Name], [LastYearSalesAmount]) VALUES (2, N'Richard Porter', CAST(1000000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Salesmen] ([SalesmanId], [Name], [LastYearSalesAmount]) VALUES (3, N'Tony Grid', CAST(650000.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Username], [Password]) VALUES (1, N'yagnesh', N'User123')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[CarImages]  WITH CHECK ADD FOREIGN KEY([CarId])
REFERENCES [dbo].[Cars] ([Id])
GO
ALTER TABLE [dbo].[CarSales]  WITH CHECK ADD FOREIGN KEY([SalesmanId])
REFERENCES [dbo].[Salesmen] ([SalesmanId])
GO
/****** Object:  StoredProcedure [dbo].[AddCar]    Script Date: 06-08-2024 11:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCar]
@Brand NVARCHAR(50),
@Class NVARCHAR(50),
@ModelName NVARCHAR(50),
@ModelCode NVARCHAR(10),
@Description NVARCHAR(MAX),
@Features NVARCHAR(MAX),
@Price DECIMAL(18, 2),
@DateOfManufacturing DATETIME,
@Active BIT,
@NewId INT OUTPUT
AS
BEGIN
    INSERT INTO Cars (Brand, Class, ModelName, ModelCode, Description, Features, Price, DateOfManufacturing, Active)
    VALUES (@Brand, @Class, @ModelName, @ModelCode, @Description, @Features, @Price, @DateOfManufacturing, @Active);
    SET @NewId = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[AddCarImage]    Script Date: 06-08-2024 11:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCarImage]
@CarId INT,
@ImageUrl NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO CarImages (CarId, ImageUrl) VALUES (@CarId, @ImageUrl);
END
GO
/****** Object:  StoredProcedure [dbo].[CalculateSalesmanCommission]    Script Date: 06-08-2024 11:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
EXEC CalculateSalesmanCommission
*/
CREATE PROCEDURE [dbo].[CalculateSalesmanCommission]
AS
BEGIN
    SELECT 
        s.SalesmanId,
        s.Name,
        cast(SUM(
            CASE 
                WHEN cs.CarBrand = 'Audi' AND cs.CarClass = 'A' THEN 
                    CASE 
                        WHEN s.LastYearSalesAmount > 500000 THEN 
                            (cbc.FixedCommission + (cbc.ClassACommissionPercent / 100 * cs.NumberOfCarsSold * cbc.FixedCommissionThreshold) + (0.02 * s.LastYearSalesAmount))
                        ELSE 
                            (cbc.FixedCommission + (cbc.ClassACommissionPercent / 100 * cs.NumberOfCarsSold * cbc.FixedCommissionThreshold))
                    END
                WHEN cs.CarBrand = 'Audi' AND cs.CarClass = 'B' THEN (cbc.FixedCommission + (cbc.ClassBCommissionPercent / 100 * cs.NumberOfCarsSold * cbc.FixedCommissionThreshold))
                WHEN cs.CarBrand = 'Audi' AND cs.CarClass = 'C' THEN (cbc.FixedCommission + (cbc.ClassCCommissionPercent / 100 * cs.NumberOfCarsSold * cbc.FixedCommissionThreshold))
                WHEN cs.CarBrand = 'Jaguar' AND cs.CarClass = 'A' THEN 
                    CASE 
                        WHEN s.LastYearSalesAmount > 500000 THEN 
                            (cbc.FixedCommission + (cbc.ClassACommissionPercent / 100 * cs.NumberOfCarsSold * cbc.FixedCommissionThreshold) + (0.02 * s.LastYearSalesAmount))
                        ELSE 
                            (cbc.FixedCommission + (cbc.ClassACommissionPercent / 100 * cs.NumberOfCarsSold * cbc.FixedCommissionThreshold))
                    END
                WHEN cs.CarBrand = 'Jaguar' AND cs.CarClass = 'B' THEN (cbc.FixedCommission + (cbc.ClassBCommissionPercent / 100 * cs.NumberOfCarsSold * cbc.FixedCommissionThreshold))
                WHEN cs.CarBrand = 'Jaguar' AND cs.CarClass = 'C' THEN (cbc.FixedCommission + (cbc.ClassCCommissionPercent / 100 * cs.NumberOfCarsSold * cbc.FixedCommissionThreshold))
                WHEN cs.CarBrand = 'Land Rover' AND cs.CarClass = 'A' THEN 
                    CASE 
                        WHEN s.LastYearSalesAmount > 500000 THEN 
                            (cbc.FixedCommission + (cbc.ClassACommissionPercent / 100 * cs.NumberOfCarsSold * cbc.FixedCommissionThreshold) + (0.02 * s.LastYearSalesAmount))
                        ELSE 
                            (cbc.FixedCommission + (cbc.ClassACommissionPercent / 100 * cs.NumberOfCarsSold * cbc.FixedCommissionThreshold))
                    END
                WHEN cs.CarBrand = 'Land Rover' AND cs.CarClass = 'B' THEN (cbc.FixedCommission + (cbc.ClassBCommissionPercent / 100 * cs.NumberOfCarsSold * cbc.FixedCommissionThreshold))
                WHEN cs.CarBrand = 'Land Rover' AND cs.CarClass = 'C' THEN (cbc.FixedCommission + (cbc.ClassCCommissionPercent / 100 * cs.NumberOfCarsSold * cbc.FixedCommissionThreshold))
                WHEN cs.CarBrand = 'Renault' AND cs.CarClass = 'A' THEN 
                    CASE 
                        WHEN s.LastYearSalesAmount > 500000 THEN 
                            (cbc.FixedCommission + (cbc.ClassACommissionPercent / 100 * cs.NumberOfCarsSold * cbc.FixedCommissionThreshold) + (0.02 * s.LastYearSalesAmount))
                        ELSE 
                            (cbc.FixedCommission + (cbc.ClassACommissionPercent / 100 * cs.NumberOfCarsSold * cbc.FixedCommissionThreshold))
                    END
                WHEN cs.CarBrand = 'Renault' AND cs.CarClass = 'B' THEN (cbc.FixedCommission + (cbc.ClassBCommissionPercent / 100 * cs.NumberOfCarsSold * cbc.FixedCommissionThreshold))
                WHEN cs.CarBrand = 'Renault' AND cs.CarClass = 'C' THEN (cbc.FixedCommission + (cbc.ClassCCommissionPercent / 100 * cs.NumberOfCarsSold * cbc.FixedCommissionThreshold))
                ELSE 0 
            END
        )as decimal(16,2)) AS TotalCommission
    FROM Salesmen s
    LEFT JOIN CarSales cs ON s.SalesmanId = cs.SalesmanId
    LEFT JOIN CarBrandCommission cbc ON cs.CarBrand = cbc.CarBrand
    GROUP BY s.SalesmanId, s.Name
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCar]    Script Date: 06-08-2024 11:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCar]
@Id INT
AS
BEGIN
    DELETE FROM CarImages WHERE CarId = @Id;
    DELETE FROM Cars WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllCars]    Script Date: 06-08-2024 11:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllCars]
AS
BEGIN
    SELECT * FROM Cars;
END
GO
/****** Object:  StoredProcedure [dbo].[GetCarById]    Script Date: 06-08-2024 11:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCarById]
@Id INT
AS
BEGIN
    SELECT * FROM Cars WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetImagesByCarId]    Script Date: 06-08-2024 11:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetImagesByCarId]
@CarId INT
AS
BEGIN
    SELECT * FROM CarImages WHERE CarId = @CarId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCar]    Script Date: 06-08-2024 11:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCar]
@Id INT,
@Brand NVARCHAR(50),
@Class NVARCHAR(50),
@ModelName NVARCHAR(50),
@ModelCode NVARCHAR(10),
@Description NVARCHAR(MAX),
@Features NVARCHAR(MAX),
@Price DECIMAL(18, 2),
@DateOfManufacturing DATETIME,
@Active BIT
AS
BEGIN
    UPDATE Cars SET 
        Brand = @Brand, 
        Class = @Class, 
        ModelName = @ModelName, 
        ModelCode = @ModelCode, 
        Description = @Description, 
        Features = @Features, 
        Price = @Price, 
        DateOfManufacturing = @DateOfManufacturing, 
        Active = @Active 
    WHERE Id = @Id;
END
GO