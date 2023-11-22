WITH SampleData AS (
    SELECT
        first_names.first_name,
        last_names.last_name,
        titles.title,
        floor(random() * (SELECT MAX(DepartmentID) FROM EmployeeAssessment.department)) + 1 AS ManagerID, -- Random ManagerID between 1 and 10
        floor(random() * (SELECT MAX(DepartmentID) FROM EmployeeAssessment.department)) + 1 AS DepartmentID -- Random DepartmentID between 1 and 10
    FROM (
        SELECT UNNEST(ARRAY['John', 'Mary', 'David', 'Linda', 'Michael', 'Susan', 'Daniel', 'Laura', 'Richard', 'Emily']) AS first_name
    ) AS first_names
    CROSS JOIN (
        SELECT UNNEST(ARRAY['Smith', 'Johnson', 'Brown', 'Wilson', 'Miller', 'Davis', 'Moore', 'Garcia', 'Martinez', 'Jackson']) AS last_name
    ) AS last_names
    CROSS JOIN (
        SELECT UNNEST(ARRAY['Software Developer', 'Network Engineer', 'Database Administrator', 'IT Support Specialist', 'Quality Assurance Analyst', 'Project Manager']) AS title
    ) AS titles
)

-- Insert random employee data
INSERT INTO EmployeeAssessment.employee (FirstName, LastName, Title, ManagerID, DepartmentID)
SELECT
    first_name,
    last_name,
    title,
    ManagerID,
    DepartmentID
FROM SampleData;