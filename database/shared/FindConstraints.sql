use Campus

SELECT 
    name AS ConstraintName,
    type_desc AS ConstraintType,
    OBJECT_NAME(parent_object_id) AS TableName
FROM sys.objects
WHERE type IN ('PK','FK','UQ','C','D')
ORDER BY TableName;