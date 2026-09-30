-- EC_IT143_W4.2_hello_world_s5.2_hs.sql
-- Step 5.2: Refine the table architecture
USE EC_IT143_DA;
GO

DROP TABLE IF EXISTS dbo.HelloWorld;
GO

CREATE TABLE dbo.HelloWorld
(
    HelloWorldID INT IDENTITY(1,1) NOT NULL,
    Message NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_HelloWorld PRIMARY KEY (HelloWorldID)
);
GO

SELECT *
FROM dbo.HelloWorld;
GO
