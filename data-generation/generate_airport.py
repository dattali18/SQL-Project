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
will be using the Faker library to generate the data
and the faker-airtravel library to generate the airport names
"""

from faker import Faker
from faker_airtravel import AirTravelProvider


TABLE_NAME = "Airports"
AIRPORT_ID = "AIRPORT_ID"
AIRPORT_NAME = "AIRPORT_NAME"
LOCATION = "LOCATION"

def generate(n: int = 200) -> None:
    """
    This function will generate n number of airports and insert them into a .csv file
    the names of the table and the different columns are defined as global variables
    we will be using the faker library to generate the data
    the .csv file will be stored in the same dir as the script in /DATA/ folder
    """    

    # create the faker object
    fake = Faker()
    fake.add_provider(AirTravelProvider)

    # create the .csv file
    with open(f"DATA/{TABLE_NAME}.csv", "w") as f:
        # write the header
        f.write(f"{AIRPORT_ID},{AIRPORT_NAME},{LOCATION}\n")
        # write the data
        for i in range(n):
            f.write(f"{i+1},{fake.airport_name()},{fake.airport_iata()}\n")


def main():
    generate()

if __name__ == "__main__":
    main()