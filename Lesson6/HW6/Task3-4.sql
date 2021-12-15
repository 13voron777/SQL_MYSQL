USE myjoinsdb;

# Task 3
CREATE INDEX Name ON employees(Name);

CREATE INDEX MaritalStatus ON employeesprivate(MaritalStatus);

CREATE INDEX Position ON employeessalaries(Position);

SELECT Name, TelephoneNumber FROM employees;

SELECT MaritalStatus, BirthDate, PlaceOfResidence FROM employeesprivate;

SELECT Salary, Position FROM employeessalaries;


#Task 4
CREATE VIEW sub641 AS
SELECT e.Name, e.TelephoneNumber, ep.PlaceOfResidence
FROM Employees e
JOIN EmployeesPrivate ep ON ep.EmployeeID = e.EmployeeID;
SELECT * FROM sub641;

CREATE VIEW sub642 AS
SELECT e.Name, ep.BirthDate, e.TelephoneNumber
FROM EmployeesPrivate ep
JOIN Employees e ON e.EmployeeID = ep.EmployeeID
WHERE ep.MaritalStatus = 'Холост';
SELECT * FROM sub642;

CREATE VIEW sub643 AS
SELECT e.Name, ep.BirthDate, e.TelephoneNumber
FROM Employees e
JOIN EmployeesPrivate ep ON ep.EmployeeID = e.EmployeeID
JOIN EmployeesSalaries es ON es.EmployeeID = e.EmployeeID
WHERE es.Position = 'Менеджер';
SELECT * FROM sub643;