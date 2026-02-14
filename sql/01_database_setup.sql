Create DATABASE IF NOT EXISTS citibike_db;

USE citibike_db;

CREATE TABLE IF NOT EXISTS citibike_raw ( 
	Trip_duration INT,
    start_time TEXT,
    stop_time TEXT,
    start_station_id INT,
    start_station_name TEXT,
    start_station_latitude DOUBLE,
    start_station_longitude DOUBLE,
    end_station_id INT,
    end_station_name TEXT,
    end_station_latitude DOUBLE,
    end_station_longitude DOUBLE,
    bike_id INT,
    usertype TEXT,
    birth_year TEXT,
    gender INT
    );
    
-- January month data
    
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/1_January/201901-citibike-tripdata_1.csv"
INTO TABLE citibike_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@trip_duration,
 @start_time,
 @stop_time,
 @start_station_id,
 @start_station_name,
 @start_station_latitude,
 @start_station_longitude,
 @end_station_id,
 @end_station_name,
 @end_station_latitude,
 @end_station_longitude,
 @bike_id,
 @usertype,
 @birth_year,
 @gender)
SET
trip_duration = NULLIF(@trip_duration, ''),
start_time = NULLIF(@start_time, ''),
stop_time = NULLIF(@stop_time, ''),
start_station_id = NULLIF(@start_station_id, ''),
start_station_name = NULLIF(@start_station_name, ''),
start_station_latitude = NULLIF(@start_station_latitude, ''),
start_station_longitude = NULLIF(@start_station_longitude, ''),
end_station_id = NULLIF(@end_station_id, ''),
end_station_name = NULLIF(@end_station_name, ''),
end_station_latitude = NULLIF(@end_station_latitude, ''),
end_station_longitude = NULLIF(@end_station_longitude, ''),
bike_id = NULLIF(@bike_id, ''),
usertype = NULLIF(@usertype, ''),
birth_year = NULLIF(@birth_year, ''),
gender = NULLIF(@gender, '');

-- February month data

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/2_February/201902-citibike-tripdata_1.csv"
INTO TABLE citibike_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@trip_duration,
 @start_time,
 @stop_time,
 @start_station_id,
 @start_station_name,
 @start_station_latitude,
 @start_station_longitude,
 @end_station_id,
 @end_station_name,
 @end_station_latitude,
 @end_station_longitude,
 @bike_id,
 @usertype,
 @birth_year,
 @gender)
SET
trip_duration = NULLIF(@trip_duration, ''),
start_time = NULLIF(@start_time, ''),
stop_time = NULLIF(@stop_time, ''),
start_station_id = NULLIF(@start_station_id, ''),
start_station_name = NULLIF(@start_station_name, ''),
start_station_latitude = NULLIF(@start_station_latitude, ''),
start_station_longitude = NULLIF(@start_station_longitude, ''),
end_station_id = NULLIF(@end_station_id, ''),
end_station_name = NULLIF(@end_station_name, ''),
end_station_latitude = NULLIF(@end_station_latitude, ''),
end_station_longitude = NULLIF(@end_station_longitude, ''),
bike_id = NULLIF(@bike_id, ''),
usertype = NULLIF(@usertype, ''),
birth_year = NULLIF(@birth_year, ''),
gender = NULLIF(@gender, '');

-- March month data

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/3_March/201903-citibike-tripdata_1.csv"
INTO TABLE citibike_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@trip_duration,
 @start_time,
 @stop_time,
 @start_station_id,
 @start_station_name,
 @start_station_latitude,
 @start_station_longitude,
 @end_station_id,
 @end_station_name,
 @end_station_latitude,
 @end_station_longitude,
 @bike_id,
 @usertype,
 @birth_year,
 @gender)
