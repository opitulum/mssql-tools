SELECT name, 
    compatibility_level,
    CASE compatibility_level
        WHEN 80 THEN 'SQL Server 2000'
        WHEN 90 THEN 'SQL Server 2005'
        WHEN 100 THEN 'SQL Server 2008/2008 R2'
        WHEN 110 THEN 'SQL Server 2012'
        WHEN 120 THEN 'SQL Server 2014'
        WHEN 130 THEN 'SQL Server 2016'
        WHEN 140 THEN 'SQL Server 2017'
        WHEN 150 THEN 'SQL Server 2019'
        WHEN 160 THEN 'SQL Server 2022'
        ELSE 'Unknown'
    END AS compatibility_level_desc,
    create_date,
    collation_name, 
    recovery_model_desc, 
    state_desc, 
    is_auto_close_on, 
    is_auto_shrink_on
FROM sys.databases;
GO

-- find real version of SQL Server
SELECT
    SERVERPROPERTY('ProductVersion') AS ProductVersion,
    SERVERPROPERTY('ProductLevel') AS ProductLevel,
    SERVERPROPERTY('Edition') AS Edition,
    SERVERPROPERTY('EngineEdition') AS EngineEdition,
    SERVERPROPERTY('ProductMajorVersion') AS ProductMajorVersion,
    SERVERPROPERTY('ProductMinorVersion') AS ProductMinorVersion,
    SERVERPROPERTY('ProductBuildType') AS ProductBuildType,
    SERVERPROPERTY('ProductUpdateLevel') AS ProductUpdateLevel,
    SERVERPROPERTY('ProductUpdateReference') AS ProductUpdateReference,
    SERVERPROPERTY('IsClustered') AS IsClustered,
    SERVERPROPERTY('IsHadrEnabled') AS IsHadrEnabled,
    SERVERPROPERTY('IsXTPSupported') AS IsXTPSupported,
    SERVERPROPERTY('IsInMemoryOLTPEnabled') AS IsInMemoryOLTPEnabled,
    SERVERPROPERTY('IsPolyBaseInstalled') AS IsPolyBaseInstalled,
    SERVERPROPERTY('IsXTPSupported') AS IsXTPSupported,
    SERVERPROPERTY('IsInMemoryOLTPEnabled') AS IsInMemoryOLTPEnabled,
    SERVERPROPERTY('IsPolyBaseInstalled') AS IsPolyBaseInstalled,
    SERVERPROPERTY('IsSqlAzure') AS IsSqlAzure,
    SERVERPROPERTY('IsSqlManagedInstance') AS IsSqlManagedInstance,
    SERVERPROPERTY('IsSqlOnAzureVM') AS IsSqlOnAzureVM,
    SERVERPROPERTY('IsSqlEdge') AS IsSqlEdge,
    SERVERPROPERTY('IsSqlServer') AS IsSqlServer,
    SERVERPROPERTY('IsSqlServerAzure') AS IsSqlServerAzure,
    SERVERPROPERTY('IsSqlServerManagedInstance') AS IsSqlServerManagedInstance,
    SERVERPROPERTY('IsSqlServerOnAzureVM') AS IsSqlServerOnAzureVM
