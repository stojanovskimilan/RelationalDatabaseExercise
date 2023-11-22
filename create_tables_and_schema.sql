CREATE SCHEMA EmployeeAssessment
CREATE TABLE EmployeeAssessment.department(
	DepartmentID SERIAL PRIMARY KEY,
	DepartmentName VARCHAR(256)
);
CREATE TABLE EmployeeAssessment.employee(
	EmployeeID SERIAL PRIMARY KEY,
	FirstName VARCHAR(128),
	LastName VARCHAR(128),
	Title VARCHAR(256),
	ManagerID INT,
	DepartmentID INT,
	CONSTRAINT fk_department
      FOREIGN KEY(DepartmentID)
	  REFERENCES EmployeeAssessment.department(DepartmentID)
);
CREATE TABLE EmployeeAssessment.skills(
	SkillID SERIAL PRIMARY KEY,
	SkillName VARCHAR(256),
	Rating INTEGER,
	RatingDate DATE NOT NULL DEFAULT CURRENT_DATE,
	EmployeeID INT,
	RatedBy INT,
	CONSTRAINT fk_employee
      FOREIGN KEY(EmployeeID)
	  REFERENCES EmployeeAssessment.employee(EmployeeID),
	CONSTRAINT fk_ratedby
      FOREIGN KEY(RatedBy)
	  REFERENCES EmployeeAssessment.employee(EmployeeID)
);