SET
trip_duration = NULLIF(@trip_duration, ''),
start_time = NULLIF(@start_time, ''),
stop_time = NULLIF(@stop_time, ''),
start_station_id = NULLIF(@start_station_id, ''),
start_station_name = NULLIF(@start_station_name, ''),
start_station_latitude = NULLIF(@start_station_latitude, ''),
start_station_longitude = NULLIF(@start_station_longitude, ''),
end_station_id = NULLIF(@end_station_id, ''),
end_station_name = NULLIF(@end_station_name, ''),
end_station_latitude = NULLIF(@end_station_latitude, ''),
end_station_longitude = NULLIF(@end_station_longitude, ''),
bike_id = NULLIF(@bike_id, ''),
usertype = NULLIF(@usertype, ''),
birth_year = NULLIF(@birth_year, ''),
gender = NULLIF(@gender, '');

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/3_March/201903-citibike-tripdata_2.csv"
INTO TABLE citibike_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@trip_duration,
 @start_time,
 @stop_time,
 @start_station_id,
 @start_station_name,
 @start_station_latitude,
 @start_station_longitude,
 @end_station_id,
 @end_station_name,
 @end_station_latitude,
 @end_station_longitude,
 @bike_id,
 @usertype,
 @birth_year,
 @gender)
SET
trip_duration = NULLIF(@trip_duration, ''),
start_time = NULLIF(@start_time, ''),
stop_time = NULLIF(@stop_time, ''),
start_station_id = NULLIF(@start_station_id, ''),
start_station_name = NULLIF(@start_station_name, ''),
start_station_latitude = NULLIF(@start_station_latitude, ''),
start_station_longitude = NULLIF(@start_station_longitude, ''),
end_station_id = NULLIF(@end_station_id, ''),
end_station_name = NULLIF(@end_station_name, ''),
end_station_latitude = NULLIF(@end_station_latitude, ''),
end_station_longitude = NULLIF(@end_station_longitude, ''),
bike_id = NULLIF(@bike_id, ''),
usertype = NULLIF(@usertype, ''),
birth_year = NULLIF(@birth_year, ''),
gender = NULLIF(@gender, '');

-- April month data

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/4_April/201904-citibike-tripdata_1.csv"
INTO TABLE citibike_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@trip_duration,
 @start_time,
 @stop_time,
 @start_station_id,
 @start_station_name,
 @start_station_latitude,
 @start_station_longitude,
 @end_station_id,
 @end_station_name,
 @end_station_latitude,
 @end_station_longitude,
 @bike_id,
 @usertype,
 @birth_year,
 @gender)
SET
trip_duration = NULLIF(@trip_duration, ''),
start_time = NULLIF(@start_time, ''),
stop_time = NULLIF(@stop_time, ''),
start_station_id = NULLIF(@start_station_id, ''),
start_station_name = NULLIF(@start_station_name, ''),
start_station_latitude = NULLIF(@start_station_latitude, ''),
start_station_longitude = NULLIF(@start_station_longitude, ''),
end_station_id = NULLIF(@end_station_id, ''),
end_station_name = NULLIF(@end_station_name, ''),
end_station_latitude = NULLIF(@end_station_latitude, ''),
end_station_longitude = NULLIF(@end_station_longitude, ''),
bike_id = NULLIF(@bike_id, ''),
usertype = NULLIF(@usertype, ''),
birth_year = NULLIF(@birth_year, ''),
gender = NULLIF(@gender, '');

-- April month data 2nd part

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/4_April/201904-citibike-tripdata_2.csv"
INTO TABLE citibike_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@trip_duration,
 @start_time,
 @stop_time,
 @start_station_id,
 @start_station_name,
 @start_station_latitude,
 @start_station_longitude,
 @end_station_id,
 @end_station_name,
 @end_station_latitude,
 @end_station_longitude,
 @bike_id,
 @usertype,
 @birth_year,
 @gender)
