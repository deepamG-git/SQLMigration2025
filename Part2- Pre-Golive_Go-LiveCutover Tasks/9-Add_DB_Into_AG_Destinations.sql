-- Execute on Destination Primary - SQLDB3
ALTER AVAILABILITY GROUP [YourAGName] ADD DATABASE [MigrationDemoDB];?

-- Execute on Destination Secondary - SQLDB4(Join-Only)
ALTER DATABASE [MigrationDemoDB] SET HADR AVAILABILITY GROUP = [YourAGName];

--Verify the Synchronization Status. Run it on either replica.
SELECT ar.replica_server_name, DB_NAME(drs.database_id) AS db,
       drs.synchronization_state_desc, drs.synchronization_health_desc
FROM sys.dm_hadr_database_replica_states drs
JOIN sys.availability_replicas ar ON drs.replica_id = ar.replica_id
WHERE DB_NAME(drs.database_id) = 'MigrationDemoDB';