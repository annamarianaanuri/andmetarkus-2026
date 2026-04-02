# Data Analytics Study Materials

This project was created as part of a Data Analytics course. It presents a sales analysis built using Power BI, including data cleaning, transformation and visualization.

The goal of this project is to demonstrate the full analytics workflow: data preparation, data cleaning, data modeling & insight generation using Power BI.

# File Location
The source file SalesReport.csv can be found here: https://github.com/annamarianaanuri/andmetarkus-2026/blob/main/Sales%20Report/SalesTable.csv  

To open the file, use Power BI Desktop.

This is a synthetic (example) dataset created by OpenAI.  

# Dataset
The dataset follows a star schema, where fact tables store measurable business data and dimension tables provide descriptive context for analysis.
The structure enables efficient filtering, aggregation, and drill-down analysis in Power BI.

Fact Tables - SalesTable, Budget.

Dimension Tables - Date, SalesRep, Customer, Product, Region.

# Data Cleaning
Data cleaning was performed using Power Query in Power BI.
The key issues identified were formatting inconsistencies, data entry errors and outliers in quantity values.

All data quality updates in the source file SalesTable.csv are made on 31.03.2026 based on input from the sales representative.

CustomerID: C005 should be C004.

ProductID: P005 and P006 should be P004.

Incorrect quantity in sales row S00009: Originally 300, corrected to 3 in the cleaned file.

Incorrect quantity in sales row S00010: Originally 2000, corrected to 20 in the cleaned file.
