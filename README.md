Andmetarkuse kursuse materjalid.

# Sales Report
You can find the Power BI file for Sales Report here: https://github.com/annamarianaanuri/andmetarkus-2026/blob/main/Sales%20Report.pbix
This file can be opened in Power BI program in desktop.
The analysis process is explained step-by-step below.

# Overview of Company
This is an example dataset created by OpenAI.

# Data Cleaning
The original file used for this analysis is SalesTable.csv, which was reviewed to ensure data quality (mostly format issues & outliers were detected) using PowerQuery.

Data quality updates:
1) CustomerID: C005 peaks olema C004, muudetud alusfailis 31.03.2026 müügiesindaja sisendi põhjal
2) ProductID: P005 ja P006 peaks olema P004, muudetud alusfailis 31.03.2026 müügiesindaja sisendi põhjal
3) Vigane kogus müügireal S00009, oli 300, muudetud 3-ks puhastatud failis 31.03.2026 müügiesindaja sisendi põhjal
4) Vigane kogus müügireal S00010, oli 2000, muudetud 20-ks puhastatud failis 31.03.2026 müügiesindaja sisendi põhjal
