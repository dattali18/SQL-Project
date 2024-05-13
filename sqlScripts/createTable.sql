CREATE TABLE Flights (
    Flight_ID INT PRIMARY KEY,
    Flight_Number VARCHAR(10),
    Departure_Time DATETIME,
    Arrival_Time DATETIME,
    Aircraft_ID INT FOREIGN KEY REFERENCES Aircrafts(Aircraft_ID),
    Departure_Airport_ID INT FOREIGN KEY REFERENCES Airports(Airport_ID),
    Arrival_Airport_ID INT FOREIGN KEY REFERENCES Airports(Airport_ID),
    Status VARCHAR(20)
);

CREATE TABLE Airlines (
    Airline_ID INT PRIMARY KEY,
    Airline_Name VARCHAR(50)
);

CREATE TABLE Airports (
    Airport_ID INT PRIMARY KEY,
    Airport_Name VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE Passengers (
    Passenger_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone_Number VARCHAR(20)
);

CREATE TABLE CrewMembers (
    Crew_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Contact_Number VARCHAR(20)
);

CREATE TABLE Aircrafts (
    Aircraft_ID INT PRIMARY KEY,
    Aircraft_Type VARCHAR(50),
    Capacity INT
);

CREATE TABLE Booking (
    Booking_ID INT PRIMARY KEY,
    Flight_ID INT FOREIGN KEY REFERENCES Flights(Flight_ID),
    Passenger_ID INT FOREIGN KEY REFERENCES Passengers(Passenger_ID),
    Booking_Date DATE,
    Seat_Number VARCHAR(10)
);
