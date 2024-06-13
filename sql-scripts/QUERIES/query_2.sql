-- **Query 1**: Retrieve the passenger names, flight numbers,
-- and departure/arrival times for all flights departing from 'JFK Airport New York'
-- on a specific date.
SELECT p.PASSENGER_NAME, f.FLIGHT_NUMBER, f.DEPARTURE_TIME, f.ARRIVAL_TIME
FROM Passengers p
         JOIN Bookings b ON p.PASSENGER_ID = b.PASSENGER_ID
         JOIN Flights f ON b.FLIGHT_ID = f.FLIGHT_ID
WHERE f.DEPARTURE_AIRPORT = (SELECT AIRPORT_ID FROM Airports WHERE Airports.Location = 'JFK')
  AND f.DEPARTURE_TIME >= '2023-06-01' AND f.DEPARTURE_TIME < '2023-06-02';