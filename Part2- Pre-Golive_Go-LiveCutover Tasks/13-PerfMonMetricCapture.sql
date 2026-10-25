-- Average Read/Write Database Files Latency
SELECT 
    GETDATE() as CollectionTime,
    DB_NAME(vfs.database_id) as DatabaseName, mf.name as LogicalFile, mf.type_desc as FileType,
    vfs.num_of_reads as NumOfReads, vfs.num_of_writes as NumOfWrites,
    vfs.io_stall_read_ms as IOStallReadMS, vfs.io_stall_write_ms as IOStallWriteMS,
    CAST(vfs.io_stall_read_ms  AS DECIMAL(18,4)) / NULLIF(vfs.num_of_reads,0) as AvgReadLatencyMS,
    CAST(vfs.io_stall_write_ms AS DECIMAL(18,4)) / NULLIF(vfs.num_of_writes,0) as aAvgWriteLatencyMS
FROM sys.dm_io_virtual_file_stats(NULL, NULL) vfs
JOIN sys.master_files mf ON vfs.database_id = mf.database_id AND vfs.file_id = mf.file_id
WHERE DB_NAME(vfs.database_id) = 'MigrationDemoDB';
-- Execute on Destination Primary - SQLDB3

-- Buffer Cache Hit Ratio, Page Life Expectancy
SELECT
    (SELECT cntr_value FROM sys.dm_os_performance_counters WHERE counter_name = 'Buffer cache hit ratio' AND object_name LIKE 'uffer Manager') as BufferCacheHitRatio,
    (SELECT cntr_value FROM sys.dm_os_performance_counters WHERE counter_name = 'Buffer cache hit ratio base' AND object_name LIKE 'uffer Manager') as BufferCacheHitRatioBase,
    (SELECT cntr_value FROM sys.dm_os_performance_counters WHERE counter_name = 'Page life expectancy' AND object_name LIKE 'uffer Manager') as PageLifeExpectancy;

-- Avg Wait Time per Wait Type
    SELECT TOP 15
        wait_type, waiting_tasks_count, 
        wait_time_ms / 1000.0 as wait_time_sec, signal_wait_time_ms / 1000.0 as signal_wait_sec,
        100.0 * wait_time_ms / SUM(wait_time_ms)  OVER() as pct_of_total
    FROM sys.dm_os_wait_stats
    WHERE wait_type NOT IN
    (
        'CLR_SEMAPHORE','LAZYWRITER_SLEEP','RESOURCE_QUEUE','SLEEP_TASK','SLEEP_SYSTEMTASK',
        'SQLTRACE_BUFFER_FLUSH','WAITFOR','LOGMGR_QUEUE','CHECKPOINT_QUEUE',
        'REQUEST_FOR_DEADLOCK_SEARCH','XE_TIMER_EVENT','BROKER_TO_FLUSH','BROKER_TASK_STOP',
        'CLR_AUTO_EVENT','DISPATCHER_QUEUE_SEMAPHORE','FT_IFTS_SCHEDULER_IDLE_WAIT',
        'XE_DISPATCHER_WAIT','XE_DISPATCHER_JOIN'
    )
    ORDER BY wait_time_ms DESC;