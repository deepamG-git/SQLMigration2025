--Execute on at Source: SQLDB1
BACKUP DATABASE [MigrationDemoDB] 
TO  DISK = N'\\SQLMigration-SharedBkpLocation\MigrationDemoDB_FullBeforeLS.bak'  -- Adjust path accordingly
WITH NOFORMAT, NOINIT,  NAME = N'MigrationDemoDB-Full Database Backup', 
SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
GO