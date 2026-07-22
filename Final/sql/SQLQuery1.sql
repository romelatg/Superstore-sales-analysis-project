-- Question 1: Total profit by region
SELECT
    region,
    ROUND(SUM(profit), 2) AS ProfitPerRegion
FROM fact_sales
GROUP BY region

-- Question 2: Top 10 products by sales
SELECT TOP 10
    product_name,
    ROUND(SUM(Sales), 0) AS TotalSales
FROM fact_sales
    LEFT JOIN dim_product
    ON fact_sales.Product_ID = dim_product.Product_ID
GROUP BY product_name
ORDER BY SUM(sales) DESC

-- Question 3: Monthly revenue trend
SELECT
    MONTH(Order_date) AS Month,
    ROUND(SUM(Profit), 0) AS ProfitByMonth
FROM fact_sales
WHERE YEAR(Order_date) = 2014
GROUP BY MONTH(Order_date)
ORDER BY Month

-- Question 4: Customers with more than 5 orders
SELECT
    COUNT(Order_id) AS Orders
FROM fact_sales
GROUP BY Customer_ID
HAVING COUNT(Order_id) > 5
ORDER BY COUNT(Order_id) DESC

-- Question 5: Category with highest average order value
SELECT
    category,
    ROUND(AVG(Sales), 0) AS AverageSalePerOrder
FROM fact_sales
    LEFT JOIN dim_product
    ON fact_sales.product_id = dim_product.product_id
GROUP BY category
ORDER BY AVG(Sales) DESC