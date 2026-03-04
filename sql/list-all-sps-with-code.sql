-- list all sps with code
SELECT
    name,
    type_desc,
    OBJECT_DEFINITION(OBJECT_ID) AS code
FROM
    sys.procedures
ORDER BY
    name;

GO