--Execute on Source: SQLDB1
SELECT  top 1 d.name as [Database], 'SQLDB1-SQL2016' as [Server], b.first_lsn,b.last_lsn,b.type,b.user_name
FROM     master.sys.sysdatabases d
LEFT OUTER JOIN msdb..backupset b ON b.database_name = d.name AND b.type = 'L'
where d.name = 'MigrationDemoDB'
ORDER BY backup_finish_date DESC

--Execute on Destinations: SQLDB3 and SQLDB4
SELECT top 1 a.destination_database_name as [Database],'SQLDB3-SQL2025' as [Server], b.first_lsn, b.last_lsn, b.type, a.user_name
FROM msdb.dbo.restorehistory a
INNER JOIN msdb.dbo.backupset b ON a.backup_set_id = b.backup_set_id
WHERE a.destination_database_name = 'MigrationDemoDB'
ORDER BY restore_date DESC?