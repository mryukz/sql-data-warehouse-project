# Data Warehouse and Analytics Project

Welcome to the **Data Warehous and Analytics Project** repository!
This project demonstrates a comprehensive data warehousing and analytics techniques and solution, from building a data warehouse using medallion architecture to generation actionable insights.
This is specifically designed to act as a portfolio project to highlight the skills used in the industry as a data engineer or analyst.

----

# 🏗️ Data Architecture

The data architecture for this project follows medallion architecture concpet, which has layer called **Bronze**, **Silver**, and **Gold**:
<img width="2249" alt="Data Layers (Medallion Architecture)" src="https://github.com/user-attachments/assets/6694112f-cee0-4761-9d3f-d269a4a7fb6a" />

1. **Bronze Layer**: Stores raw data without any transformation from the source system. Data is ingested from CSV Files into SQL Database.
2. **Silver Layer**: This layer includes data cleansing, standardization, normalization, dervide columns, and data enrichments processes to prepare data for analysis.
3.  **Gold Layer**: This layer houses business-ready data modeled into a star schema required for reporting and analytics.

----

# 📖 Project Overview

Project consist of:

  1. **Data Architectre**: Designing a modern data warehouse using medallion architecture **Bronze**, **Silver**, and **Gold** layer.
  2. **ETL Pipelines**: Extracting, Transforming, and Loading data from source system into the warehouse.
  3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries.
  4. **Analytics & Reporting**: Creating SQL-Based reports and dashboard using BI tools for actionable insight for business-use.

🎯 **Highlights**:

  * Data Architecture
  * Data Engineering
  * ETL Pipeline
  * PostgreSQL
  * Tableau
  * Data Modeling
  * Data Analytics

----

# 🛠️ Links & Tools:

  * [Datasets](datasets): Access to the project dataset (CSV files).
  * [PostgreSQL](https://www.postgresql.org/): Open-source database and GUI for interacting with databases.
  * [Git repository](https://github.com/mryukz/sql-data-warehouse-project): For collaboration and documentation of the project.
  * [Figma](https://www.figma.com/): Used for designing data architecture, models, flows, and diagram for the project.
  * [Notion](https://www.notion.com/): For managing project phases and task.

----

# 🚀 Project Requirements

**Building the Data Warehouse (Data Engineering)**

**Objective**

Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

Specifications
  * Data Sources: Import data from two source systems (ERP and CRM) provided as CSV files.
  * Data Quality: Cleanse and resolve data quality issues prior to analysis.
  * Integration: Combine both sources into a single, user-friendly data model designed for analytical queries.
  * Scope: Focus on the latest dataset only; historization of data is not required.
  * Documentation: Provide clear documentation of the data model to support both business stakeholders and analytics teams.

----

# 📊 BI: Analytics & Reporting (Data Analysis)

**Objective**

Develop SQL-based analytics to deliver detailed insights into:

  * Customer Behavior
  * Product Performance
  * Sales Trends

These insights empower stakeholders with key business metrics, enabling strategic decision-making.

----

# 📂 Repository Structure
data-warehouse-project/
```
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
├── .gitignore                          # Files and directories to be ignored by Git
└── requirements.txt                    # Dependencies and requirements for the project
```
----

# 🛡️ License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.

----

# 🙇 About me

Hi! I am Nakajima, Naoyuki. An aspiring Data Analyst who currently works as a CAE Engineer. Passionate on coding, designing, and storytelling using data.

Feel free to connect with me on [LinkedIn](https://www.linkedin.com/in/nakajimanaoyuki)!
