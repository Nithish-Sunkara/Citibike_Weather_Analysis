USE citibike_db;

-- creating a staging table for nyc weather
CREATE TABLE IF NOT EXISTS nyc_weather_staging AS 
SELECT * FROM nyc_weather_raw;

-- Checking whether all the rows have been imported into the staging table
SELECT
    (SELECT COUNT(*) FROM nyc_weather_raw) AS Raw_Count,
    (SELECT COUNT(*) FROM nyc_weather_staging) AS Staging_Count;
    
-- Creating a staging table for citibike
CREATE TABLE IF NOT EXISTS citibike_staging AS
SELECT * FROM citibike_raw;

SELECT 
	(SELECT COUNT(*) FROM citibike_raw) AS Raw_Count,
    (SELECT COUNT(*) FROM citibike_staging) AS Staging_Count;

DESCRIBE nyc_weather_staging;

-- Renaming the nyc weather staging table column names
ALTER TABLE nyc_weather_staging
RENAME COLUMN `DATE` TO weather_date,
RENAME COLUMN AWND TO avg_wind_speed,
RENAME COLUMN PRCP TO precipitation,
RENAME COLUMN SNOW TO snow,
RENAME COLUMN SNWD TO snow_depth,
RENAME COLUMN TMAX TO max_temp,
RENAME COLUMN TMIN TO min_temp;

-- changing to correct data types
ALTER TABLE nyc_weather_staging
MODIFY COLUMN precipitation DECIMAL (9,6),
MODIFY COLUMN snow DECIMAL (9,6),
MODIFY COLUMN snow_depth DECIMAL (9,6),
ADD COLUMN Avg_temp FLOAT;

-- adding avg temperature column and deriving the values from max and min temperature
UPDATE nyc_weather_staging
SET Avg_temp = (max_temp + min_temp)/2;

SELECT * FROM nyc_weather_staging;

DESCRIBE nyc_weather_staging;

-- Converting the dates from the string 
UPDATE nyc_weather_staging
SET weather_date = str_to_date(weather_date, '%m/%d/%Y');

-- changing the weather date column datatype to date
ALTER TABLE nyc_weather_staging
MODIFY COLUMN weather_date DATE;

-- changing the blank or missing values to null in the avg wind speed column
UPDATE nyc_weather_staging
SET avg_wind_speed = NULL
WHERE avg_wind_speed = '';

SELECT * FROM nyc_weather_staging;

-- changing the datatype from text to decimal for the averge wind speed column
ALTER TABLE nyc_weather_staging
MODIFY COLUMN avg_wind_speed DECIMAL (6,2);

DESCRIBE nyc_weather_staging;

DESCRIBE citibike_staging;

-- Renaming the citibike staging table column names
ALTER TABLE citibike_staging
RENAME COLUMN tripduration TO trip_duration,
RENAME COLUMN starttime TO start_time,
RENAME COLUMN stoptime TO stop_time,
RENAME COLUMN startstationid TO start_station_id,
RENAME COLUMN startstationame TO start_station_name,
RENAME COLUMN startstationlatitude TO start_station_latitude,
RENAME COLUMN startstationlongitude TO start_station_longitude,
RENAME COLUMN endstationid TO end_station_id,
RENAME COLUMN endstationname TO end_station_name,
RENAME COLUMN endstationlatitude TO end_station_latitude,
RENAME COLUMN endstationlongitude TO end_station_longitude,
RENAME COLUMN bikeid TO bike_id,
RENAME COLUMN usertype TO user_type,
RENAME COLUMN birthyear TO birth_year;

DESCRIBE citibike_staging;

SELECT * FROM citibike_staging;

-- standardizing the text
UPDATE citibike_staging
SET start_station_name = CONCAT(
							UPPER(LEFT(REGEXP_REPLACE(TRIM(start_station_name), '\\s+', ' '), 1)),
							LOWER(SUBSTRING(REGEXP_REPLACE(TRIM(start_station_name), '\\s+', ' '), 2))
								);

UPDATE citibike_staging
SET end_station_name = CONCAT(
							UPPER(LEFT(REGEXP_REPLACE(TRIM(end_station_name), '\\s+', ' '), 1)),
							LOWER(SUBSTRING(REGEXP_REPLACE(TRIM(end_station_name), '\\s+', ' '), 2))
							);
    
UPDATE citibike_staging
SET user_type = CONCAT (
					UPPER(LEFT(TRIM(User_type),1)),
                    LOWER(SUBSTRING(TRIM(user_type),2))
                    );
-- checking the invalid birth years
SELECT birth_year 
FROM  citibike_staging
WHERE birth_year <= 1901 OR birth_year >= 2010;

-- checking the count of the ivalid birth years
SELECT count(*) AS Invalid_Birth_Years
FROM citibike_staging
WHERE birth_year <= 1901 OR birth_year >= 2010;

-- replacing the invalid birth year column values with null
UPDATE citibike_staging
SET birth_year = NULL
WHERE birth_year <= 1901 OR birth_year >= 2010;

-- checking if the values have been update correctly or not
SELECT COUNT(*) FROM citibike_staging
WHERE birth_year IS NULL;

