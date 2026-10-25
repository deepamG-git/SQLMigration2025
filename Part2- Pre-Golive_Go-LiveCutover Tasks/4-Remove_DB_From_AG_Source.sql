--Execute on Source: SQLDB1

-- 1. Find the AG name
SELECT ag.name AS ag_name, adc.database_name
FROM sys.availability_groups ag
JOIN sys.availability_databases_cluster adc ON ag.group_id = adc.group_id
WHERE adc.database_name = 'MigrationDemoDB';

-- 2. Remove the database from the AG (replace YourAGName)
ALTER AVAILABILITY GROUP [YourAGName] REMOVE DATABASE [MigrationDemoDB];