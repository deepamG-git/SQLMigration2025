-- Execute on Destinations: SQLDB3 and SQLDB4
USE [master]
RESTORE DATABASE [MigrationDemoDB] 
FROM  DISK = N'\\SQLMigration-SharedBkpLocation\MigrationDemoDB_FullBeforeLS.bak' 
WITH  FILE = 1,  
MOVE N'MigrationDemo_Data' TO N'E:\SQLDB4\Data\MigrationDemo_Data.mdf',   -- Adjust path accordingly
MOVE N'MigrationDemo_Log' TO N'F:\SQLDB4\Log\MigrationDemo_Log.ldf',      -- Adjust path accordingly
NORECOVERY,  NOUNLOAD,  STATS = 5
GO