SET
trip_duration = NULLIF(@trip_duration, ''),
start_time = NULLIF(@start_time, ''),
stop_time = NULLIF(@stop_time, ''),
start_station_id = NULLIF(@start_station_id, ''),
start_station_name = NULLIF(@start_station_name, ''),
start_station_latitude = NULLIF(@start_station_latitude, ''),
start_station_longitude = NULLIF(@start_station_longitude, ''),
end_station_id = NULLIF(@end_station_id, ''),
end_station_name = NULLIF(@end_station_name, ''),
end_station_latitude = NULLIF(@end_station_latitude, ''),
end_station_longitude = NULLIF(@end_station_longitude, ''),
bike_id = NULLIF(@bike_id, ''),
usertype = NULLIF(@usertype, ''),
birth_year = NULLIF(@birth_year, ''),
gender = NULLIF(@gender, '');

-- May month data 1st part

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/5_May/201905-citibike-tripdata_1.csv"
INTO TABLE citibike_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@trip_duration,
 @start_time,
 @stop_time,
 @start_station_id,
 @start_station_name,
 @start_station_latitude,
 @start_station_longitude,
 @end_station_id,
 @end_station_name,
 @end_station_latitude,
 @end_station_longitude,
 @bike_id,
 @usertype,
 @birth_year,
 @gender)
SET
trip_duration = NULLIF(@trip_duration, ''),
start_time = NULLIF(@start_time, ''),
stop_time = NULLIF(@stop_time, ''),
start_station_id = NULLIF(@start_station_id, ''),
start_station_name = NULLIF(@start_station_name, ''),
start_station_latitude = NULLIF(@start_station_latitude, ''),
start_station_longitude = NULLIF(@start_station_longitude, ''),
end_station_id = NULLIF(@end_station_id, ''),
end_station_name = NULLIF(@end_station_name, ''),
end_station_latitude = NULLIF(@end_station_latitude, ''),
end_station_longitude = NULLIF(@end_station_longitude, ''),
bike_id = NULLIF(@bike_id, ''),
usertype = NULLIF(@usertype, ''),
birth_year = NULLIF(@birth_year, ''),
gender = NULLIF(@gender, '');

-- May month data 2nd part

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/5_May/201905-citibike-tripdata_2.csv"
INTO TABLE citibike_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@trip_duration,
 @start_time,
 @stop_time,
 @start_station_id,
 @start_station_name,
 @start_station_latitude,
 @start_station_longitude,
 @end_station_id,
 @end_station_name,
 @end_station_latitude,
 @end_station_longitude,
 @bike_id,
 @usertype,
 @birth_year,
 @gender)
SET
trip_duration = NULLIF(@trip_duration, ''),
start_time = NULLIF(@start_time, ''),
stop_time = NULLIF(@stop_time, ''),
start_station_id = NULLIF(@start_station_id, ''),
start_station_name = NULLIF(@start_station_name, ''),
start_station_latitude = NULLIF(@start_station_latitude, ''),
start_station_longitude = NULLIF(@start_station_longitude, ''),
end_station_id = NULLIF(@end_station_id, ''),
end_station_name = NULLIF(@end_station_name, ''),
end_station_latitude = NULLIF(@end_station_latitude, ''),
end_station_longitude = NULLIF(@end_station_longitude, ''),
bike_id = NULLIF(@bike_id, ''),
usertype = NULLIF(@usertype, ''),
birth_year = NULLIF(@birth_year, ''),
gender = NULLIF(@gender, '');

-- June month data 1st part

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/6_June/201906-citibike-tripdata_1.csv"
INTO TABLE citibike_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@trip_duration,
 @start_time,
 @stop_time,
 @start_station_id,
 @start_station_name,
 @start_station_latitude,
 @start_station_longitude,
 @end_station_id,
 @end_station_name,
 @end_station_latitude,
 @end_station_longitude,
 @bike_id,
 @usertype,
 @birth_year,
 @gender)
