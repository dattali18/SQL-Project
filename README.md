# SQL Project

This is the repo for the sql-project course
The course is in 4 part

- creating the database
    - designing the database
    - drawing the er Diagram
    - drawing the `dsd` Diagram
    - creating the creation script in `SQL`
    - creating the  drop script in `SQl`
    - add data to the database


## ERD Diagram

```mermaid
erDiagram
    AIRLINES {
        Airline_ID INT PK
        Airline_Name VARCHAR
    }
    AIRPORTS {
        Airport_ID INT PK
        Airport_Name VARCHAR
        Location VARCHAR
    }
    AIRCRAFT {
        Aircraft_ID INT PK
        Aircraft_Type VARCHAR
        Capacity INT
    }
    PASSENGERS {
        Passenger_ID INT PK
        Name VARCHAR
        Email VARCHAR
        Phone_Number VARCHAR
    }
    FLIGHTS {
        Flight_ID INT PK
        Flight_Number VARCHAR
        Departure_Time DATETIME
        Arrival_Time DATETIME
        Aircraft_ID INT FK 
        Departure_Airport_ID INT FK 
        Arrival_Airport_ID INT FK 
        Status VARCHAR
    }
    BOOKING {
        Booking_ID INT PK
        Flight_ID INT FK 
        Passenger_ID INT FK 
        Booking_Date DATE
        Seat_Number VARCHAR
    }
    CREW_MEMBERS {
        Crew_ID INT PK
        Name VARCHAR
        Role VARCHAR
        Contact_Number VARCHAR
    }

    AIRLINES ||--o{ FLIGHTS : "Operates"
    AIRPORTS ||--o{ FLIGHTS : "Departure/Arrival"
    AIRCRAFT ||--o{ FLIGHTS : "Assigned to"
    FLIGHTS ||--o{ BOOKING : "Has"
    FLIGHTS ||--o{ CREW_MEMBERS : "Has"
    PASSENGERS ||--o{ BOOKING : "Books"
```

![erd](/screen-shots/stage-1/erd-2.png)