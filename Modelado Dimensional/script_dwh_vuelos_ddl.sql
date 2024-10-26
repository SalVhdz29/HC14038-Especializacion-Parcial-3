-- DIM DATE
CREATE TABLE DimFecha (
    ID_Fecha INT IDENTITY(1,1) PRIMARY KEY,
    FullDate DATE NOT NULL,
    Year INT NOT NULL,
    Quarter INT NOT NULL,
    Month INT NOT NULL,
    DayOfMonth INT NOT NULL,
    DayOfWeek INT NOT NULL
);

-- DIM AEROLINEA
CREATE TABLE DimAerolinea (
    ID_Aerolinea INT IDENTITY(1,1) PRIMARY KEY,
    Code NVARCHAR(250) NOT NULL,
    Description NVARCHAR(500) NOT NULL
);

-- DIM VUELO
CREATE TABLE DimVuelo (
    ID_Vuelo INT IDENTITY(1,1) PRIMARY KEY,
    Flight_Number_Operating_Airline NVARCHAR(10) NOT NULL,
    Tail_Number NVARCHAR(20) NOT NULL
);

-- DIM AEROPUERTO

CREATE TABLE DimRutaVuelo(
    ID_Ruta INT IDENTITY(1,1) PRIMARY KEY,
    OriginAirportID NVARCHAR(50) NOT NULL,
    OriginCityName NVARCHAR(100) NOT NULL,
    OriginStateName NVARCHAR(100) NOT NULL,
    DestAirportID NVARCHAR(50) NOT NULL,
    DestCityName NVARCHAR(100) NOT NULL,
    DestStateName NVARCHAR(100) NOT NULL,
    Distance NVARCHAR(100) NOT NULL
);


-- FACT  DELAY VUELOS
CREATE TABLE FactDelayVuelos (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    FlightDate DATE NOT NULL,   
    ID_Vuelo INT NOT NULL FOREIGN KEY REFERENCES DimVuelo(ID_Vuelo),
    ID_Aerolinea INT NOT NULL FOREIGN KEY REFERENCES DimAerolinea(ID_Aerolinea),
    ID_Ruta INT NOT NULL FOREIGN KEY REFERENCES DimRutaVuelo(ID_Ruta),
    Cancelled NVARCHAR(100),                               
    Diverted NVARCHAR(100),                                
    CRSDepTime NVARCHAR(100),                             
    DepTime NVARCHAR(100),                                 
    DepDelayMinutes NVARCHAR(100),                         
    DepDel15 NVARCHAR(100),                                
    ArrTime INT,                                 
    ArrDelayMinutes INT,                         
    ArrDel15 NVARCHAR(100),                                
    AirTime INT,                                 
    CRSElapsedTime INT,                          
    ActualElapsedTime INT,                                         
);