SET
trip_duration = NULLIF(@trip_duration, ''),
start_time = NULLIF(@start_time, ''),
stop_time = NULLIF(@stop_time, ''),
start_station_id = NULLIF(@start_station_id, ''),
start_station_name = NULLIF(@start_station_name, ''),
start_station_latitude = NULLIF(@start_station_latitude, ''),
start_station_longitude = NULLIF(@start_station_longitude, ''),
end_station_id = NULLIF(@end_station_id, ''),
end_station_name = NULLIF(@end_station_name, ''),
end_station_latitude = NULLIF(@end_station_latitude, ''),
end_station_longitude = NULLIF(@end_station_longitude, ''),
bike_id = NULLIF(@bike_id, ''),
usertype = NULLIF(@usertype, ''),
birth_year = NULLIF(@birth_year, ''),
gender = NULLIF(@gender, '');

-- June month data 2nd part

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/6_June/201906-citibike-tripdata_2.csv"
INTO TABLE citibike_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@trip_duration,
 @start_time,
 @stop_time,
 @start_station_id,
 @start_station_name,
 @start_station_latitude,
 @start_station_longitude,
 @end_station_id,
 @end_station_name,
 @end_station_latitude,
 @end_station_longitude,
 @bike_id,
 @usertype,
 @birth_year,
 @gender)
SET
trip_duration = NULLIF(@trip_duration, ''),
start_time = NULLIF(@start_time, ''),
stop_time = NULLIF(@stop_time, ''),
start_station_id = NULLIF(@start_station_id, ''),
start_station_name = NULLIF(@start_station_name, ''),
start_station_latitude = NULLIF(@start_station_latitude, ''),
start_station_longitude = NULLIF(@start_station_longitude, ''),
end_station_id = NULLIF(@end_station_id, ''),
end_station_name = NULLIF(@end_station_name, ''),
end_station_latitude = NULLIF(@end_station_latitude, ''),
end_station_longitude = NULLIF(@end_station_longitude, ''),
bike_id = NULLIF(@bike_id, ''),
usertype = NULLIF(@usertype, ''),
birth_year = NULLIF(@birth_year, ''),
gender = NULLIF(@gender, '');

-- June month data 3rd part

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/6_June/201906-citibike-tripdata_3.csv"
INTO TABLE citibike_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@trip_duration,
 @start_time,
 @stop_time,
 @start_station_id,
 @start_station_name,
 @start_station_latitude,
 @start_station_longitude,
 @end_station_id,
 @end_station_name,
 @end_station_latitude,
 @end_station_longitude,
 @bike_id,
 @usertype,
 @birth_year,
 @gender)
SET
trip_duration = NULLIF(@trip_duration, ''),
start_time = NULLIF(@start_time, ''),
stop_time = NULLIF(@stop_time, ''),
start_station_id = NULLIF(@start_station_id, ''),
start_station_name = NULLIF(@start_station_name, ''),
start_station_latitude = NULLIF(@start_station_latitude, ''),
start_station_longitude = NULLIF(@start_station_longitude, ''),
end_station_id = NULLIF(@end_station_id, ''),
end_station_name = NULLIF(@end_station_name, ''),
end_station_latitude = NULLIF(@end_station_latitude, ''),
end_station_longitude = NULLIF(@end_station_longitude, ''),
bike_id = NULLIF(@bike_id, ''),
usertype = NULLIF(@usertype, ''),
birth_year = NULLIF(@birth_year, ''),
gender = NULLIF(@gender, '');

RENAME TABLE citibike TO citibike_raw;

-- Importing NYC 2019 complete weather dataset
CREATE TABLE IF NOT EXISTS NYC_weather_raw (
 `DATE` TEXT,
 AWND DOUBLE,
 PRCP DOUBLE,
 SNOW DOUBLE, 
 SNWD DOUBLE,
 TAVG INT,
 TMAX INT,
 TMIN INT
 );
 
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2019-citibike-tripdata/NYCWeatherComplete.csv"
INTO TABLE NYC_weather_raw 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
