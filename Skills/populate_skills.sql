CREATE OR REPLACE FUNCTION insert_random_skills(num_iterations INT)
RETURNS VOID AS $$
DECLARE
    i INT;
BEGIN
    FOR i IN 1..num_iterations LOOP
        WITH SampleData AS (
            SELECT
                UNNEST(ARRAY['Soft Skills', 'Technical Skills', 'Teamwork Skills']) AS SkillName,
                floor(random() * 3) + 1 AS Rating, -- Random Rating between 1 and 5
                (current_date - floor(random() * 365) * interval '7 days')::DATE AS RatingDate,
                floor(random() * ((SELECT MAX(EmployeeID) FROM EmployeeAssessment.employee)-(SELECT MIN(EmployeeID) FROM EmployeeAssessment.employee) + 1)) + (SELECT MIN(EmployeeID) FROM EmployeeAssessment.employee) AS EmployeeID,
        		floor(random() * ((SELECT MAX(EmployeeID) FROM EmployeeAssessment.employee)-(SELECT MIN(EmployeeID) FROM EmployeeAssessment.employee) + 1)) + (SELECT MIN(EmployeeID) FROM EmployeeAssessment.employee) AS RatedBy
        )
        INSERT INTO EmployeeAssessment.skills (SkillName, Rating, RatingDate, EmployeeID, RatedBy)
        SELECT
            SkillName,
            Rating,
            RatingDate,
            EmployeeID,
            RatedBy
        FROM SampleData;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT insert_random_skills(250);