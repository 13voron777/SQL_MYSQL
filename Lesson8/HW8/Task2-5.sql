# Extra сделано в HW6 Extra

# Task 2
CREATE DATABASE MyFunkDB;

USE MyFunkDB;


# Task 3
CREATE TABLE Employees
	(
		EmployeeID int NOT NULL,
        Name char(50) NOT NULL,
        TelephoneNumber char(50) NOT NULL
    );
    
CREATE TABLE EmployeesSalaries
	(
		EmployeeID int NOT NULL,
        Salary double NOT NULL,
        Position char(50) NOT NULL
    );
    
CREATE TABLE EmployeesPrivate
	(
		EmployeeID int NOT NULL,
        MaritalStatus char(50) NOT NULL,
        BirthDate date NOT NULL,
        PlaceOfResidence char(50) NOT NULL
    );   
    
ALTER TABLE Employees ADD 
	CONSTRAINT PK_Employees PRIMARY KEY(EmployeeID);
    
ALTER TABLE EmployeesSalaries ADD 
	CONSTRAINT PK_Employees PRIMARY KEY(EmployeeID);

ALTER TABLE EmployeesPrivate ADD 
	CONSTRAINT PK_Employees PRIMARY KEY(EmployeeID);
    
ALTER TABLE EmployeesSalaries ADD CONSTRAINT
	FK_EmployeesSalaries_Employees FOREIGN KEY(EmployeeID) 
	REFERENCES Employees(EmployeeID) 
	 ON UPDATE CASCADE 
	 ON DELETE CASCADE;
     
ALTER TABLE EmployeesPrivate ADD CONSTRAINT
	FK_EmployeesPrivate_Employees FOREIGN KEY(EmployeeID) 
	REFERENCES Employees(EmployeeID) 
	 ON UPDATE CASCADE 
	 ON DELETE CASCADE;

INSERT Employees
(EmployeeID, Name, TelephoneNumber) 
VALUES
(1, 'Алексеев О. А.', '+48 888 902 234'),
(2, 'Петров П. В.', '+49 172 158 18 53'),
(3, 'Васильев С. Р.', '+370 5 232 72 74'),
(4, 'Иванов И. С.', '+420 222 372 584'),
(5, 'Соколов В. А.', '+ 33 2 41 32 62 45');

INSERT EmployeesSalaries
(EmployeeID, Salary, Position) 
VALUES
(1, 5000, 'Менеджер'),
(2, 2000, 'Junior'),
(3, 5000, 'Менеджер'),
(4, 6000, 'Middle'),
(5, 10000, 'Senior');

INSERT EmployeesPrivate
(EmployeeID, MaritalStatus, BirthDate, PlaceOfResidence) 
VALUES
(1, 'Холост', '1996-08-13', 'Щецин'),
(2, "Женат", '1992-09-15', 'Берлин'),
(3, 'Холост', '1990-04-24', 'Вильнюс'),
(4, 'Холост', '1997-02-07', 'Прага'),
(5, 'Женат', '1988-11-02', 'Марсель');


# Task 4 
DELIMITER |

DROP PROCEDURE Task4; |

CREATE PROCEDURE Task4()
BEGIN
DECLARE setName varchar(45);
START TRANSACTION;
	INSERT Employees
	(EmployeeID, Name, TelephoneNumber) 
	VALUES
	(6, 'Соколов В. А.', '+ 33 2 41 32 62 45');
    SET setName = 'Соколов В. А.';

	INSERT EmployeesSalaries
	(EmployeeID, Salary, Position) 
	VALUES
	(6, 10000, 'Senior');

	INSERT EmployeesPrivate
	(EmployeeID, MaritalStatus, BirthDate, PlaceOfResidence) 
	VALUES
	(6, 'Женат', '1988-11-02', 'Марсель');
    
	IF EXISTS (SELECT COUNT(*) FROM Employees WHERE Name = setName
				HAVING COUNT(*) >= 2)
		THEN
			ROLLBACK; 
	END IF;
    
    INSERT Employees
	(EmployeeID, Name, TelephoneNumber) 
	VALUES
	(6, 'Сергеев А. П.', '+ 33 3 21 41 62 45');
    SET setName = 'Сергеев А. П.';

	INSERT EmployeesSalaries
	(EmployeeID, Salary, Position) 
	VALUES
	(6, 14000, 'TeamLead');

	INSERT EmployeesPrivate
	(EmployeeID, MaritalStatus, BirthDate, PlaceOfResidence) 
	VALUES
	(6, 'Женат', '1993-05-22', 'Лион');
    
	IF EXISTS (SELECT COUNT(*) FROM Employees WHERE Name = setName
				HAVING COUNT(*) >= 2)
		THEN
			ROLLBACK; 
		ELSE
			COMMIT;
	END IF;	
END; |	

CALL Task4(); |

DROP PROCEDURE Task4; |

# Task 5
DELIMITER |
CREATE TRIGGER Task5 
BEFORE DELETE ON employees 
FOR EACH ROW 
  BEGIN
    DELETE FROM employeesprivate WHERE EmployeeID = OLD.EmployeeID;
    DELETE FROM employeessalaries WHERE EmployeeID = OLD.EmployeeID;
 END;
    |
    
DROP TRIGGER Task5; |

DELETE FROM employees WHERE EmployeeID = 6; |