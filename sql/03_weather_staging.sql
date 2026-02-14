USE citibike_db;

CREATE TABLE IF NOT EXISTS nyc_weather_staging AS
SELECT * FROM nyc_weather_raw;

SELECT * From nyc_weather_staging;

SELECT COUNT(*) AS Total_rows
FROM nyc_weather_staging;

DESCRIBE nyc_weather_staging;

