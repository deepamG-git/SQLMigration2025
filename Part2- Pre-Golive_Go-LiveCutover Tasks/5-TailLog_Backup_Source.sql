--Execute on Source: SQLDB1
-- Important - Execute the below code in one single transaction
USE master; 
GO 
ALTER DATABASE [MigrationDemoDB] SET SINGLE_USER WITH ROLLBACK IMMEDIATE; 
GO

BACKUP LOG [MigrationDemoDB] 
TO DISK = '\\SQLMigration-SharedBkpLocation\MigrationDemoDB_TAIL.trn' 
WITH 
	NORECOVERY,
	COMPRESSION, 
	CHECKSUM, 
	STATS = 1;