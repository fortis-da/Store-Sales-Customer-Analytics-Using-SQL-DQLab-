-- 02. Promotion Analysis
-- Objective: Analyze promotion value and promotion burn rate.

-- Query 1: Promotion Effectiveness and Efficiency by Year
-- Calculate annual sales, promotion value, and burn rate.
-- Target burn rate: maximum 4.5%.

SELECT
    years,
    sales,
    promotion_value,
    ROUND((promotion_value / sales) * 100, 2) AS burn_rate_percentage
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


-- Query 2: Promotion Burn Rate by Product Sub-Category
-- Identify product sub-categories with high sales and promotion costs in 2012.

SELECT
    years,
    product_sub_category,
    product_category,
    sales,
    promotion_value,
    ROUND((promotion_value / sales) * 100, 2) AS burn_rate_percentage
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
