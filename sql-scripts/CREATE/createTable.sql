CREATE TABLE Airlines (
    AIRLINE_ID INT PRIMARY KEY,
    AIRLINE_NAME VARCHAR(100)
);

CREATE TABLE Airports (
    AIRPORT_ID INT PRIMARY KEY,
    AIRPORT_NAME VARCHAR(10),
    LOCATION VARCHAR(100)
);

CREATE TABLE Aircraft (
    AIRCRAFT_ID INT PRIMARY KEY,
    AIRCRAFT_TYPE VARCHAR(100),
    CAPACITY INT
);

CREATE TABLE Passengers (
    PASSENGER_ID INT PRIMARY KEY,
    PASSENGER_NAME VARCHAR(100),
    PASSPORT_NUMBER VARCHAR(50),
    PASSENGER_EMAIL VARCHAR(120),
    PASSENGER_PHONE VARCHAR(20),
    PASSENGER_AGE INT
);

CREATE TABLE Flights
(
    FLIGHT_ID INT NOT NULL,
    FLIGHT_NUMBER varchar(15) NOT NULL,
    DEPARTURE_TIME DATE NOT NULL,
    ARRIVAL_TIME DATE NOT NULL,
    DEPARTURE_AIRPORT INT NOT NULL,
    ARRIVAL_AIRPORT INT NOT NULL,
    FLIGHT_STATUS VARCHAR(20) NOT NULL,
    AIRCRAFT_ID INT NOT NULL,
    AIRPORT_ID INT NOT NULL,
    AIRLINE_ID INT NOT NULL,
    PRIMARY KEY (FLIGHT_ID),
    FOREIGN KEY (AIRCRAFT_ID) REFERENCES Aircraft(AIRCRAFT_ID),
    FOREIGN KEY (AIRPORT_ID) REFERENCES Airports(AIRPORT_ID),
    FOREIGN KEY (AIRLINE_ID) REFERENCES Airlines(AIRLINE_ID)
);


CREATE TABLE Bookings
(
    BOOKING_ID INT NOT NULL,
    SEAT_NUMBER VARCHAR(10) NOT NULL,
    BOOKING_DATE INT NOT NULL,
    PASSENGER_ID INT NOT NULL,
    FLIGHT_ID INT NOT NULL,
    PRIMARY KEY (BOOKING_DATE, PASSENGER_ID, FLIGHT_ID),
    FOREIGN KEY (PASSENGER_ID) REFERENCES Passengers(PASSENGER_ID),
    FOREIGN KEY (FLIGHT_ID) REFERENCES Flights(FLIGHT_ID)
);

CREATE TABLE CrewMembers
(
    CREW_ID INT NOT NULL,
    CREW_NAME VARCHAR(100) NOT NULL,
    CREW_ROLE VARCHAR(50) NOT NULL,
    PRIMARY KEY (CREW_ID)
    FOREIGN KEY (FLIGHT_ID) REFERENCES Flights(FLIGHT_ID)
);