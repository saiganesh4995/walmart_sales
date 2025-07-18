# Walmart Retail Analytics: SQL & Python Project

## Project Overview

![Project Pipeline](assets/walmart_project-piplelines.png)


This project is an end-to-end data analysis solution designed to extract critical business insights from Walmart sales data. We utilize Python for data processing and analysis, SQL for advanced querying, and structured problem-solving techniques to solve key business questions. The project is ideal for data analysts looking to develop skills in data manipulation, SQL querying, and data pipeline creation.

---

## Project Steps

### 1. Set Up the Environment
   - **Tools Used**: Visual Studio Code (VS Code), Python, SQL (MySQL and PostgreSQL)
   - **Goal**: Create a structured workspace within VS Code and organize project folders for smooth development and data handling.

### 2. Set Up Kaggle API
   - **API Setup**: Obtain your Kaggle API token from [Kaggle](https://www.kaggle.com/) by navigating to your profile settings and downloading the JSON file.
   - **Configure Kaggle**: 
      - Place the downloaded `kaggle.json` file in your local `.kaggle` folder.
      - Use the command `kaggle datasets download -d <dataset-path>` to pull datasets directly into your project.

### 3. Download Walmart Sales Data
   - **Data Source**: Use the Kaggle API to download the Walmart sales datasets from Kaggle.
   - **Dataset Link**: [Walmart Sales Dataset](https://www.kaggle.com/najir0123/walmart-10k-sales-datasets)
   - **Storage**: Save the data in the `data/` folder for easy reference and access.

### 4. Install Required Libraries and Load Data
   - **Libraries**: Install necessary Python libraries using:
     ```bash
     pip install pandas numpy sqlalchemy mysql-connector-python psycopg2
     ```
   - **Loading Data**: Read the data into a Pandas DataFrame for initial analysis and transformations.

### 5. Explore the Data
   - **Goal**: Conduct an initial data exploration to understand data distribution, check column names, types, and identify potential issues.
   - **Analysis**: Use functions like `.info()`, `.describe()`, and `.head()` to get a quick overview of the data structure and statistics.

### 6. Data Cleaning
   - **Remove Duplicates**: Identify and remove duplicate entries to avoid skewed results.
   - **Handle Missing Values**: Drop rows or columns with missing values if they are insignificant; fill values where essential.
   - **Fix Data Types**: Ensure all columns have consistent data types (e.g., dates as `datetime`, prices as `float`).
   - **Currency Formatting**: Use `.replace()` to handle and format currency values for analysis.
   - **Validation**: Check for any remaining inconsistencies and verify the cleaned data.

### 7. Feature Engineering
   - **Create New Columns**: Calculate the `Total Amount` for each transaction by multiplying `unit_price` by `quantity` and adding this as a new column.
   - **Enhance Dataset**: Adding this calculated field will streamline further SQL analysis and aggregation tasks.

### 8. Load Data into MySQL and PostgreSQL
   - **Set Up Connections**: Connect to MySQL and PostgreSQL using `sqlalchemy` and load the cleaned data into each database.
   - **Table Creation**: Set up tables in both MySQL and PostgreSQL using Python SQLAlchemy to automate table creation and data insertion.
   - **Verification**: Run initial SQL queries to confirm that the data has been loaded accurately.

### 9. SQL Analysis: Complex Queries and Business Problem Solving
   - **Business Problem-Solving**: Write and execute complex SQL queries to answer critical business questions, such as:
     - Revenue trends across branches and categories.
     - Identifying best-selling product categories.
     - Sales performance by time, city, and payment method.
     - Analyzing peak sales periods and customer buying patterns.
     - Profit margin analysis by branch and category.
   - **Documentation**: Keep clear notes of each query's objective, approach, and results.

### 10. Project Publishing and Documentation
   - **Documentation**: Maintain well-structured documentation of the entire process in Markdown or a Jupyter Notebook.
   - **Project Publishing**: Publish the completed project on GitHub or any other version control platform, including:
     - The `README.md` file .
     - Jupyter Notebooks .
     - SQL query scripts.
     - Data files or steps to access them.
     - 
---

## 🧠 Business Problem Statements Solved

This project explores key retail insights using SQL. Below are the 9 business questions answered through SQL queries in `mysql_analysis.sql` and `psql_analysis.sql`.

### ✅ List of Questions Answered:

1. **What are the different payment methods and how many transactions and items were sold under each?**

2. **Which is the highest rated product category in each branch?**
   - Includes branch-wise average ratings and rankings.

3. **What is the busiest day of the week for each branch based on the number of transactions?**

4. **What is the total quantity of items sold per payment method?**

5. **What are the average, minimum, and maximum ratings for each category in each city?**

6. **What is the total profit for each category?**
   - Profit is calculated as `(unit_price * quantity * profit_margin)`.

7. **What is the most preferred (common) payment method in each branch?**

8. **How are sales distributed across different times of the day?**
   - Sales are grouped into Morning, Afternoon, and Evening shifts.

9. **Which 5 branches had the highest revenue decrease compared to the previous year (2022 vs. 2023)?**
   - Revenue decrease is calculated using:
     ```
     (last_year_revenue - current_year_revenue) / last_year_revenue * 100
     ```

---

📌 All SQL queries solving these problems are available in:
- `mysql_analysis.sql`
- `psql_analysis.sql`

---

## Requirements

- **Python 3.8+**
- **SQL Databases**: MySQL, PostgreSQL
- **Python Libraries**:
  - `pandas`, `numpy`, `sqlalchemy`, `mysql-connector-python`, `psycopg2`
- **Kaggle API Key** (for data downloading)

## Getting Started

1. Clone the repository:
   ```bash
   git clone <repo-url>
   ```
2. Install Python libraries:
   ```bash
   pip install -r requirements.txt
   ```
3. Set up your Kaggle API, download the data, and follow the steps to load and analyze.

---

## 📁 Project Structure

```plaintext
|-- data/
|   |-- Walmart.csv                # Raw sales data from Kaggle
|   |-- walmart_clean_data.csv     # Cleaned dataset used for analysis
|   |-- walmart-10k-sales-datasets.zip  # Zipped original dataset from Kaggle
|
|-- sql_queries/
|   |-- mysql_analysis.sql         # SQL queries executed in MySQL
|   |-- psql_analysis.sql          # SQL queries executed in PostgreSQL (pgAdmin)
|
|-- notebooks/
|   |-- project.ipynb              # Python + pandas analysis and data pipeline
|
|-- requirements.txt               # Python dependencies
|-- README.md                      # Project documentation
```
---

## Results and Insights

This section will include your analysis findings:
- **Sales Insights**: Key categories, branches with highest sales, and preferred payment methods.
- **Profitability**: Insights into the most profitable product categories and locations.
- **Customer Behavior**: Trends in ratings, payment preferences, and peak shopping hours.

## Future Enhancements

Possible extensions to this project:
- Integration with a dashboard tool (e.g., Power BI or Tableau) for interactive visualization.
- Additional data sources to enhance analysis depth.
- Automation of the data pipeline for real-time data ingestion and analysis.

---
