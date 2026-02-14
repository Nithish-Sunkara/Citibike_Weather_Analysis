USE citibike_db;

DESCRIBE nyc_weather_staging;

-- Changing column names and correcting the data types

ALTER TABLE nyc_weather_staging
CHANGE COLUMN `AWND` Average_wind_speed DECIMAL(7,2),
CHANGE COLUMN `PRCP` precipitation DECIMAL(7,2),
CHANGE COLUMN `snow` Snowfall DECIMAL(7,2),
CHANGE COLUMN `SNWD` Snow_depth DECIMAL(7,2),
CHANGE COLUMN `TAVG` Average_temp DECIMAL (7,2),
CHANGE COLUMN `TMAX` Max_temperature DECIMAL(7,2),
CHANGE COLUMN `TMIN` Min_temperature DECIMAL(7,2);

DESCRIBE nyc_weather_staging;

-- Checking the date column for the values
SELECT `DATE` FROM nyc_weather_staging;

-- Updating the date column from string to DATE datatype
UPDATE nyc_weather_staging
SET `DATE` = str_to_date(`DATE`,'%m/%d/%Y');
 
DESCRIBE nyc_weather_staging;

ALTER TABLE nyc_weather_staging
CHANGE COLUMN `DATE` weather_date DATE;

DESCRIBE nyc_weather_staging;

