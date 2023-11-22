-- level of hierarchial tree
WITH RECURSIVE cte AS (
SELECT id, name, manager_id, 1 AS level
FROM employeeassessment.trade_organizational_chart
where manager_id is null
UNION  ALL
SELECT e.id, e.name, e.manager_id, c.level + 1
FROM cte c
JOIN   employeeassessment.trade_organizational_chart e ON e.manager_id = c.id
)
SELECT *
FROM   cte;

-- Tree
CREATE EXTENSION tablefunc;
SELECT * FROM connectby('employeeassessment.trade_organizational_chart', 'id', 'manager_id', '1', 0, '->') AS t(id int, manager_id int, level int, ord text) order by id;