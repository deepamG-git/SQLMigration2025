-- Execute on Destination Primary - SQLDB3
USE [master];
GO

ALTER DATABASE [MigrationDemoDB] 
SET QUERY_STORE = ON;
GO

ALTER DATABASE [MigrationDemoDB] 
SET QUERY_STORE (OPERATION_MODE = READ_WRITE);
GO