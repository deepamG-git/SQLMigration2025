-- Execute on Destination Primary - SQLDB3
BACKUP LOG [MigrationDemoDB] 
TO DISK = '\\SQLMigration-SharedBkpLocation\MigrationDemoDB_POSTCUTOVER.trn' 
WITH 
	COMPRESSION,
	CHECKSUM, 
	STATS = 1; 
GO

-- Execute on Destination Primary - SQLDB4
RESTORE LOG [MigrationDemoDB] 
FROM DISK = '\\SQLMigration-SharedBkpLocation\MigrationDemoDB_POSTCUTOVER.trn' 
WITH 
	NORECOVERY, 
	CHECKSUM, 
	STATS = 1; 
GO