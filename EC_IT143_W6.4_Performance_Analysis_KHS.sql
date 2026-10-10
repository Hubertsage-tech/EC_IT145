/*
Assignment: W6.4 Performance Analysis
Student: Kwizera Hubert Sage
Suggested filename: EC_IT143_W6.4_Performance_Analysis_KHS.sql

Run this script in SQL Server Management Studio (SSMS) with an AdventureWorks
database selected. For the demonstration, enable Include Actual Execution Plan
with Ctrl+M before running each SELECT.

IMPORTANT:
- SQL Server's missing-index suggestions depend on the database version, data,
  statistics, and indexes already present. A suggestion is not guaranteed.
- First run the SELECT statements BEFORE creating the indexes and inspect the
  execution plan / Missing Index Details. If SSMS suggests a different index,
  use its generated Missing Index Details script and name the index clearly.
- Run the CREATE INDEX section only after capturing the before-plan evidence.
*/

USE AdventureWorks2022;
GO

/* Query 1: Person.Address filtered by City (character column).
   Before running, enable Actual Execution Plan (Ctrl+M). */
SELECT
    pa.AddressID,
    pa.AddressLine1,
    pa.City,
    pa.PostalCode
FROM Person.Address AS pa
WHERE pa.City = N'Bothell';
GO

/* Query 2: Production.Product filtered by Color (character column).
   Again, capture the actual execution plan before creating the index. */
SELECT
    p.ProductID,
    p.Name,
    p.ProductNumber,
    p.Color
FROM Production.Product AS p
WHERE p.Color = N'Red';
GO

/*
After reviewing both plans and any Missing Index Details, create appropriate
indexes if the recommendation and workload justify them. These are example
indexes for the two predicates above; they may overlap with indexes in your
AdventureWorks version. Do not create duplicates if an equivalent index exists.
*/

-- Example index for Query 1
IF NOT EXISTS
(
    SELECT 1
    FROM sys.indexes
    WHERE object_id = OBJECT_ID(N'Person.Address')
      AND name = N'IX_Address_City_PerformanceAnalysis'
)
BEGIN
    CREATE NONCLUSTERED INDEX IX_Address_City_PerformanceAnalysis
    ON Person.Address (City)
    INCLUDE (AddressLine1, PostalCode);
END;
GO

-- Example index for Query 2
IF NOT EXISTS
(
    SELECT 1
    FROM sys.indexes
    WHERE object_id = OBJECT_ID(N'Production.Product')
      AND name = N'IX_Product_Color_PerformanceAnalysis'
)
BEGIN
    CREATE NONCLUSTERED INDEX IX_Product_Color_PerformanceAnalysis
    ON Production.Product (Color)
    INCLUDE (Name, ProductNumber);
END;
GO

/* Re-run both queries after index creation with Ctrl+M enabled.
   Compare execution plans, estimated subtree cost, logical reads, and elapsed
   time before/after. Small tables or cached results may show little improvement.
*/

SELECT
    pa.AddressID,
    pa.AddressLine1,
    pa.City,
    pa.PostalCode
FROM Person.Address AS pa
WHERE pa.City = N'Bothell';
GO

SELECT
    p.ProductID,
    p.Name,
    p.ProductNumber,
    p.Color
FROM Production.Product AS p
WHERE p.Color = N'Red';
GO

/*
Profiler overview (for the video):
1. Open Tools > SQL Server Profiler, then connect to the Database Engine.
2. Create a new trace, give it a name, and choose a suitable template such as
   Standard (or select events manually).
3. Select useful events such as SQL:BatchCompleted, RPC:Completed, and
   Showplan events when appropriate. Add filters for database, duration, or
   application to reduce noise.
4. Start the trace, reproduce the query/workload, and stop the trace.
5. Review duration, CPU, reads/writes, statement text, and execution details.
6. Save/export the trace if needed. Use Profiler carefully on production systems
   because tracing can add overhead; Extended Events is generally preferred
   for many modern production troubleshooting tasks.
*/
