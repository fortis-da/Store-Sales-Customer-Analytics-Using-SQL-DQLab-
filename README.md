# Store-Sales-Customer-Analytics-Using-SQL-DQLab-
# DQLab Store Sales & Customer Analytics Using SQL

## Project Overview

This project analyzes DQLab Store transaction data from 2009 to 2012 using SQL. The analysis focuses on sales performance, promotional efficiency, and customer behavior to support data-driven business decisions.

The project applies SQL techniques such as aggregation, filtering, grouping, subqueries, derived tables, and distinct counting to extract business insights from transactional data.

## Business Objectives

The analysis addresses the following business questions:

### 1. Sales Performance Analysis
- **Overall Performance by Year:** Calculate annual sales revenue and the number of completed orders from 2009 to 2012.
- **Performance by Product Sub-Category:** Compare sales across product sub-categories in 2011 and 2012.

### 2. Promotion Effectiveness and Efficiency
- **Annual Promotion Analysis:** Calculate the annual promotion value and burn rate.
- **Promotion Analysis by Product Sub-Category:** Evaluate promotion spending relative to sales for each product sub-category in 2012.

### 3. Customer Analytics
- **Annual Customer Analysis:** Identify the number of unique customers who completed transactions each year.
- **New Customer Analysis:** Determine the number of new customers acquired each year.
- **Customer Retention Analysis:** Analyze customer retention for the 2009 cohort.

## Dataset Description

The dataset contains approximately 5,500 raw transaction records covering the period from 2009 to 2012.

The original dataset includes three order statuses:
- Order Finished
- Order Returned
- Order Cancelled

The analysis uses the `dqlab_sales_store` table.

### Data Dictionary

| Column | Description |
|---|---|
| `order_id` | Unique or transaction-level order identifier |
| `order_status` | Status of the order |
| `customer` | Customer identifier or name |
| `order_date` | Date of the transaction |
| `order_quantity` | Quantity of products ordered |
| `sales` | Sales amount |
| `discount` | Discount percentage or rate |
| `discount_value` | Monetary value of the discount |
| `product_category` | Main product category |
| `product_sub_category` | Product sub-category |

## Tools and SQL Concepts

**Tools**
- SQL
- MySQL
- DQLab learning environment
- GitHub

**SQL concepts**
- `SELECT` and column aliases
- `WHERE` and `BETWEEN`
- `GROUP BY` and `ORDER BY`
- Aggregate functions: `SUM()` and `COUNT()`
- `COUNT(DISTINCT ...)`
- Date functions: `YEAR()`
- Subqueries and derived tables
- Calculated metrics using arithmetic expressions and `ROUND()`

## Analysis and Methodology

### 1. Sales Performance by Year

**Objective:** Measure annual sales revenue and the number of completed orders.

```sql
SELECT
    YEAR(order_date) AS years,
    SUM(sales) AS sales,
    COUNT(DISTINCT order_id) AS number_of_order
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
    AND YEAR(order_date) BETWEEN 2009 AND 2012
GROUP BY YEAR(order_date)
ORDER BY years ASC;
```

**Key metrics:**
- Total sales revenue
- Number of distinct orders

### 2. Sales Performance by Product Sub-Category

**Objective:** Compare product sub-category sales between 2011 and 2012.

```sql
SELECT
    YEAR(order_date) AS years,
    product_sub_category,
    SUM(sales) AS sales
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
    AND YEAR(order_date) BETWEEN 2011 AND 2012
GROUP BY
    YEAR(order_date),
    product_sub_category
ORDER BY
    years ASC,
    sales DESC;
```

### 3. Promotion Effectiveness and Efficiency by Year

**Objective:** Calculate the annual promotion value and burn rate using a derived table.

**Burn Rate Formula:**

Burn Rate (%) = (Total Promotion Value / Total Sales) × 100

The target maximum burn rate is 4.5%.

```sql
SELECT
    years,
    sales,
    promotion_value,
    ROUND(
        promotion_value / sales * 100,
        2
    ) AS burn_rate_percentage
FROM (
    SELECT
        YEAR(order_date) AS years,
        SUM(sales) AS sales,
        SUM(discount_value) AS promotion_value
    FROM dqlab_sales_store
    WHERE order_status = 'Order Finished'
        AND YEAR(order_date) BETWEEN 2009 AND 2012
    GROUP BY YEAR(order_date)
) AS promotion
ORDER BY years ASC;
```

### 4. Promotion Analysis by Product Sub-Category

**Objective:** Evaluate promotion spending relative to sales for each product sub-category in 2012.

```sql
SELECT
    years,
    product_sub_category,
    product_category,
    sales,
    promotion_value,
    ROUND(
        promotion_value / sales * 100,
        2
    ) AS burn_rate_percentage
FROM (
    SELECT
        YEAR(order_date) AS years,
        product_sub_category,
        product_category,
        SUM(sales) AS sales,
        SUM(discount_value) AS promotion_value
    FROM dqlab_sales_store
    WHERE order_status = 'Order Finished'
        AND YEAR(order_date) = 2012
    GROUP BY
        YEAR(order_date),
        product_sub_category,
        product_category
) AS promotion
ORDER BY sales DESC;
```

### 5. Customer Transactions per Year

**Objective:** Calculate the number of unique customers who completed transactions each year.

```sql
SELECT
    YEAR(order_date) AS years,
    COUNT(DISTINCT customer) AS number_of_customer
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
    AND YEAR(order_date) BETWEEN 2009 AND 2012
GROUP BY YEAR(order_date)
ORDER BY years ASC;
```

### 6. New Customer Analysis

**Objective:** Identify customers making their first completed transaction in each year.

*Status: Planned — SQL query and results to be added.*

### 7. Customer Retention Analysis

**Objective:** Analyze the retention of customers whose first completed transaction occurred in 2009.

*Status: Planned — cohort definition, SQL query, and retention results to be added.*

## Key Findings

Based on the annual sales and promotion analysis:

- **2012 recorded the highest annual sales** among the four years, reaching 4,482,983,158.
- **2011 had the highest annual promotion burn rate**, at 5.22%.
- The annual burn rate exceeded the 4.5% target in every year from 2009 to 2012.
- **Office Machines** was the highest-selling product sub-category in 2012, with sales of 811,427,140.
- The annual number of unique customers ranged from 581 to 594.

These findings indicate that promotion spending relative to sales exceeded the target and may require further evaluation by year and product sub-category.

## Recommendations

- Review promotional spending for years and product sub-categories with burn rates above 4.5%.
- Evaluate whether promotional spending generates sufficient incremental sales.
- Compare sales and promotion performance across product categories before reallocating the promotion budget.
- Complete the new customer and cohort retention analyses to better understand customer acquisition and loyalty.

## Data Source

DQLab learning project — Store Sales and Customer Analytics.

The dataset is accessed through the DQLab learning environment. The raw dataset is not included in this repository.

## Author

Created as a SQL portfolio project to demonstrate data querying, business metric calculation, and analytical problem-solving skills.
