USE citibike_db;

-- Creating nyc_weather raw table
CREATE TABLE IF NOT EXISTS nyc_weather_raw (
	`DATE` TEXT,
    AWND TEXT,
    PRCP DOUBLE,
    SNOW DOUBLE,
    SNWD DOUBLE,
    TMAX INT,
    TMIN INT
    );
    
-- Loading the vakues into the nyc_weather raw table
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/NYC_weather.csv"
INTO TABLE nyc_weather_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY'\n'
IGNORE 1 ROWS;

-- creating a table for citibike raw data
CREATE TABLE IF NOT EXISTS citibike_raw (
	tripduration INT,
    starttime TEXT,
    stoptime TEXT,
    startstationid TEXT,
    startstationame TEXT,
    startstationlatitude DOUBLE,
    startstationlongitude DOUBLE,
    endstationid TEXT,
    endstationname TEXT,
    endstationlatitude DOUBLE,
    endstationlongitude DOUBLE,
    bikeid INT,
    usertype TEXT,
    birthyear INT,
    gender int
    );

-- Inserting values into the citibike raw data for the month of january
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/1_January/201901-citibike-tripdata_1.csv"
INTO TABLE citibike_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Inserting values into the citibike raw data for the month of February
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/2_February/201902-citibike-tripdata_1.csv"
INTO TABLE citibike_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Inserting values into the citibike raw data for the month of March 1st part
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/3_March/201903-citibike-tripdata_1.csv"
INTO TABLE citibike_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Inserting values into the citibike raw data for the month of March 2nd part
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/3_March/201903-citibike-tripdata_2.csv"
INTO TABLE citibike_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Inserting values into the citibike raw data for the month of April 1st part
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/4_April/201904-citibike-tripdata_1.csv"
INTO TABLE citibike_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Inserting values into the citibike raw data for the month of April 2nd part
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/4_April/201904-citibike-tripdata_2.csv"
INTO TABLE citibike_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Inserting values into the citibike raw data for the month of May 1st part
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/5_May/201905-citibike-tripdata_1.csv"
INTO TABLE citibike_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Inserting values into the citibike raw data for the month of May 2nd part
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/5_May/201905-citibike-tripdata_2.csv"
INTO TABLE citibike_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Inserting values into the citibike raw data for the month of June 1st part
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/6_June/201906-citibike-tripdata_1.csv"
INTO TABLE citibike_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Inserting values into the citibike raw data for the month of June 2nd part
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/6_June/201906-citibike-tripdata_2.csv"
INTO TABLE citibike_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Inserting values into the citibike raw data for the month of June 3rd part
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/6_June/201906-citibike-tripdata_3.csv"
INTO TABLE citibike_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;