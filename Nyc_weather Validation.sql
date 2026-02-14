USE citibike_db;

SELECT * FROM nyc_weather_staging;

-- to check for null values 
SELECT 
	SUM(CASE WHEN weather_date IS NULL THEN 1 ELSE 0 END) AS null_weather_date,
    SUM(CASE WHEN Average_temp IS NULL THEN 1 ELSE 0 END) AS null_Average_temperature,
    SUM(CASE WHEN precipitation IS NULL THEN 1 ELSE 0 END) AS null_precipitation,
    SUM(CASE WHEN snowfall IS NULL THEN 1 ELSE 0 END) AS null_precipitation
FROM nyc_weather_staging;

-- to check duplicates
SELECT weather_date, COUNT(*) AS row_count
FROM nyc_weather_staging
GROUP BY  weather_date
HAVING COUNT(*) > 1;