-- checking if there are no additional invalid birth years
SELECT COUNT(*) AS remaining_invalid
FROM citibike_staging
WHERE birth_year < 1901
   OR birth_year > 2010;

-- checking invalid station id's
SELECT COUNT(*)
FROM citibike_staging
WHERE start_station_id = '';
 
-- updating them to null
UPDATE citibike_staging
SET start_station_id = NULL
WHERE start_station_id = '';

-- checking if all the invalid ones are replced to null by ensuring the count
SELECT COUNT(*) 
FROM citibike_staging
WHERE start_station_id IS NULL;

-- checking invalid station id's
SELECT COUNT(*)
FROM citibike_staging
WHERE end_station_id = '';

-- updating them to null
UPDATE citibike_staging
SET end_station_id = NULL
WHERE end_station_id = '';

-- checking if all the invalid ones are replced to null by ensuring the count
SELECT COUNT(*) 
FROM citibike_staging
WHERE start_station_id IS NULL;

-- changing the datatypes of the columns in the citibike staging table and also adding the primary key by adding an extra column called ride_id
ALTER TABLE citibike_staging
ADD COLUMN ride_id BIGINT AUTO_INCREMENT PRIMARY KEY,
MODIFY COLUMN start_time DATETIME,
MODIFY COLUMN stop_time DATETIME,
MODIFY COLUMN start_station_id INT,
MODIFY COLUMN start_station_name VARCHAR(255),
MODIFY COLUMN start_station_latitude DECIMAL(9,6),
MODIFY COLUMN start_station_longitude DECIMAL(9,6),
MODIFY COLUMN end_station_id INT,
MODIFY COLUMN end_station_name VARCHAR(255),
MODIFY COLUMN end_station_latitude DECIMAL (9,6),
MODIFY COLUMN end_station_longitude DECIMAL (9,6),
MODIFY COLUMN user_type VARCHAR(20),
MODIFY COLUMN birth_year YEAR;

-- ADdding date and time columns to the citibike staging table
ALTER TABLE citibike_staging
ADD COLUMN Trip_start_date DATE,
ADD COLUMN Trip_end_date DATE,
ADD COLUMN Trip_start_time TIME,
ADD COLUMN Trip_end_time TIME;

-- To check whether the columns have been created in the straging table or not
SELECT Trip_start_date, Trip_end_date, Trip_start_time, Trip_end_time
FROM citibike_staging;

-- updating the date and time columns with the values
UPDATE citibike_staging
SET 
	Trip_start_date = DATE(start_time),
	Trip_end_date = DATE(stop_time),
    Trip_start_time = TIME(start_time),
    Trip_end_time = TIME(stop_time);

SELECT start_time, stop_time, Trip_start_date, Trip_end_date, Trip_start_time, Trip_end_time
FROM citibike_staging;

SELECT * FROM citibike_staging;

-- Adding the primary key to the table 
ALTER TABLE citibike_staging
ADD COLUMN ride_id BIGINT AUTO_INCREMENT PRIMARY KEY;

DESCRIBE citibike_staging;

-- Adding start hour, day of week , month, season columns
ALTER TABLE citibike_staging
ADD COLUMN start_hour INT,
ADD COLUMN day_of_week VARCHAR(15),
ADD COLUMN `month` INT,
ADD COLUMN season VARCHAR(10);

-- Updating the values into start hour, day of week , month columns
UPDATE citibike_staging
SET
    start_hour = HOUR(Trip_start_time),
    day_of_week = DAYNAME(start_time),
    month = MONTH(start_time);
    
-- updating the season columns
UPDATE citibike_staging
SET season =
CASE
    WHEN MONTH(start_time) IN (12,1,2) THEN 'Winter'
    WHEN MONTH(start_time) IN (3,4,5) THEN 'Spring'
    WHEN MONTH(start_time) IN (6,7,8) THEN 'Summer'
    ELSE 'Fall'
END;

-- checking the season columns
SELECT season, COUNT(*)
FROM citibike_staging
GROUP BY season;

-- cheecking whether the values have been reflected or not into the columns
SELECT 
    Trip_start_time,
    start_hour,
    day_of_week,
    `month`,
    season
FROM citibike_staging
LIMIT 10;

-- creating the week day column number wise
ALTER TABLE citibike_staging
ADD COLUMN weekday_num INT;

-- creating the weekday by numbers
UPDATE citibike_staging
SET weekday_num =
CASE DAYOFWEEK(start_time)
    WHEN 2 THEN 1  -- Monday
    WHEN 3 THEN 2
    WHEN 4 THEN 3
    WHEN 5 THEN 4
    WHEN 6 THEN 5
    WHEN 7 THEN 6
    WHEN 1 THEN 7  -- Sunday
END;

-- checking whether they have been ordered day wise 
SELECT day_of_week, weekday_num, COUNT(*)
FROM citibike_staging
GROUP BY day_of_week, weekday_num
ORDER BY weekday_num;

-- Checking the season columns to ensure they have been created succesffuly
SELECT season, COUNT(*)
FROM citibike_staging
GROUP BY season;



SELECT 
    MIN(start_time) AS min_date,
    MAX(start_time) AS max_date
FROM citibike_staging;