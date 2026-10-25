-- :connect SQL 2016 Instance
BACKUP DATABASE [MigrationDemoDB] TO  DISK = N'\\SQL-Backups\MigrationDemoDB.bak' 
WITH NOFORMAT, NOINIT,  NAME = N'MigrationDemoDB-Full Database Backup', 
SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
GO

-- :connect SQL 2025 Instance
USE [master]
RESTORE DATABASE [MigrationDemoDB]
FROM  DISK = N'\\SQL-Backups\MigrationDemoDB.BAK' WITH  FILE = 1,  
NOUNLOAD,  STATS = 5
GO