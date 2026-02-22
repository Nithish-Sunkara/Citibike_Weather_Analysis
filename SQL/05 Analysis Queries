USE citibike_db;

-- Count of total rides
SELECT COUNT(*) AS total_rides
FROM citibike_staging;

-- Average time of the ride
SELECT ROUND(AVG(trip_duration)/60,2) AS avg_duration_minutes
FROM citibike_staging;

-- Total number of rides done per hour
SELECT start_hour, COUNT(*) AS ride_count
FROM citibike_staging
GROUP BY start_hour
ORDER BY start_hour;

-- Total Number of rides per week
SELECT day_of_week, COUNT(*) AS ride_count
FROM citibike_staging
GROUP BY day_of_week
ORDER BY ride_count DESC;

-- Total Number of rides per month
SELECT month, COUNT(*) AS ride_count
FROM citibike_staging
GROUP BY month
ORDER BY month;

-- Total Number of rides per user type (subscriber/customer)
SELECT user_type, COUNT(*) AS ride_count
FROM citibike_staging
GROUP BY user_type;

-- Total Number of rides per gender
SELECT gender, COUNT(*) AS ride_count
FROM citibike_staging
GROUP BY gender;

-- The top 10 stations
SELECT start_station_name, COUNT(*) AS ride_count
FROM citibike_staging
GROUP BY start_station_name
ORDER BY ride_count DESC
LIMIT 10;

-- comparing the rides vs weather
SELECT w.Avg_temp,
       COUNT(*) AS ride_count
FROM citibike_staging c
JOIN nyc_weather_staging w
  ON c.Trip_start_date = w.weather_date
GROUP BY w.Avg_temp
ORDER BY w.Avg_temp;

-- Rides when rained and when it is not rainy
SELECT 
  CASE 
     WHEN w.precipitation > 0 THEN 'Rainy'
     ELSE 'No Rain'
  END AS rain_status,
  COUNT(*) AS ride_count
FROM citibike_staging c
JOIN nyc_weather_staging w
  ON c.Trip_start_date = w.weather_date
GROUP BY rain_status;

-- Rides by season
SELECT season, COUNT(*) AS ride_count
FROM citibike_staging
GROUP BY season;

-- Trip duration vs weather
SELECT 
   ROUND(w.Avg_temp,0) AS temp_band,
   ROUND(AVG(c.trip_duration)/60,2) AS avg_duration_minutes
FROM citibike_staging c
JOIN nyc_weather_staging w
  ON c.Trip_start_date = w.weather_date
GROUP BY temp_band
ORDER BY temp_band;

-- station imbalance
SELECT 
    s.station,
    s.pickups,
    d.dropoffs,
    (s.pickups - d.dropoffs) AS net_flow
FROM 
(
    SELECT start_station_name AS station, COUNT(*) AS pickups
    FROM citibike_staging
    GROUP BY start_station_name
) s
LEFT JOIN
(
    SELECT end_station_name AS station, COUNT(*) AS dropoffs
    FROM citibike_staging
    GROUP BY end_station_name
) d
ON s.station = d.station
ORDER BY ABS(s.pickups - d.dropoffs) DESC;

-- weather impact by user type
SELECT 
  c.user_type,
  CASE WHEN w.precipitation > 0 THEN 'Rainy' ELSE 'No Rain' END AS rain_status,
  COUNT(*) AS ride_count
FROM citibike_staging c
JOIN nyc_weather_staging w
  ON c.Trip_start_date = w.weather_date
GROUP BY c.user_type, rain_status;

