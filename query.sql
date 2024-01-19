-- Create Positions table
CREATE TABLE Positions (
    PositionID INT PRIMARY KEY,
    PositionName VARCHAR(50) NOT NULL,
    SalaryGradeID INT REFERENCES SalaryGrades(SalaryGradeID)
);

-- Create SalaryGrades table
CREATE TABLE SalaryGrades (
    SalaryGradeID INT PRIMARY KEY,
    SalaryRate DECIMAL(10, 2) NOT NULL
);

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    Age INT,
    PositionID INT REFERENCES Positions(PositionID),
    Salary DECIMAL(10, 2) NOT NULL
);

-- Create Projects table
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    ProjectBudget DECIMAL(15, 2) NOT NULL
);

-- Create EmployeeProjects table for the many-to-many relationship between Employees and Projects
CREATE TABLE EmployeeProjects (
    EmployeeID INT REFERENCES Employees(EmployeeID),
    ProjectID INT REFERENCES Projects(ProjectID),
    PRIMARY KEY (EmployeeID, ProjectID)
);

-- Insert sample data into SalaryGrades table
INSERT INTO SalaryGrades (SalaryGradeID, SalaryRate) VALUES
(1, 50000.00),
(2, 60000.00),
(3, 70000.00);

-- Insert sample data into Positions table
INSERT INTO Positions (PositionID, PositionName, SalaryGradeID) VALUES
(1, 'Developer', 1),
(2, 'Manager', 2),
(3, 'Analyst', 3);

-- Insert sample data into Employees table
INSERT INTO Employees (EmployeeID, EmployeeName, Age, PositionID, Salary) VALUES
(1, 'John Doe', 35, 1, 52000.00),
(2, 'Jane Smith', 42, 2, 65000.00),
(3, 'Bob Johnson', 28, 1, 50000.00),
(4, 'Alice Brown', 45, 3, 72000.00);

-- Insert sample data into Projects table
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget) VALUES
(1, 'Project A', 120000.00),
(2, 'Project B', 80000.00);

-- Insert sample data into EmployeeProjects table
INSERT INTO EmployeeProjects (EmployeeID, ProjectID) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 2);


SELECT e.EmployeeID , e.EmployeeName, p.ProjectName
FROM Employees e
LEFT JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
LEFT JOIN Projects p ON ep.ProjectID = p.ProjectID
GROUP BY e.EmployeeID,e.EmployeeName, p.ProjectName
HAVING COUNT(ep.ProjectID) >= 2;

SELECT p.PositionName, AVG(e.Salary) AS 'Average Salary'
FROM Employees e
LEFT JOIN Positions p ON e.PositionID = p.PositionID
GROUP BY p.PositionName
ORDER BY 'Average Salary' ASC;





UPDATE Employees
SET Salary = Salary * 1.1
WHERE EmployeeID IN (
    SELECT e.EmployeeID
    FROM Employees e
   LEFT JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
   LEFT JOIN Projects p ON ep.ProjectID = p.ProjectID
    WHERE p.ProjectBudget > 100000
);


DELETE 
FROM Employees 
WHERE Age > 40 AND EmployeeID NOT IN(
SELECT e.EmployeeID
FROM Employees e
LEFT JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
);

-- Drop all constraints on the All table
EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL';

