# Stage 1: Database Design and Implementation

## Implementation

### Enterprise: Airport

1. **Flights Management**
   - **Entities**: Flights, Airlines, Airports, Routes, Passengers, Crew Members, Aircrafts, Flight Status, Booking

2. **Goods & Services Management**
   - **Entities**: Goods (e.g., luggage, cargo), Services (e.g., parking, catering), Inventory, Suppliers, Service Requests, Service Providers, Contracts

3. **User Management**
   - **Entities**: Users (e.g., passengers, staff), Roles, Permissions, Accounts, Customer Feedback, Customer Support, Employee Records, Training Records

### Enterprise: Description

Our project focuses on emulating a part of an airport's database system. The database will manage various aspects of flight operations, passenger information, aircraft data, and more. This simulation aims to showcase the complexity and functionality required in a real-world airport setting.

The database will be designed to handle multiple entities such as flights, airlines, airports, passengers, crew members, aircraft, and bookings. Each entity plays a crucial role in the airport ecosystem, and the database will facilitate efficient management and interaction between these entities.

This project will help us understand and implement key database concepts such as entity-relationship modeling, normalization, and database management. It will also provide valuable experience in designing and implementing a database system for a complex real-world scenario.

### Schema & ERD

#### Entities for Flights Management:

1. **Flights**
   - **Attributes**: 
	   1. Flight_ID (Primary Key) : `INTEGER`
	   2. Flight_Number : `VARCHAR`
	   3. Departure_Time : `DATE`
	   4. Arrival_Time : `DATE`
	   5. Aircraft_ID (Foreign Key) : `INTEGER`
	   6. Departure_Airport_ID (Foreign Key) : `INTEGER`
	   7. Arrival_Airport_ID (Foreign Key): `INTEGER`
	   8. Status: `[READY, IN_AIR, LANDED]`
   - **Strong Entity**: Yes
   - **Relationships**:
     - One-to-One (1:1) with Aircraft
     - One-to-Many (1:M) with Airports

2. **Airlines**
   - **Attributes**: 
	   1. Airline_ID (Primary Key) : `INTEGER`
	   2. Airline_Name : `VARCHAR`
   - **Strong Entity**: Yes
   - **Relationships**:
     - One-to-Many (1:M) with Flights

3. **Airports**
   - **Attributes**: 
	   1. Airport_ID (Primary Key) : `INTEGER`
	   2. Airport_Name : `VARCHAR`
	   3. Location : `VARCHAR`
   - **Strong Entity**: Yes
   - **Relationships**:
     - One-to-Many (1:M) with Flights

4. **Passengers**
   - **Attributes**: 
	   1. Passenger_ID (Primary Key) : `INTEGER`
	   2. Name : `VARCHAR`
	   3. Email : `VARCHAR`
	   4. Phone_Number : `VARCHAR`
   - **Strong Entity**: Yes
   - **Relationships**:
     - Many-to-Many (M:M) with Flights (through a Booking table)

5. **Crew Members**
   - **Attributes**: 
	   1. Crew_ID (Primary Key) : `INTEGER`
	   2. Name : `VARCHAR`
	   3. Role : `[PILOT, STUARDS, MEDICAL]`
	   4. Contact_Number : `VARCHAR`
   - **Strong Entity**: Yes
   - **Relationships**:
     - One-to-Many (1:M) with Flights

6. **Aircrafts**
   - **Attributes**: 
	   1. Aircraft_ID (Primary Key) : `INTEGER`
	   2. Aircraft_Type : `VARCHAR`
	   3. Capacity : `INTEGER`
   - **Strong Entity**: Yes
   - **Relationships**:
     - One-to-Many (1:M) with Flights

