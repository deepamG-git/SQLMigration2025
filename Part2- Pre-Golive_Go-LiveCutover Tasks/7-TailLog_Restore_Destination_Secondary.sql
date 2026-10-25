-- Execute on Destination Primary - SQLDB4
RESTORE LOG [MigrationDemoDB] 
FROM DISK = '\\SQLMigration-SharedBkpLocation\MigrationDemoDB_TAIL.trn' 
WITH
	NORECOVERY, 
	CHECKSUM, 
	STATS = 1; 
GO