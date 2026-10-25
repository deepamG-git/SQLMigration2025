USE DBAdmin

EXECUTE dbo.IndexOptimize
@Databases = 'MigrationDemoDB',
@FragmentationLow = NULL,
@FragmentationMedium = NULL,
@FragmentationHigh = NULL,
@UpdateStatistics = 'ALL',
@StatisticsSample = 20