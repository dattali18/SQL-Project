# FLIGHT_ID,FLIGHT_NUMBER,DEPARTURE_TIME,ARRIVAL_TIME,DEPARTURE_AIRPORT,ARRIVAL_AIRPORT,FLIGHT_STATUS,AIRCRAFT_ID,AIRLINE_ID
# the line above is the first line in the Flight.csv file located in the data folder
# this program will use pandas to load the data and
# 1. will change the ARRIVAL_TIME - DEPARTURE_AIRPORT to be at most 24 hours

import pandas as pd
import random
import datetime

def load_data(file_name="Flights-2.csv") -> pd.DataFrame:
    return pd.read_csv(file_name)

def change_time(data: pd.DataFrame) -> pd.DataFrame:
    # take a number between 3 - 24 with a normal distribution
    # add that number to the departure time

    # in this part of the code we make sure the the departure time start with a normal number
    # such as 12:00 or 12:15 or 12:30 or 12:45 etc but not 14:34
    # but still with a date

    data["DEPARTURE_TIME"] = pd.to_datetime(data["DEPARTURE_TIME"])
    data["DEPARTURE_TIME"] = data["DEPARTURE_TIME"].dt.floor("15min")

    # print(data["DEPARTURE_TIME"].head())

    random.seed(42)
    hours = random.normalvariate(13.5, 5)

    # # using the datetime module to add hours to the departure time

    data["DEPARTURE_TIME"] = pd.to_datetime(data["DEPARTURE_TIME"])
    data["ARRIVAL_TIME"] = data["DEPARTURE_TIME"] + datetime.timedelta(hours=hours)
    # rounding the time to the nearest 15 minutes
    data["ARRIVAL_TIME"] = data["ARRIVAL_TIME"].dt.floor("15min")

    # # make sure the the time is a valid sql time
    # data["ARRIVAL_TIME"] = data["ARRIVAL_TIME"]
    # data["DEPARTURE_TIME"] = data["DEPARTURE_TIME"].dt.time

    data["ARRIVAL_TIME"] = data["ARRIVAL_TIME"].astype(str)
    data["DEPARTURE_TIME"] = data["DEPARTURE_TIME"].astype(str)

    # this is a date in the arrival col 2024-05-15 15:43:35.874151
    # what is the .874151 in the end
    # the time is not rounded to the nearest 15 minutes

    # this is before 2024-05-04 21:56:48
    # this is after 01:00:00
    # there is no date

    return data

def write_data(data: pd.DataFrame) -> None:
    data.to_csv("Flight2-v2.csv", index=False)


def main() -> None:
    data = load_data()
    data = change_time(data)
    write_data(data)


if __name__ == "__main__":
    main()
