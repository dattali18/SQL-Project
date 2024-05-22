-- Description: Query 1
-- Author: Daniel Attali
-- Return: Number of children under 8 years old that have a booking on a
--         flight that departs from airport 1000 after a certain date

SELECT COUNT(*) AS NumberOfChildren
FROM Flights
         JOIN Bookings ON Flights.FLIGHT_ID = Bookings.FLIGHT_ID
         JOIN Passengers ON Bookings.PASSENGER_ID = Passengers.PASSENGER_ID
WHERE Flights.DEPARTURE_AIRPORT = 1000
  AND Flights.DEPARTURE_TIME >= '2024-04-28'
  AND Passengers.PASSENGER_AGE < 8;