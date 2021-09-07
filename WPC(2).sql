CREATE TABLE DEPARTMENT(
	DepartmentName char(35) NOT NULL,
    BudgetCode char(30) NOT NULL,
    OfficeNumber char(15) NOT NULL,
    DepartmentPhone char(12) NOT NULL,
    CONSTRAINT DEPARTMENT_PK PRIMARY KEY(DepartmentName)
    );
    
    CREATE TABLE EMPLOYEE(
		EmployeeNumber int NOT NULL AUTO_INCREMENT,
        FirstName char(25) NOT NULL,
        LastName char(25) NOT NULL,
        Department char(35) NOT NULL DEFAULT 'Human Resources',
        OfficePhone char(12) NULL,
        EmailAddress varchar(100) NOT NULL UNIQUE,
        CONSTRAINT EMPLOYEE_PK PRIMARY KEY(EmployeeNumber),
        CONSTRAINT EMP_DEPART_FK FOREIGN KEY(Department)
        REFERENCES DEPARTMENT(DepartmentName) ON UPDATE CASCADE
        );
        
        
	CREATE TABLE PROJECT(
		ProjectID int NOT NULL,
        ProjectName char(50) NOT NULL,
        Department char(35) NOT NULL,
        MaxHours decimal(8,2) NOT NULL DEFAULT 100,
        StartDate date NULL,
        EndDate date NULL,
        CONSTRAINT PROJECT_PK PRIMARY KEY(ProjectID),
        CONSTRAINT PROJ_DEPART_FK FOREIGN KEY(Department)
        REFERENCES DEPARTMENT(DepartmentName) ON UPDATE CASCADE
        );
        
    CREATE TABLE ASSIGNMENT(
		ProjectID int NOT NULL,
        EmployeeNumber int NOT NULL,
        HoursWorked Numeric(6,2) NULL,
        CONSTRAINT ASSIGNMENT_PK PRIMARY KEY(ProjectID, EmployeeNumber),
		CONSTRAINT ASSIGN_PROJ_FK FOREIGN KEY(ProjectID)
        REFERENCES PROJECT(ProjectID) ON UPDATE NO ACTION ON DELETE CASCADE,
        CONSTRAINT ASSIGN_EMP_FK FOREIGN KEY(EmployeeNumber) ON UPDATE NO ACTION ON DELETE NO ACTION 
        );
	


INSERT INTO DEPARTMENT VALUES(
       'Administration', 'BC-100-10', 'BLDG01-210', '360-285-8100');
INSERT INTO DEPARTMENT VALUES(
       'Legal', 'BC-200-10', 'BLDG01-220', '360-285-8200');
INSERT INTO DEPARTMENT VALUES(
       'Human Resources', 'BC-300-10', 'BLDG01-230', '360-285-8300');
INSERT INTO DEPARTMENT VALUES(
       'Finance', 'BC-400-10', 'BLDG01-110', '360-285-8400');
INSERT INTO DEPARTMENT VALUES(
       'Accounting', 'BC-500-10', 'BLDG01-120', '360-285-8405');
INSERT INTO DEPARTMENT VALUES(
       'Sales and Marketing', 'BC-600-10', 'BLDG01-250', '360-287-8500');
INSERT INTO DEPARTMENT VALUES(
       'InfoSystems', 'BC-700-10', 'BLDG02-210', '360-287-8600');
INSERT INTO DEPARTMENT VALUES(
       'Research and Development', 'BC-800-10', 'BLDG02-250', '360-287-8700');
       INSERT INTO DEPARTMENT VALUES(
'Production', 'BC-900-10', 'BLDG02-110', '360-287-8800');

INSERT INTO EMPLOYEE
(FirstName, LastName, Department, Position, OfficePhone, EmailAddress)
       VALUES('Mary', 'Jacobs', 'Administration', 'CEO',
       '360-285-8110', 'Mary.Jacobs@WP.com');
INSERT INTO EMPLOYEE
(FirstName, LastName, Department, Position, Supervisor, OfficePhone, EmailAddress)
       VALUES('Rosalie', 'Jackson', 'Administration', 'Admin Assistant', 1,
       '360-285-8120', 'Rosalie.Jackson@WP.com');
