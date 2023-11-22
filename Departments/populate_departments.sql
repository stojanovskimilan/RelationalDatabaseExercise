WITH ITDepartments AS (
    SELECT 'IT Support' AS DepartmentName
    UNION ALL
    SELECT 'Backend'
    UNION ALL
    SELECT 'Network Administration'
    UNION ALL
    SELECT 'DevOps'
    UNION ALL
    SELECT 'Quality Assurance'
	UNION ALL
    SELECT 'Data'
	UNION ALL
    SELECT 'FrontEnd'
)


INSERT INTO EmployeeAssessment.department (DepartmentName)
SELECT DepartmentName
FROM ITDepartments