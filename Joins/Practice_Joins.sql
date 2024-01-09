--Schema: https://www.w3resource.com/sql-exercises/adventureworks/index.php

--Easy:

--1.	Retrieve all customers from the Adventure Works database.
SELECT *
FROM Sales.Customer;

--2.	Find the total number of orders placed by each customer.
SELECT
    CustomerID,
    COUNT(*) AS OrderCount
FROM
    Sales.SalesOrderHeader
GROUP BY
    CustomerID
ORDER BY
    OrderCount DESC;

--3.	List products and their categories.
SELECT
    product.name AS Product,
    productc.name AS ProductCategory,
    productsc.name AS ProductSubCategory
FROM
    Production.Product AS product
JOIN
    Production.ProductSubcategory AS productsc
ON
    product.ProductSubcategoryID = productsc.ProductSubcategoryID
JOIN
    Production.ProductCategory AS productc
ON
    productsc.ProductCategoryID = productc.ProductCategoryID;



--Medium: 

--4. Identify customers who have not placed any orders.
SELECT
    customer.CustomerID
FROM
    Sales.Customer AS customer
LEFT JOIN
    Sales.SalesOrderHeader AS sales
ON
    customer.CustomerID = sales.CustomerID
WHERE
    sales.CustomerID IS NULL;

--5. Display the total sales amount for each year.
SELECT
    YEAR(OrderDate) AS SaleYear,
    SUM(TotalDue) AS TotalSales
FROM
    Sales.SalesOrderHeader
GROUP BY
    YEAR(OrderDate)
ORDER BY
    SaleYear;


--6. Find the average order quantity for each product category.
SELECT
    AVG(SalesOrderDetail.OrderQty) AS avgqty,
    productc.name AS ProductCategory
FROM
    Sales.SalesOrderDetail
JOIN
    Production.Product AS product
    ON SalesOrderDetail.ProductID = product.ProductID
JOIN
    Production.ProductSubcategory AS productsc
    ON product.ProductSubcategoryID = productsc.ProductSubcategoryID
JOIN
    Production.ProductCategory AS productc
    ON productsc.ProductCategoryID = productc.ProductCategoryID
GROUP BY
    productc.name;



--Hard: 
--7. Identify customers who have purchased each year since becoming customers.
--8. Calculate the percentage growth of sales from the previous year.
--9. Display the customer with the highest total purchase amount in the last quarter.