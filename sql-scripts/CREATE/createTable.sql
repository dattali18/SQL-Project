CREATE TABLE Airlines (
    Airline_ID INT PRIMARY KEY,
    Airline_Name VARCHAR(50)
);

CREATE TABLE Airports (
    Airport_ID INT PRIMARY KEY,
    Airport_Name VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE Aircrafts (
    Aircraft_ID INT PRIMARY KEY,
    Aircraft_Type VARCHAR(50),
    Capacity INT
);

CREATE TABLE Passengers (
    Passenger_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone_Number VARCHAR(20)
);

-- CREATE TABLE Flights (
--     Flight_ID INT PRIMARY KEY,
--     Flight_Number VARCHAR(10),
--     Departure_Time DATETIME,
--     Arrival_Time DATETIME,
--     Status VARCHAR(20),
--     Aircraft_ID INT FOREIGN KEY REFERENCES Aircrafts(Aircraft_ID),
--     Departure_Airport_ID INT FOREIGN KEY REFERENCES Airports(Airport_ID),
--     Arrival_Airport_ID INT FOREIGN KEY REFERENCES Airports(Airport_ID)
-- );

CREATE TABLE Flights
(
    Flight_ID INT NOT NULL,
    Flight_Number INT NOT NULL,
    Departure_Time DATE NOT NULL,
    Arrival_Time DATE NOT NULL,
    Departure_Airport_ID INT NOT NULL,
    Arrival_Airport_ID INT NOT NULL,
    Status VARCHAR(20) NOT NULL,
    Aircraft_ID INT NOT NULL,
    Airport_ID INT NOT NULL,
    Airline_ID INT NOT NULL,
    PRIMARY KEY (Flight_ID),
    FOREIGN KEY (Aircraft_ID) REFERENCES Aircrafts(Aircraft_ID),
    FOREIGN KEY (Airport_ID) REFERENCES Airports(Airport_ID),
    FOREIGN KEY (Airline_ID) REFERENCES Airlines(Airline_ID)
);

-- CREATE TABLE Booking (
--     Booking_ID INT PRIMARY KEY,
--     Flight_ID INT FOREIGN KEY REFERENCES Flights(Flight_ID),
--     Passenger_ID INT FOREIGN KEY REFERENCES Passengers(Passenger_ID),
--     Booking_Date DATE,
--     Seat_Number VARCHAR(10)
-- );

CREATE TABLE Bookings
(
    Booking_ID INT NOT NULL,
    Seat_Number VARCHAR(10) NOT NULL,
    Booking_Date INT NOT NULL,
    Passenger_ID INT NOT NULL,
    Flight_ID INT NOT NULL,
    PRIMARY KEY (Booking_Date, Passenger_ID, Flight_ID),
    FOREIGN KEY (Passenger_ID) REFERENCES Passengers(Passenger_ID),
    FOREIGN KEY (Flight_ID) REFERENCES Flights(Flight_ID)
);

-- CREATE TABLE CrewMembers (
--     Crew_ID INT PRIMARY KEY,
--     Name VARCHAR(100),
--     Role VARCHAR(50),
--     Contact_Number VARCHAR(20)
-- );

CREATE TABLE CrewMembers
(
    Crew_ID INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Role VARCHAR(20) NOT NULL,
    Contact_Number VARCHAR(20) NOT NULL,
    PRIMARY KEY (Crew_ID)
);