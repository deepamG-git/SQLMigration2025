-- Execute on Source - SQLDB1
-- Important - Execute the below code in one single transaction
RESTORE LOG [MigrationDemoDB] 
FROM DISK = '\\SQLMigration-SharedBkpLocation\MigrationDemoDB_TAIL.trn' 
WITH
	RECOVERY, 
	CHECKSUM, 
	STATS = 1; 
GO

ALTER DATABASE [MigrationDemoDB] SET MULTI_USER; 
GO​