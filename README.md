# 🚲 CitiBike & NYC Weather Data Analysis  
### End-to-End SQL Pipeline & Power BI Report Development  

---

## 📌 Executive Summary

This project analyzes **9M+ CitiBike trip records (January–June 2019)** integrated with **NYC weather data (2019)** to transform raw operational data into actionable business insights.

Using a structured SQL pipeline and multi-page Power BI reports, the project evaluates:

- Ridership trends  
- Weather impact on demand  
- Subscriber vs Customer behavior  
- Station-level imbalance  

The goal is to support operational planning, demand forecasting, and bike redistribution strategy.

---

# 🧠 Business Problem & Impact

Urban bike-sharing systems generate millions of records daily, but raw operational data alone does not answer:

- When does demand peak?
- Which stations experience imbalance?
- How does weather affect ridership?
- Are customers and subscribers behaving differently?

This project builds a validated analytical framework that converts trip-level data into KPI-driven operational insights.

### Operational Impact

**Demand Forecasting**
- Identified hourly and weekday peak patterns  
- Measured 50K+ average daily rides  

**Weather-Adjusted Planning**
- Rain reduces ridership by ~12%  
- Customers show higher weather sensitivity  
- Warmer temperatures correlate with higher demand  

**Station Rebalancing**
- Identified high-volume and high-imbalance stations  
- Quantified net flow per station  

**User Segmentation**
- Subscribers exhibit commuter patterns  
- Customers take longer leisure trips  

---

# 🏗 Architecture & Data Pipeline

Structured workflow:

Raw Data → Staging → Cleaning → Validation → Analysis → KPI Queries → Power BI Reports

---

## 🗄 Database Layer (MySQL)

### Raw Data
- 9M+ CitiBike trip records  
- NYC daily weather dataset  

### Staging
Performed structured transformations including:

- Column normalization  
- Data type corrections (TEXT → DATE, DATETIME, DECIMAL, YEAR)  
- Text standardization  
- Date and time extraction  

Derived fields created:
- Trip_start_date  
- Trip_start_time  
- start_hour  
- day_of_week  
- month  
- season  
- weekday_num  

---

## 🔧 Derived Columns & Transformations (SQL)

Additional analytical fields were created within the staging layer to support KPI and reporting logic:

- Average temperature calculation `(max_temp + min_temp) / 2`  
- Rain classification  
- Rider age derivation  
- Recalculated trip_duration using timestamp difference  
- Station pickup and dropoff aggregations  
- Net flow and imbalance metrics  

These derived columns enabled time-series, segmentation, and operational analysis in Power BI.

---

## 🧹 Data Cleaning & Validation

Performed integrity checks including:

- Duplicate ride detection  
- Invalid birth year correction  
- Null station ID removal  
- Outlier removal (> 24 hours)  
- Timestamp consistency validation  
- Null audits across columns  
- Weather duplicate checks  
- Negative precipitation validation  
- Join completeness validation  

Final dataset integrity verified via row counts and consistency checks.

---

## ⚙ Performance Handling

Due to dataset size (9M+ rows):

- Keep-Alive Timeout increased to 1200 seconds  
- Connection Timeout increased to 1200 seconds  
- Read Timeout increased to 1200 seconds  

Ensured stable execution of large aggregation queries.

---

# 📊 SQL Analytical Coverage

Analysis queries were written to evaluate:

- Total rides  
- Average trip duration  
- Hourly ridership distribution  
- Weekly ridership patterns  
- Monthly trends  
- User-type distribution  
- Gender distribution  
- Top 10 stations  
- Station imbalance  
- Weather impact  
- Rain impact by user type  
- Trip duration vs temperature  
- Seasonal ride distribution  

---

# 📈 Power BI Reports

Data retrieved via ODBC from MySQL and modeled using a star schema.

---

## 📸 Report Preview

### 1️⃣ Ridership Overview
![Ridership Overview](docs/report_01_ridership_overview.png)

### 2️⃣ User Behavior Analysis
![User Behavior](docs/report_02_user_behavior.png)

### 3️⃣ Station Performance
![Station Performance](docs/report_03_station_performance.png)

### 4️⃣ Weather Impact Analysis
![Weather Impact](docs/report_04_weather_impact.png)

---

# 🛠 Tools & Technologies

- SQL  
- MySQL  
- MySQL Workbench  
- ODBC Connector  
- Power BI  
- DAX  
- Star Schema Modeling  

---

# 🚀 Quick Start (Reproducibility)

## Prerequisites
- MySQL Server 8.0+
- MySQL Workbench
- MySQL ODBC Connector
- Power BI Desktop
- CitiBike (Jan–June 2019) CSV files
- NYC Weather 2019 CSV file

---

## Setup Steps

1. Run `01_Database_Setup.sql`
2. Execute `02 Raw data.sql`
3. Run `03 Staging.sql`
4. Execute `04 Data Cleaning.sql`
5. (Optional) Run `05 Analysis Queries.sql` and `06 KPI Queries.sql`
6. Open the `.pbit` file in Power BI
7. Connect via ODBC to MySQL
8. Load:
   - `citibike_staging`
   - `nyc_weather_staging`

Power BI will rebuild the reports.

---

# 💼 Skills Demonstrated

- Large-scale data handling (9M+ records)  
- Structured SQL pipeline design  
- Data cleaning & validation  
- Derived column creation & transformation  
- Analytical SQL querying  
- KPI construction  
- ODBC integration  
- Star schema modeling  
- DAX measure development  
- Multi-page Power BI report design  
- Operational insight extraction  

---

# 📚 Data Sources

Raw datasets not included due to size:

- CitiBike System Data: https://citibikenyc.com/system-data  
- NOAA Weather Data: https://www.ncdc.noaa.gov/  

---

## 👤 Author

Nithish Sunkara