INSERT INTO EMPLOYEE
(FirstName, LastName, Department, Position, Supervisor, OfficePhone, EmailAddress)
       VALUES('Richard', 'Bandalone', 'Legal', 'Attorney', 1,
       '360-285-8210', 'Richard.Bandalone@WP.com');
INSERT INTO EMPLOYEE
(FirstName, LastName, Department, Position, Supervisor, OfficePhone, EmailAddress)
       VALUES('George', 'Smith', 'Human Resources', 'HR3', 1,
       '360-285-8310', 'George.Smith@WP.com');
INSERT INTO EMPLOYEE
(FirstName, LastName, Department, Position, Supervisor, OfficePhone, EmailAddress)
       VALUES('Alan', 'Adams', 'Human Resources', 'HR1', 4,
       '360-285-8320', 'Alan.Adams@WP.com');
INSERT INTO EMPLOYEE
(FirstName, LastName, Department, Position, Supervisor, OfficePhone, EmailAddress)
       VALUES('Ken', 'Evans', 'Finance', 'CFO', 1,
       '360-285-8410', 'Ken.Evans@WP.com');

INSERT INTO EMPLOYEE
(FirstName, LastName, Department, Position, Supervisor, OfficePhone, EmailAddress)
       VALUES('Mary', 'Abernathy', 'Finance', 'FA3', 6,
       '360-285-8420', 'Mary.Abernathy@WP.com');
INSERT INTO EMPLOYEE
(FirstName, LastName, Department, Position, Supervisor, OfficePhone, EmailAddress)
       VALUES(
       'Tom', 'Caruthers', 'Accounting', 'FA2', 6,
       '360-285-8430', 'Tom.Caruthers@WP.com');
INSERT INTO EMPLOYEE
(FirstName, LastName, Department, Position, Supervisor, OfficePhone, EmailAddress)
       VALUES('Heather', 'Jones', 'Accounting', 'FA2', 6,
       '360-285-8440', 'Heather.Jones@WP.com');
INSERT INTO EMPLOYEE
(FirstName, LastName, Department, Position, Supervisor, OfficePhone, EmailAddress)
       VALUES('Ken', 'Numoto', 'Sales and Marketing', 'SM3', 1,
       '360-287-8510', 'Ken.Numoto@WP.com');
INSERT INTO EMPLOYEE
(FirstName, LastName, Department, Position, Supervisor, OfficePhone, EmailAddress)
       VALUES('Linda', 'Granger', 'Sales and Marketing', 'SM2', 10,
       '360-287-8520', 'Linda.Granger@WP.com');
INSERT INTO EMPLOYEE
(FirstName, LastName, Department, Position, Supervisor, OfficePhone, EmailAddress)
       VALUES('James', 'Nestor', 'InfoSystems', 'CIO', 1,
       '360-287-8610', 'James.Nestor@WP.com');
INSERT INTO EMPLOYEE
(FirstName, LastName, Department, Position, Supervisor, EmailAddress)
       VALUES('Rick', 'Brown', 'InfoSystems', 'IS2', 12, 'Rick.Brown@WP.com');
INSERT INTO EMPLOYEE
(FirstName, LastName, Department, Position, Supervisor, OfficePhone, EmailAddress)
       VALUES('Mike', 'Nguyen', 'Research and Development', 'CTO', 1,
       '360-287-8710', 'Mike.Nguyen@WP.com');
INSERT INTO EMPLOYEE
(FirstName, LastName, Department, Position, Supervisor, OfficePhone, EmailAddress)
       VALUES('Jason', 'Sleeman', 'Research and Development', 'RD3', 14,
       '360-287-8720', 'Jason.Sleeman@WP.com');
INSERT INTO EMPLOYEE
(FirstName, LastName, Department, Position, Supervisor, OfficePhone, EmailAddress)
       VALUES('Mary', 'Smith', 'Production', 'OPS3', 1,
       '360-287-8810', 'Mary.Smith@WP.com');
INSERT INTO EMPLOYEE
(FirstName, LastName, Department, Position, Supervisor, OfficePhone, EmailAddress)
       VALUES('Tom', 'Jackson', 'Production', 'OPS2', 14,
       '360-287-8820', 'Tom.Jackson@WP.com');
INSERT INTO EMPLOYEE
(FirstName, LastName, Department, Position, Supervisor, OfficePhone, EmailAddress)
       VALUES('George', 'Jones', 'Production', 'OPS2', 15,
       '360-287-8830', 'George.Jones@WP.com');
