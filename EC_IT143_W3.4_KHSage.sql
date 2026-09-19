/*
Author: Hubert Sage
Course: IT 143
Assignment: W3.4 AdventureWorks - Create Answers
Database: AdventureWorks2022

Learning Resources:
1. Microsoft Learn - AdventureWorks Sample Databases
   https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure
2. Microsoft Learn - System Information Schema Views
   https://learn.microsoft.com/en-us/sql/relational-databases/system-information-schema-views/system-information-schema-views-transact-sql
3. Microsoft Learn - COUNT (Transact-SQL)
   https://learn.microsoft.com/en-us/sql/t-sql/functions/count-transact-sql
4. Microsoft Learn - INFORMATION_SCHEMA.COLUMNS
   https://learn.microsoft.com/en-us/sql/relational-databases/system-information-schema-views/columns-transact-sql

Purpose:
This script answers eight AdventureWorks questions using SQL Server.
*/

USE AdventureWorks2022;
GO

/*
Q1 - Business User Question - Marginal Complexity

Question:
What are the ten most expensive products we sell?

Original Author: First student

Answer:
*/

SELECT TOP 10
    ProductID,
    Name,
    ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;
GO


/*
Q2 - Business User Question - Marginal Complexity

Question:
How many people work in the Sales department right now?

Original Author: First student

Answer:
*/

SELECT
    COUNT(*) AS NumberOfEmployees
FROM HumanResources.EmployeeDepartmentHistory AS edh
WHERE edh.DepartmentID = (
    SELECT DepartmentID
    FROM HumanResources.Department
    WHERE Name = 'Sales'
)
AND edh.EndDate IS NULL;
GO


/*
Q3 - Business User Question - Moderate Complexity

Question:
I want to know which product subcategories get ordered the most. Can you show me the top five, based on how many times something from that group was bought?

Original Author: First student

Answer:
*/

SELECT TOP 5
    ps.Name AS ProductSubcategory,
    COUNT(*) AS NumberOfOrders
FROM Sales.SalesOrderDetail AS sod
INNER JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
GROUP BY
    ps.Name
ORDER BY
    NumberOfOrders DESC;
GO


/*
Q4 - Business User Question - Moderate Complexity

Question:
Can you give me a list of customers from Washington state, along with how many orders each one has placed?

Original Author: First student

Answer:
*/

SELECT
    c.CustomerID,
    p.FirstName,
    p.LastName,
    COUNT(soh.SalesOrderID) AS NumberOfOrders
FROM Sales.Customer AS c
INNER JOIN Person.Person AS p
    ON c.PersonID = p.BusinessEntityID
INNER JOIN Sales.SalesOrderHeader AS soh
    ON c.CustomerID = soh.CustomerID
INNER JOIN Person.Address AS a
    ON soh.ShipToAddressID = a.AddressID
INNER JOIN Person.StateProvince AS sp
    ON a.StateProvinceID = sp.StateProvinceID
WHERE sp.Name = 'Washington'
GROUP BY
    c.CustomerID,
    p.FirstName,
    p.LastName
ORDER BY
    NumberOfOrders DESC;
GO


/*
Q5 - Business User Question - Increased Complexity

Question:
I want to understand how our road bikes sold in 2013. Can you break it down by month and by color, showing how many units sold and how much money we made? I'm hoping to spot patterns by season.

Original Author: First student

Answer:
*/

SELECT
    MONTH(soh.OrderDate) AS OrderMonth,
    p.Color,
    SUM(sod.OrderQty) AS UnitsSold,
    SUM(sod.LineTotal) AS SalesRevenue
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE
    YEAR(soh.OrderDate) = 2013
    AND ps.Name = 'Road Bikes'
GROUP BY
    MONTH(soh.OrderDate),
    p.Color
ORDER BY
    OrderMonth,
    p.Color;
GO


/*
Q6 - Business User Question - Increased Complexity

Question:
We want to recognize our best salespeople this year. Can you list each salesperson's name, their territory, and their total sales in 2013, sorted from highest to lowest?

Original Author: First student

Answer:
*/

SELECT
    p.FirstName,
    p.LastName,
    st.Name AS SalesTerritory,
    SUM(soh.SubTotal) AS TotalSales
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesPerson AS sp
    ON soh.SalesPersonID = sp.BusinessEntityID
INNER JOIN Person.Person AS p
    ON sp.BusinessEntityID = p.BusinessEntityID
INNER JOIN Sales.SalesTerritory AS st
    ON sp.TerritoryID = st.TerritoryID
WHERE YEAR(soh.OrderDate) = 2013
GROUP BY
    p.FirstName,
    p.LastName,
    st.Name
ORDER BY
    TotalSales DESC;
GO


/*
Q7 - Metadata Question

Question:
Which tables have a column called "ModifiedDate," and what type of data does that column store?

Original Author: First student

Answer:
*/

SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'ModifiedDate'
ORDER BY
    TABLE_SCHEMA,
    TABLE_NAME;
GO


/*
Q8 - Metadata Question

Question:
Can you find any views in the database with "Employee" in the name?

Original Author: First student

Answer:
*/

SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'VIEW'
    AND TABLE_NAME LIKE '%Employee%'
ORDER BY
    TABLE_SCHEMA,
    TABLE_NAME;
GO