7. **Booking**
    - **Attributes**: 
	    1. Booking_ID (Primary Key) : `INTEGER`
	    2. Flight_ID (Foreign Key) : `INTEGER`
	    3. Passenger_ID (Foreign Key) : `INTEGER`
	    4. Booking_Date : `DATE`
	    5. Seat_Number : `VARCHAR`
    - **Strong Entity**: No
	    - **Reason**: Because booking table has no meaning by itself, it as meaning only when attached to a certain flight
    - **Relationships**:
        - Many-to-Many (M:M) with Passengers (through Booking table)
        - Many-to-Many (M:M) with Flights (through Booking table)

#### DSD Diagram:

This diagram represents the relationships between the entities in the Flights Management part of the airport database system. Each entity is connected based on its relationship with other entities. If you need further adjustments or explanations, feel free to ask!

![dds](/screen-shots/stage-1/dds-1.png)
![dds](/screen-shots/stage-1/dds.png)


#### ER Diagram:

![erd](/screen-shots/stage-1/erd-1.png)

## SQL Code
This is the code that was generated using `claude`
```sql
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
```

This code was generated using `erdplus.com`

```sql
CREATE TABLE Airlines
(
  AIRLINE_ID INT NOT NULL,
  AIRLINE_NAME VARCHAR(50) NOT NULL,
  PRIMARY KEY (AIRLINE_ID)
);

CREATE TABLE Airports
(
  AIRPORT_ID INT NOT NULL,
  AIRPORT_NAME VARCHAR(100) NOT NULL,
  LOCATION VARCHAR(100) NOT NULL,
  PRIMARY KEY (AIRPORT_ID)
);

CREATE TABLE Aircrafts
(
  AIRCRAFT_ID INT NOT NULL,
  AIRCRAFT_TYPE VARCHAR(50) NOT NULL,
  CAPACITY INT NOT NULL,
  PRIMARY KEY (AIRCRAFT_ID)
);

CREATE TABLE Passengers
(
  P_ID INT NOT NULL,
  P_NAME VARCHAR(100) NOT NULL,
  P_PHONE VARCHAR(100) NOT NULL,
  P_EMAIL VARCHAR(20) NOT NULL,
  PRIMARY KEY (P_ID)
);

CREATE TABLE Flights
(
  F_ID INT NOT NULL,
  F_NUMBER INT NOT NULL,
  DEPARTURE_TIME DATE NOT NULL,
  ARRIVAL_TIME DATE NOT NULL,
  AIRCRAFT_ID INT NOT NULL,
  DEPARTURE_AIRPORT_ID INT NOT NULL,
  ARRIVAL_AIRPORT_ID INT NOT NULL,
  F_STATUS VARCHAR(20) NOT NULL,
  AIRCRAFT_ID INT NOT NULL,
  AIRPORT_ID INT NOT NULL,
  AIRLINE_ID INT NOT NULL,
  PRIMARY KEY (F_ID),
  FOREIGN KEY (AIRCRAFT_ID) REFERENCES Aircrafts(AIRCRAFT_ID),
  FOREIGN KEY (AIRPORT_ID) REFERENCES Airports(AIRPORT_ID),
  FOREIGN KEY (AIRLINE_ID) REFERENCES Airlines(AIRLINE_ID)
);

CREATE TABLE Booking
(
  B_ID INT NOT NULL,
  SEAT_NUMBER VARCHAR(10) NOT NULL,
  BOOKING_DATE INT NOT NULL,
  P_ID INT NOT NULL,
  F_ID INT NOT NULL,
  PRIMARY KEY (B_ID, P_ID, F_ID),
  FOREIGN KEY (P_ID) REFERENCES Passengers(P_ID),
  FOREIGN KEY (F_ID) REFERENCES Flights(F_ID)
);

CREATE TABLE CrewMembers
(
  CREW_ID INT NOT NULL,
  CREW_NAME VARCHAR(100) NOT NULL,
  CREW_ROLE VARCHAR(20) NOT NULL,
  F_ID INT NOT NULL,
  PRIMARY KEY (CREW_ID),
  FOREIGN KEY (F_ID) REFERENCES Flights(F_ID)
);
```
