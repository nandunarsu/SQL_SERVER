create database Employeedb;

use Employeedb;

create table department(
departmentid int primary key,
departmentname varchar(20),
department varchar(100)
);

insert into department values(1,'ISE','201');
insert into department values(2,'ECE','202');

create table employee1(
firstname varchar(20),
lastname varchar(30),
departmentid int,
foreign key(departmentid) references department(departmentid));

insert into employee1 values('nandu','nk',1);
insert into employee1 values('nalini','nk',2);

select * from EMPLOYEE;
select * from STUDENT;

CREATE TABLE STUDENT1(
ID INT PRIMARY KEY,
STUDENTNAME VARCHAR(30),
PHONE VARCHAR(30)
);

CREATE TABLE COURSES(
COURSEID INT PRIMARY KEY,
COURSENAME VARCHAR(30),
STUID INT,
FOREIGN KEY(STUID) REFERENCES STUDENT1(ID)
);

use Employeedb
select GETDATE();

select * from EMPLOYEE;
alter table EMPLOYEE
add departmentid int;
select * from department;

create clustered index primary_key on EMPLOYEE(EMPID);

create procedure InsertvaluesSP
@id int,
@Name varchar(30),
@Address varchar(30)
AS
BEGIN
insert into department(departmentid,departmentname,department) values(@id,@Name,@Address);
END;

create procedure UpdatevaluesSP
@id int,
@EMPID varchar(30)
AS
BEGIN
UPDATE EMPLOYEE SET departmentid = @id where EMPID = @EMPID;
END;
 execute InsertvaluesSP 4, 'Civil', '203'
 execute UpdatevaluesSP1 @EMPID = 5, @id = 4

 create procedure UpdatevaluesSP1
@id int,
@EMPID INT
AS
BEGIN
UPDATE EMPLOYEE SET departmentid = @id where EMPID = @EMPID;
END;

select d.departmentname, COUNT(*) as totalemployee from EMPLOYEE e ,department d  group by d.departmentid
use Employeedb
With Employees_name
as
(
	select EMPID,ENPNAME from EMPLOYEE
)SELECT * FROM Employees_name;

With Employee_age
as
(
	select EMPID,ENPNAME,AGE from EMPLOYEE
)update EMPLOYEE set AGE = 23 where EMPID = 3


SELECT * FROM EMPLOYEE;
use nandinidb;
use nandinidb;

select i.name as index_name,t.name as table_name, count(*) as occurence from sys.indexes i 
inner join sys.tables t on i.object_id = t.object_id
inner join sys.index_columns c on c.object_id = i.object_id and c.index_id = i.index_id
group by i.name, t.name having count(*) > 1 ;

SELECT
    i.name AS index_name,
    OBJECT_NAME(i.object_id) AS table_name,
    i.type_desc AS index_type,
    i.is_unique,
    c.name AS column_name,
    ic.index_column_id
FROM
    sys.indexes i
INNER JOIN 
    sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
INNER JOIN 
    sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
WHERE
    i.type_desc IN ('CLUSTERED', 'NONCLUSTERED')
GROUP BY
    i.name,
    OBJECT_NAME(i.object_id),
    i.type_desc,
    i.is_unique,
    c.name,
    ic.index_column_id
HAVING 
    COUNT(*) > 1
ORDER BY
    OBJECT_NAME(i.object_id),
    i.name;

select * from sys.tables t;
select * from sys.index_columns c;

select * from sys.all_objects;

select * from sys.indexes i;
select * from sys.sql_modules;
SELECT DISTINCT OBJECT_NAME(object_id) AS FunctionName
FROM sys.sql_modules
WHERE definition LIKE '%craete%';
 and OBJECTPROPERTY(object_id, 'IsScalarFunction') = 1;

 sp_helptext CALCULATE_AGE;
SELECT name AS ParameterName FROM sys.parameters
WHERE object_id = OBJECT_ID('CALCULATE_AGE');

use Employeedb;
SELECT 
    name AS index_name, 
    COUNT(*) AS occurrences
FROM 
    sys.indexes
WHERE 
    OBJECTPROPERTY(object_id, 'IsUserTable') = 1
GROUP BY 
    name
HAVING 
    COUNT(*) > 1
with 