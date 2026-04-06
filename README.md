# Data Analytics Portfolio

This repository contains projects completed as part of my Data Analytics studies. Each project demonstrates the end-to-end analytics workflow: data cleaning, transformation, modeling and insight generation using Power BI.  


## Sales Analysis Report
### Overview  

This project presents a sales analysis built in Power BI, demonstrating the full analytics workflow from raw data to actionable insights.


### Data Source

The dataset used in this project is a synthetic dataset created by OpenAI.

Sales data file:
https://github.com/annamarianaanuri/andmetarkus-2026/blob/main/Sales%20Report/SalesTable.csv


### Data Model

The dataset follows a star schema structure:

Fact Tables: SalesTable, Budget  
Dimension Tables: Date, SalesRep, Customer, Product, Region

This structure enables efficient filtering, aggregation, and drill-down analysis in Power BI.


### Data Cleaning

Data cleaning was performed using Power Query.     

#### The following issues were identified and corrected:
1. Formatting inconsistencies and data entry errors
2. Outliers in quantity values

#### Corrections applied (31.03.2026):  
1. CustomerID: C005 → C004
2. ProductID: P005 and P006 → P004
3. Sales row S00009: Quantity 300 → 3
4. Sales row S00010: Quantity 2000 → 20

### Outcome

#### The final Power BI report enables:  
1. Analysis of sales performance across regions and products
2. Identification of trends and anomalies
3. Interactive filtering and drill-down capabilities


## HR Analytics Report
### Overview

This project focuses on HR analytics, providing insights into employee status and satisfaction levels over time.

### Problem Statement

#### The HR department required:
1. An overview of active vs inactive employees over a given time period
2. Insights from the employee satisfaction survey

### Data Source

#### Two datasets were provided by the HR department:  
1. Employee_Satisfaction_Survey.xlsx
2. HR_Dataset.csv


### Data Cleaning

#### Data cleaning was performed using Power Query with a focus on data quality and privacy:
1. Validated uniqueness, formats, and outliers
2. Created a new "Answer Key" column in the survey dataset by combining:
   2.1 Question Round
   2.2 Answer ID

#### In the HR dataset:
1. Removed sensitive personal data:
   1.1 First name
   1.2 Last name
   1.3 Email address
   1.4 Removed Employment Status column (outdated and inconsistent with current data)
   1.5 Converted Salary column to decimal format


### Data Model

#### The datasets were structured to enable analysis between:  
1. Employee activity status
2. Survey responses over time


### Outcome

#### The Power BI report provides:  
1. Clear overview of workforce activity (active vs inactive employees)
2. Employee satisfaction insights
3. Interactive filtering by time period and survey data
