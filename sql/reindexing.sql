-- list all indices in the database
SELECT
    t.name AS TableName,
    i.name AS IndexName,
    i.type_desc AS IndexType,
    i.is_disabled AS IsDisabled,
    i.is_hypothetical AS IsHypothetical,
    i.fill_factor AS FillFactor,
    i.allow_page_locks AS AllowPageLocks,
    i.allow_row_locks AS AllowRowLocks,
    i.is_padded AS IsPadded,
    i.is_ansi_padding_enabled AS IsAnsiPaddingEnabled,
    i.is_recomputed AS IsRecomputed,
    i.is_disabled AS IsDisabled,
    i.is_hypothetical AS IsHypothetical,
    i.fill_factor AS FillFactor,
    i.allow_page_locks AS AllowPageLocks,
    i.allow_row_locks AS AllowRowLocks,
    i.is_padded AS IsPadded,
    i.is_ansi_padding_enabled AS IsAnsiPaddingEnabled,
    i.is_recomputed AS IsRecomputed
FROM
    sys.tables t
    INNER JOIN sys.indexes i ON t.object_id = i.object_id
ORDER BY
    t.name,
    i.name;

GO 

-- Reindex all indices in the database if the fragmentation is greater than 30%
DECLARE @TableName NVARCHAR(255)
DECLARE @IndexName NVARCHAR(255)
DECLARE @SQL NVARCHAR(MAX)
DECLARE IndexCursor CURSOR FOR

SELECT
    t.name AS TableName,
    i.name AS IndexName,
    i.index_id AS IndexID,
    i.avg_fragmentation_in_percent AS Fragmentation
FROM
    sys.tables t
    INNER JOIN sys.indexes i ON t.object_id = i.object_id
WHERE
    i.avg_fragmentation_in_percent > 30
ORDER BY
    t.name,
    i.name
OPEN IndexCursor

FETCH NEXT FROM IndexCursor INTO @TableName, @IndexName, @IndexID, @Fragmentation
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @SQL = 'ALTER INDEX [' + @IndexName + '] ON [' + @TableName + '] REBUILD'
    PRINT @SQL
    EXEC sp_executesql @SQL
    FETCH NEXT FROM IndexCursor INTO @TableName, @IndexName, @IndexID, @Fragmentation
END
CLOSE IndexCursor
DEALLOCATE IndexCursor
GO 

