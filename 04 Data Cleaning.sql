-- Data  Cleaning

USE citibike_db;

-- Cleaning and validating the citibike staging table

-- checking for the  duplicate rides to delete if they exist
SELECT bike_id, start_time, stop_time, COUNT(*)
FROM citibike_staging
GROUP BY bike_id, start_time, stop_time
HAVING COUNT(*) > 1;

-- checking the null station station ids
SELECT COUNT(*)
FROM citibike_staging
WHERE start_station_id IS NULL
   OR end_station_id IS NULL;
   
-- removing NULL station IDs
DELETE FROM citibike_staging
WHERE start_station_id IS NULL
   OR end_station_id IS NULL;

-- checking whether the values have been deled or not
SELECT COUNT(*)
FROM citibike_staging
WHERE start_station_id IS NULL
   OR end_station_id IS NULL;

-- updating the  unrealistic birth years UPDATE citibike_staging
SET birth_year = NULL
WHERE birth_year < 1901
   OR birth_year > 2019;

-- checking the  invalid trip durations
SELECT COUNT(*) AS invalid_trip_durations
FROM citibike_staging
WHERE trip_duration <= 0;

-- checking the rides where the trip duration is greater than 24 hrs
SELECT COUNT(*)
FROM citibike_staging
WHERE trip_duration > 86400;

-- Removing the outliers greater than 24 hrs
DELETE FROM citibike_staging
WHERE trip_duration > 86400;

-- checking the removed outliers
SELECT COUNT(*)
FROM citibike_staging
WHERE trip_duration > 86400;


-- DATA VALIDATION


-- COunting the Rows to check whether it has been changed or not 
SELECT COUNT(*) AS final_row_count
FROM citibike_staging;

-- checking the null values of all the columns
SELECT 
  SUM(start_time IS NULL) AS null_start_time,
  SUM(stop_time IS NULL) AS null_stop_time,
  SUM(start_station_id IS NULL) AS null_start_station_id,
  SUM(end_station_id IS NULL) AS null_end_station_id,
  SUM(Trip_start_date IS NULL) AS null_trip_start_date,
  SUM(Trip_end_date IS NULL) AS null_trip_end_date,
  SUM(bike_id IS NULL) AS null_bike_id,
  SUM(start_station_latitude IS NULL) AS null_start_station_latitude,
  SUM(start_station_longitude IS NULL) AS null_start_station_longitude,
  SUM(end_station_longitude IS NULL) AS null_end_station_longitude,
  SUM(end_station_latitude IS NULL) AS null_end_station_latitude,
  SUM(user_type IS NULL) AS null_user_type,
  SUM(trip_duration IS NULL) AS null_trip_duration,
  SUM(start_station_name IS NULL) AS null_start_station_name,
  SUM(end_station_name IS NULL) AS null_end_station_name,
  SUM(start_hour IS NULL) AS null_start_hour,
  SUM(day_of_week IS NULL) AS null_day_of_week,
  SUM(`month` IS NULL) AS null_month,
  SUM(birth_year IS NULL) AS null_birth_year,
  SUM(gender IS NULL) AS null_gender,
  SUM(season IS NULL) AS null_season
FROM citibike_staging;

-- Validating the  extracted TIME integrity
SELECT COUNT(*)
FROM citibike_staging
WHERE TIME(start_time) <> Trip_start_time;

-- Validating the extracted DATE integrity
SELECT COUNT(*)
FROM citibike_staging
WHERE DATE(start_time) <> Trip_start_date;

-- checkinng whether the duration matches with the timestamps
SELECT COUNT(*)
FROM citibike_staging
WHERE TIMESTAMPDIFF(SECOND, start_time, stop_time) <> trip_duration;

-- updating the values
UPDATE citibike_staging
SET trip_duration = TIMESTAMPDIFF(SECOND, start_time, stop_time);

-- validating the duration with timestamps
SELECT COUNT(*)
FROM citibike_staging
WHERE TIMESTAMPDIFF(SECOND, start_time, stop_time) <> trip_duration;

-- rechecking once again as there is discrepancy in the data
SELECT COUNT(*) AS invalid_trip_durations
FROM citibike_staging
WHERE trip_duration <= 0;

-- Checking the max trip duration as there is discrepancy in the data
SELECT MAX(trip_duration)
FROM citibike_staging;

-- Validating the  hour range
SELECT MIN(start_hour) AS min_hour,
       MAX(start_hour) AS max_hour
FROM citibike_staging;

-- Validating the month range
SELECT MIN(`month`) AS min_month,
       MAX(`month`) AS max_month
FROM citibike_staging;


-- checking the duplicates once again as some of  the values have been deleted and updated
SELECT bike_id, start_time, stop_time, COUNT(*)
FROM citibike_staging
GROUP BY bike_id, start_time, stop_time
HAVING COUNT(*) > 1;

SELECT day_of_week, COUNT(*) 
FROM citibike_staging
GROUP BY day_of_week;

-- Cleaning and validating the NYC weather staging table

-- Checking the no  of rows of the NYC weather staging table
SELECT COUNT(*) AS total_rows
FROM nyc_weather_staging;

-- checking the duplicates
SELECT weather_date, COUNT(*)
FROM nyc_weather_staging
GROUP BY weather_date
HAVING COUNT(*) > 1;

-- checking the null values
SELECT 
  SUM(weather_date IS NULL) AS null_weather_date,
  SUM(avg_wind_speed IS NULL) AS null_wind,
  SUM(precipitation IS NULL) AS null_precip,
  SUM(snow IS NULL) AS null_snow,
  SUM(snow_depth IS NULL) AS null_snow_depth,
  SUM(max_temp IS NULL) AS null_max_temp,
  SUM(min_temp IS NULL) AS null_min_temp,
  SUM(Avg_temp IS NULL) AS null_avg_temp
FROM nyc_weather_staging;

-- checking whether the temp values are right
SELECT COUNT(*)
FROM nyc_weather_staging
WHERE max_temp < min_temp;

-- Checking the negative precipitation/snow check
SELECT COUNT(*)
FROM nyc_weather_staging
WHERE precipitation < 0
   OR snow < 0
   OR snow_depth < 0;
   
   -- Adding the primary key to the table
ALTER TABLE nyc_weather_staging
ADD PRIMARY KEY (weather_date);

-- Checking the whether the primary key has been assigned or not
DESCRIBE nyc_weather_staging;

SELECT COUNT(*)
FROM citibike_staging c
LEFT JOIN nyc_weather_staging w
  ON c.Trip_start_date = w.weather_date
WHERE w.weather_date IS NULL;