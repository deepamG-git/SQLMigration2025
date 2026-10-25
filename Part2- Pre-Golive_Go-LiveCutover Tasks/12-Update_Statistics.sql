-- Execute on Destination Primary - SQLDB3
USE DBAdmin

EXECUTE dbo.IndexOptimize
@Databases = 'MigrationDemoDB',
@FragmentationLow = NULL,
@FragmentationMedium = NULL,
@FragmentationHigh = NULL,
@UpdateStatistics = 'ALL'
--@StatisticsSample = 5