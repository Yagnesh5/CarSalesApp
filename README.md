# Car Sales Management API

This is a .NET Core API for managing car sales, including user authentication, CRUD operations for car models, and a sales commission report.

## Table of Contents

- [Features](#features)
- [Architecture](#architecture)
- [Setup](#setup)
- [Usage](#usage)
- [Endpoints](#endpoints)
- [Technologies](#technologies)
- [Contributing](#contributing)
- [License](#license)

## Features

- User authentication with JWT
- CRUD operations for car models
- Management of car images
- Salesman commission report generation
- Global error handling

## Architecture

The project follows a layered architecture with a clear separation of concerns:

1. **Presentation Layer (Controllers)**
   - Handles HTTP requests and returns HTTP responses using ASP.NET Core MVC.
   
2. **Service Layer**
   - Contains business logic and interacts with the repository layer.
   
3. **Repository Layer**
   - Responsible for data access logic using Dapper.
   
4. **Data Layer (Database)**
   - Consists of tables and stored procedures.
   
5. **Authentication and Authorization**
   - Uses JWT for securing endpoints.

## Setup

### Prerequisites

- .NET 6 SDK
- SQL Server
- Visual Studio or any other C# IDE

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/carsalesapp.git
   cd carsalesapp