INSERT INTO EMPLOYEE
(FirstName, LastName, Department, Position, Supervisor, EmailAddress)
       VALUES('Julia', 'Hayakawa', 'Production', 'OPS1', 15, 'Julia.Hayakawa@WP.com');
INSERT INTO EMPLOYEE
(FirstName, LastName, Department, Position, Supervisor, EmailAddress)
       VALUES('Sam', 'Stewart', 'Production', 'OPS1', 15, 'Sam.Stewart@WP.com');

INSERT INTO PROJECT VALUES(
       1000,'2017 Q3 Production Plan', 'Production', 100.00, '2017-05-10',
       '2017-06-15');
INSERT INTO PROJECT VALUES(
       1100,'2017 Q3 Marketing Plan', 'Sales and Marketing', 135.00, '2017-05-10',
       '2017-06-15');
INSERT INTO PROJECT VALUES(
       1200,'2017 Q3 Portfolio Analysis', 'Finance', 120.00, '2017-07-05',
       '2017-07-25');
INSERT INTO PROJECT VALUES(
       1300,'2017 Q3 Tax Preparation', 'Accounting', 145.00, '2017-08-10',
        '2017-10-15');
INSERT INTO PROJECT VALUES(
       1400,'2017 Q4 Production Plan', 'Production', 100.00, '2017-08-10',
        '2017-09-15');
INSERT INTO PROJECT VALUES(
       1500,'2017 Q4 Marketing Plan', 'Sales and Marketing', 135.00, '2017-08-10',
        '2017-09-15');
INSERT INTO PROJECT(ProjectID, ProjectName, Department, MaxHours, StartDate)
       VALUES(1600,'2017 Q4 Portfolio Analysis', 'Finance', 140.00, '2017-10-05');
       
       INSERT INTO ASSIGNMENT VALUES(1000, 1, 30.0);
INSERT INTO ASSIGNMENT VALUES(1000, 6, 50.0);
INSERT INTO ASSIGNMENT VALUES(1000, 10, 50.0);
INSERT INTO ASSIGNMENT VALUES(1000, 16, 75.0);
INSERT INTO ASSIGNMENT VALUES(1000, 17, 75.0);
INSERT INTO ASSIGNMENT VALUES(1100, 1, 30.0);
INSERT INTO ASSIGNMENT VALUES(1100, 6, 75.0);
INSERT INTO ASSIGNMENT VALUES(1100, 10, 55.0);
INSERT INTO ASSIGNMENT VALUES(1100, 11, 55.0);
INSERT INTO ASSIGNMENT VALUES(1200, 3, 20.0);
INSERT INTO ASSIGNMENT VALUES(1200, 6, 40.0);
INSERT INTO ASSIGNMENT VALUES(1200, 7, 45.0);
INSERT INTO ASSIGNMENT VALUES(1200, 8, 45.0);
INSERT INTO ASSIGNMENT VALUES(1300, 3, 25.0);
INSERT INTO ASSIGNMENT VALUES(1300, 6, 40.0);
INSERT INTO ASSIGNMENT VALUES(1300, 8, 50.0);
INSERT INTO ASSIGNMENT VALUES(1300, 9, 50.0);
INSERT INTO ASSIGNMENT VALUES(1400, 1, 30.0);
INSERT INTO ASSIGNMENT VALUES(1400, 6, 50.0);
INSERT INTO ASSIGNMENT VALUES(1400, 10, 50.0);
INSERT INTO ASSIGNMENT VALUES(1400, 16, 75.0);
INSERT INTO ASSIGNMENT VALUES(1400, 17, 75.0);
INSERT INTO ASSIGNMENT VALUES(1500, 1, 30.0);
INSERT INTO ASSIGNMENT VALUES(1500, 6, 75.0);
INSERT INTO ASSIGNMENT VALUES(1500, 10, 55.0);
INSERT INTO ASSIGNMENT VALUES(1500, 11, 55.0);
INSERT INTO ASSIGNMENT VALUES(1600, 3, 20.0);
INSERT INTO ASSIGNMENT VALUES(1600, 6, 40.0);
INSERT INTO ASSIGNMENT VALUES(1600, 7, 45.0);
INSERT INTO ASSIGNMENT VALUES(1600, 8, 45.0);



        