-- 1. Overall Performance by Year

SELECT
    YEAR(order_date) AS years,
    SUM(sales) AS sales,
    COUNT(DISTINCT order_id) AS number_of_order
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
    AND YEAR(order_date) BETWEEN 2009 AND 2012
GROUP BY YEAR(order_date)
ORDER BY years ASC;


-- 2. Overall Performance by Product Sub-Category

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
ORDER BY years ASC, sales DESC;
