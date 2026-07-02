# 🚲 CitiBike & NYC Weather Data Analysis

**End-to-End SQL ETL Pipeline & Power BI Dashboard Development**

---

## 📌 Project Overview

This project presents an end-to-end data analytics solution that integrates over **9 million CitiBike trip records (January–June 2019)** with **NYC weather data (2019)** to uncover actionable insights into ridership patterns, weather impacts, customer behavior, and station performance.

The project includes data ingestion, cleaning, validation, feature engineering, SQL analysis, and interactive Power BI dashboards designed to support operational decision-making and demand forecasting for a bike-sharing system.

---

## ⭐ Project Highlights

- Processed and analyzed **9M+ CitiBike trip records**
- Designed a complete SQL ETL pipeline
- Integrated CitiBike trip data with NOAA weather data
- Performed data cleaning and validation
- Engineered analytical features for reporting
- Built a Star Schema data model in Power BI
- Developed interactive dashboards using DAX
- Generated business insights for operational planning

---

## 🎯 Business Problem

Bike-sharing systems generate millions of trip records every day, making it difficult to identify operational trends and optimize fleet management using raw data alone.

This project answers key business questions including:

- When does ridership demand peak?
- Which stations experience bike shortages or surpluses?
- How do weather conditions affect ridership?
- How do riding behaviors differ between subscribers and casual customers?

The goal is to transform raw operational data into meaningful insights that support strategic planning and improve system efficiency.

---

## 📈 Business Insights

### 🚴 Demand Analysis

- Average daily ridership exceeded **50,000 trips**
- Clear weekday commuter peaks were observed during morning and evening rush hours

### 🌦 Weather Analysis

- Rainfall reduced overall ridership by approximately **12%**
- Casual riders were significantly more affected by adverse weather than subscribers

### 📍 Station Performance

- Identified high-demand stations with frequent inventory imbalance
- Quantified net bike flow to support station rebalancing strategies

---

## 🏗 Project Architecture

```
Raw CitiBike Data
        │
        ▼
Database Setup
        │
        ▼
Data Staging
        │
        ▼
Data Cleaning & Validation
        │
        ▼
Feature Engineering
        │
        ▼
SQL Analysis
        │
        ▼
Power BI Data Model
        │
        ▼
Interactive Dashboard
```

---

## 🗄 Database Layer (MySQL)

### Data Transformation

The SQL pipeline performs the following transformations:

- Converted raw text fields into appropriate data types (`DATE`, `DATETIME`, `DECIMAL`, `YEAR`)
- Created analytical features including:
  - Trip Start Hour
  - Day of Week
  - Season
  - Rider Age
- Integrated CitiBike trips with daily weather observations
- Calculated station pickups, drop-offs, net flow, and imbalance metrics

---

## 🧹 Data Cleaning & Validation

To ensure high-quality analysis, the following validation steps were implemented:

- Removed trips exceeding 24 hours
- Corrected invalid rider birth years
- Removed records with missing station IDs
- Validated timestamp consistency
- Verified complete joins between CitiBike and weather datasets
- Confirmed precipitation values contained no invalid records

---

## 🛠 Technical Challenges & Solutions

### 1. Processing Large Volumes of Data

**Challenge**

Standard MySQL configurations resulted in timeout errors while processing over nine million records.

**Solution**

Optimized MySQL timeout settings (`net_read_timeout`, `net_write_timeout`, and `wait_timeout`) to enable stable execution of long-running transformations and aggregations.

---

### 2. Data Quality Issues

**Challenge**

The raw dataset contained unusually long trips, invalid birth years, and incomplete records.

**Solution**

Implemented a SQL-based data validation and cleaning pipeline to ensure only verified records were included in the analytical model.

---

### 3. Weather Data Integration

**Challenge**

Trip data was recorded at the second level while weather observations were recorded daily.

**Solution**

Created a standardized date key to efficiently join weather observations with individual trip records.

---

## 📊 SQL Analysis

SQL queries were developed to analyze:

- Monthly ridership trends
- Weekly and hourly demand patterns
- Rider demographics
- Subscriber vs. Customer behavior
- Top stations by ride volume
- Net bike flow and station imbalance
- Weather impact on trip frequency
- Weather impact on trip duration

---

## 📈 Power BI Dashboard

The cleaned dataset was connected to Power BI using an ODBC connection.

A Star Schema data model was designed to improve reporting performance and simplify DAX calculations.

### Dashboard Pages

### 🚴 Ridership Overview

- Executive KPIs
- Ridership trends
- Daily and monthly analysis

### 👥 User Behavior

- Subscriber vs Customer comparison
- Rider demographics
- Usage patterns

### 📍 Station Performance

- Top stations by ride volume
- Net bike flow
- Station imbalance analysis

### 🌦 Weather Impact

- Rainfall vs Ridership
- Temperature analysis
- Weather correlation with trip demand

---

## 📷 Dashboard Preview

### Ridership Overview

![Ridership Overview](docs/report_01_ridership_overview.png)

---

### User Behavior

![User Behavior](docs/report_02_user_behavior.png)

---

### Station Performance

![Station Performance](docs/report_03_station_performance.png)

---

### Weather Impact

![Weather Impact](docs/report_04_weather_impact.png)

---

## 📂 Repository Structure

```
CitiBike_Weather_Analysis/
│
├── SQL/
│   ├── 01_Database_Setup.sql
│   ├── 02_Raw_Data.sql
│   ├── 03_Staging.sql
│   ├── 04_Data_Cleaning.sql
│   └── 05_Analysis_Queries.sql
│
├── Power BI/
│   └── CitiBike_Weather_Analysis.pbit
│
├── docs/
│   ├── ridership-overview.png
│   ├── user-behavior.png
│   ├── station-performance.png
│   └── weather-impact.png
│
└── README.md
```

---

## 🛠 Technologies Used

- SQL
- MySQL
- MySQL Workbench
- Power BI
- DAX
- Star Schema Modeling
- ODBC Connector

---

## 🚀 Reproducing the Project

### Dataset

The raw datasets are not included in this repository because they exceed GitHub's recommended file size limits (approximately 2 GB).

Download the datasets using the links provided below.

### Setup

1. Run `01_Database_Setup.sql`
2. Execute `02_Raw_Data.sql`
3. Run `03_Staging.sql`
4. Execute `04_Data_Cleaning.sql`
5. Run `05_Analysis_Queries.sql` *(optional)*
6. Open the Power BI template (`.pbit`)
7. Connect Power BI to the MySQL database using ODBC

---

## 💼 Skills Demonstrated

- SQL Development
- ETL Pipeline Design
- Data Cleaning
- Data Validation
- Feature Engineering
- Database Design
- Data Modeling
- Star Schema
- DAX
- Power BI Dashboard Development
- Business Intelligence
- Data Visualization
- Business Analytics
- Large Dataset Processing (9M+ Records)

---

## 🚀 Future Improvements

- Automate the ETL pipeline using Python
- Deploy dashboards to Power BI Service
- Implement incremental data loading
- Develop predictive demand forecasting models using machine learning

---

## 📚 Data Sources

**CitiBike System Data**

[https://citibikenyc.com/system-data](https://citibikenyc.com/system-data)

**NOAA Climate Data**

[https://www.ncdc.noaa.gov/](https://www.ncdc.noaa.gov/)

---

## 👤 Author

**Nithish Sunkara**

Master's in Information Science  
Ind
**LinkedIn:** https://linkedin.com/in/nsunkara01

