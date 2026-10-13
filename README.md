# Store Sales & Customer Analytics Using SQL (DQLab)

## Project Overview

This project analyzes DQLab Store's sales, promotion efficiency, and customer performance from 2009 to 2012 using SQL.

The analysis focuses on identifying sales trends, evaluating promotion costs, and understanding customer activity to support data-driven business decisions.

## Business Objectives

The project aims to answer the following business questions:

### 1. Sales Performance Analysis
- How did total sales and the number of orders change from 2009 to 2012?
- Which product sub-categories experienced the highest sales in 2011 and 2012?

### 2. Promotion Analysis
- How did the promotion burn rate change from 2009 to 2012?
- Which product sub-categories had the highest sales and promotion burn rates in 2012?
- Did the annual promotion burn rate meet the company's target of 4.5%?

### 3. Customer Analysis
- How many unique customers placed finished orders each year?
- How many new customers were acquired each year?
- How well did the 2009 customer cohort continue purchasing in subsequent years?

## Dataset

The dataset used in this project is `dqlab_sales_store`, containing transaction records from 2009 to 2012.

The dataset includes the following information:

| Column | Description |
|---|---|
| `order_id` | Unique order identifier |
| `order_status` | Transaction status |
| `customer` | Customer identifier or name |
| `order_date` | Transaction date |
| `order_quantity` | Quantity of products ordered |
| `sales` | Sales value |
| `discount` | Discount information |
| `discount_value` | Monetary value of the discount |
| `product_category` | Product category |
| `product_sub_category` | Product sub-category |

Only transactions with the status `Order Finished` are included in the sales, promotion, and customer analyses unless otherwise specified.

## Tools & Skills

- **SQL**
- Data aggregation and filtering
- Date-based analysis
- `GROUP BY` and `ORDER BY`
- Aggregate functions such as `SUM()` and `COUNT(DISTINCT)`
- Subqueries
- Business performance analysis
- Data-driven recommendations

## Repository Structure

```text
dqlab-store-sql-analysis/
├── README.md
└── sql/
    ├── 01_sales_performance.sql
    ├── 02_promotion_analysis.sql
    └── 03_customer_analysis.sql
```

## Key Findings

### 1. Sales Performance

- Total sales fluctuated throughout 2009–2012.
- Sales declined in 2010 and gradually recovered in 2011 and 2012.
- The number of finished orders was highest in 2012.

### 2. Promotion Efficiency

- The annual promotion burn rate exceeded the 4.5% target in every year from 2009 to 2012.
- The highest annual burn rate occurred in 2011, at 5.22%.
- In 2012, Binders and Binder Accessories recorded a burn rate of 6.14%, while Office Machines recorded 5.75%.

### 3. Customer Performance

- The number of unique customers with finished orders remained relatively stable throughout the four-year period.
- The highest annual customer count was recorded in 2012, with 594 unique customers.

*Note: New customer acquisition and cohort retention analyses are not yet included in the current SQL files.*

## Recommendations

Based on the current analysis:

- **Sales performance:** Investigate product sub-categories with declining sales and identify opportunities to improve revenue.
- **Promotion efficiency:** Review promotion strategies for product sub-categories with burn rates above the 4.5% target.
- **Customer growth:** Explore customer acquisition and retention strategies to increase repeat purchases.
- **Further analysis:** Complete new customer and cohort retention analyses to gain deeper insights into customer behavior.

## Author

**Afrah Hafidzah**

Statistics Student | Aspiring Data Analyst

This project was developed as part of a SQL-based data analytics learning portfolio.
