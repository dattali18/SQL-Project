"""
in this module we will generate data and insert script in .sql
for our database for the Airports table
script: 
```sql
CREATE TABLE Airports (
    AIRPORT_ID INT PRIMARY KEY,
    AIRPORT_NAME VARCHAR(10),
    LOCATION VARCHAR(100)
);
```
"""

TABLE_NAME = "Airports"
AIRPORT_ID = "AIRPORT_ID"
AIRPORT_NAME = "AIRPORT_NAME"
LOCATION = "LOCATION"

def generate_airport_code(n: int = 200) -> list[str]:
    pass

def generate_airport_location(n: int = 200) -> list[str]:
    pass

def generate(n: int = 200) -> None:
    pass
