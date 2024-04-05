----joins------
use nandinidb;
create schema hr;
go

create table student1(
studentid int primary key,
studentname varchar(50),
Dateofbirth date,
country varchar(50),
gender varchar(20),
email varchar(50) unique,
phone varchar(50) unique,
Studentaddress varchar(100)
);
insert into student1 values(1,'Nandu','2000-10-11','India','female','nandinink1947@gmail.com','9538743463','R T nagar');
insert into student1 values(2,'Naresh','1998-11-13','Sudan','male','naresh1947@gmail.com','9060631579','Honoi');
insert into student1 values(3,'Nalini','2000-09-11','Dubai','female','nalini1947@gmail.com','9538743467','Dubai');
insert into student1 values(4,'Ramya','2002-04-27','India','female','billuramya2002@gmail.com','6304796656','Tirupati');
insert into student1 values(5,'Ramya v','2002-03-27','Vietnum','female','billuramyav2002@gmail.com','6304790656','honai');
insert into student1 values(6,'Nandita','2001-10-11','India','female','nandita@gmail.com','9238743463','Rajajinagr');
insert into student1 values(7,'Nagamani','2000-09-11','Vietnum','female','nagamani@gmail.com','9538743469','honai');
insert into student1 values(8,'Nagu','2000-10-11','India','female','nagu@gmail.com','9538743460',' ');
insert into student1 values(9,'Namrata','1999-10-11','Sudan','female','namrata@gmail.com','9538443463','hong kong');
insert into student1 values(10,'Mahesh','2000-10-11','India','female','mahesh@gmail.com','9538763463','R T nagar');
select * from student1;

create table department(
departmentid int primary key,
departmentname varchar(30),
managerid int,
employeecount int
);

insert into department values(11,'SCIENCE',21,4);
insert into department values(12,'COMMERCE',22,5);
insert into department values(13,'ARTS',23,6);
insert into department values(14,'ITI',24,6);

select * from department;

CREATE TABLE course(
    courseid INT primary key,
    coursename VARCHAR(50),
	managerid int,
	studentid int,
	foreign key(studentid) references student1(studentid)
);


insert into course values (101,'PCMB',21,7);
insert into course values (102,'PCMC',21,8);
insert into course values (103,'CEBA',22,2);
insert into course values (104,'HEBA',22,5);
insert into course values (105,'ITI',24,1);
insert into course values (106,'PCMB',21,9);
insert into course values (107,'ITI',24,7);
insert into course values (108,'PCMC',21,4);
insert into course values (109,'SOCIOLOGY',23,3);
insert into course values (110,'POLITICAL SCIENCE',23,10);


select * from course;

create table enrollment(
enrollmentid int primary key,
studentid int ,
courseid int,
enrollmentdate date,
coursefees decimal,
foreign key (studentid) references student1(studentid),
foreign key (courseid) references course(courseid)
);


insert into enrollment values(1,1,105,'2016-06-11',16000);
insert into enrollment values(2,2,103,'2016-07-11',15000);
insert into enrollment values(3,3,109,'2016-08-11',20000);
insert into enrollment values(4,4,108,'2016-07-11',20000);
insert into enrollment values(5,5,104,'2016-06-21',15000);
insert into enrollment values(6,6,107,'2016-07-17',16000);
insert into enrollment values(7,7,101,'2016-06-11',20000);
insert into enrollment values(8,8,102,'2016-07-01',20000);
insert into enrollment values(9,9,106,'2016-06-11',12000);
insert into enrollment values(10,10,110,'2016-07-11',12000);
insert into enrollment values(11,6,107,'2016-07-17',16000);
insert into enrollment values(12,7,101,'2016-06-11',20000);
insert into enrollment values(13,8,102,'2016-07-01',20000);
insert into enrollment values(14,9,106,'2016-06-11',12000);
insert into enrollment values(15,10,110,'2016-07-11',12000);

select * from enrollment;

update enrollment
set enrollmentdate = '2016-09-11'
where enrollmentid = 1;

------------------------------------------------inner join------------------------------------------------
select s.studentname,e.courseid,e.enrollmentdate,c.coursename,c.managerid from student1 s inner join  enrollment e on s.studentid = e.studentid 
inner join course c on (e.courseid = c.courseid and e.coursefees > 15000);
----------------------------------------------------left join----------------------------------------------
select s.studentname,e.courseid,e.enrollmentdate,c.coursename,c.managerid from student1 s left join  enrollment e on s.studentid = e.studentid 
left join course c on e.studentid = c.courseid; --and e.coursefees > 15000);
--------------------------------------------------right join----------------------------------------------------
select s.studentname,e.courseid,e.enrollmentdate,c.coursename,c.managerid from student1 s right join  enrollment e on s.studentid = e.studentid 
right join course c on (e.studentid = c.courseid and e.coursefees > 15000);
-----------------------------------------------------full outer join----------------------------------------------
select s.studentname,e.courseid,e.enrollmentdate,c.coursename,c.managerid from student1 s full outer join  enrollment e on s.studentid = e.studentid 
full outer join course c on (e.studentid = c.courseid and e.coursefees > 15000);
----------------------------------------------------cross join-------------------------------------------------------
select s.studentname,e.courseid,e.enrollmentdate from student1 s cross join  enrollment e;-- on s.studentid = e.studentid 
--cross join course c on (e.studentid = c.courseid and e.coursefees > 15000);
--------------------------------------------self join----------------------------------------------------------------------
select * from student1 s 
inner join student1 t on  (s.Studentaddress = t.Studentaddress and t.Dateofbirth > '2000-05-10'and s.Dateofbirth > '2000-05-10') 
where s.country = 'India';
--------------------------------group by---------------------------------
select  studentid,coursefees  from enrollment  group by studentid,coursefees having sum(coursefees) in (15000,20000);
----------------------------------like-------------------------------------------------------
select * from student1 where studentname like 'na%';
------------------------------------------------------subquery-------------------------------------------------------------
select * from student1 where studentid in (select studentid from course where coursename = 'PCMC'); 

create table studentearning(
studentid int,
earning decimal,
foreign key(studentid) references student1(studentid)
);

insert into studentearning values (1,789.00);
insert into studentearning values (2,1000.10);
insert into studentearning values (3,890.00);
insert into studentearning values (4,1020.00);
insert into studentearning values (5,600.00);
insert into studentearning values (6,1390.98);
insert into studentearning values (7,709.00);

update studentearning
set earning=20000
where studentid = 5;

select * from studentearning;
select * from student1 where studentid =1;
----------------------third largest number--------------------------
select min(earning) as third_large from studentearning where earning > (
select min(earning) from studentearning where earning >(
select min(earning) from studentearning));
--------------------------------subquery -------------------------------
select * from student1 where studentid not in (select studentid from studentearning);
-------------------------------------------------- UNION---------------------------
select departmentid from department union all select studentid from studentearning;
---------------------------------------INTERSECT------------------------------------
select courseid from course intersect select courseid from enrollment; 
--------------------------------------	EXCEPT-----------------------------------
select top(5) enrollmentdate from enrollment order by studentid;
select  earning from studentearning order by earning;
select * from studentearning order by earning offset 4 rows fetch next 1 row only;

select s.studentname,s.country,s.email,s.gender from student1 s, studentearning e where s.studentid = e.studentid and earning > (select AVG(earning) from studentearning);

select e.name from employee e ,department d where e.id = d.id and  d.salary > (select avg(salary) from department);

CREATE VIEW student_course_enroll_details (
    studentname,
    courseid,
    enrollmentdate,
    coursename,
    managerid
)
AS
SELECT
    s.studentname,
    e.courseid,
    e.enrollmentdate,
    c.coursename,
    c.managerid
FROM
    student1 s
INNER JOIN
    enrollment e ON s.studentid = e.studentid
INNER JOIN
    course c ON (e.courseid = c.courseid AND e.coursefees > 15000);

SELECT * FROM student_course_enroll_details;

CREATE VIEW STUDENTS_IN_INDIA(
studentid,
NAME,
Departmentname
)
AS
SELECT 
S.studentid,
S.studentname,
D.departmentname
FROM
student1 S
INNER JOIN enrollment E ON S.studentid = E.studentid
INNER JOIN course C ON E.courseid =  C.courseid
INNER JOIN department D ON C.managerid = D.managerid;

SELECT * FROM STUDENTS_IN_INDIA;
DROP VIEW IF EXISTS STUDENTS_IN_INDIA;
----------------TO SEE THE VIEWS-----------------------------
SELECT * FROM SYS.views;
SELECT * FROM SYS.OBJECTS WHERE NAME = 'STUDENTS_IN_BHARAT';
---------------TO GET THE VIEW INFORMATION------------------------
SELECT definition,uses_ansi_nulls,uses_quoted_identifier,is_schema_bound  
FROM SYS.sql_modules 
WHERE object_id = object_id('STUDENTS_IN_INDIA');
--------------RENAMEING A VIEW-----------------
EXEC sp_rename @OBJNAME = 'STUDENTS_IN_INDIA', @newname = 'STUDENTS_IN_BHARAT';

--------USER DEFINED FUNTIONS----------
SELECT SQUARE(3);
SELECT GETDATE();

----------CREATING FUNCTIONS (SCALAR)----------
CREATE FUNCTION CALCULATE_AGE(@DOB DATE)
RETURNS INT
AS
BEGIN
DECLARE @AGE INT
SET @AGE = DATEDIFF(YEAR,@DOB,GETDATE()) -
			CASE
			WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR
				 (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB)  = DAY(GETDATE()))
			THEN 1
			ELSE 0
			END
RETURN @AGE
END;
--------------execute function--------------
select dbo.CALCULATE_AGE('11/10/2000') as age;
select dbo.CALCULATE_AGE('11/10/2000');

select studentid,studentname,dbo.CALCULATE_AGE(Dateofbirth) AS AGE from student1 
WHERE dbo.CALCULATE_AGE(Dateofbirth) > 22;

sp_helptext CALCULATE_AGE;

------------CRAETE FUNCTION (INLINE_TABLE_VALUED)-------------------
CREATE FUNCTION STUDETSBYGENDER(@GENDER VARCHAR(30))
RETURNS TABLE
AS
RETURN (SELECT studentid,studentname,email,phone from student1 where gender = @GENDER)

SELECT * from dbo.STUDETSBYGENDER('FEMALE');
------------WE CAN USE WHERE CLAUSE AND JOINS IN 
SELECT * from dbo.STUDETSBYGENDER('FEMALE') 
WHERE studentname LIKE 'NAN%';

UPDATE STUDETSBYGENDER('FEMALE') SET studentname = 'RESHMA' WHERE studentid = 3;

-----------MULTISTATEMENT_TABLE_VALUE_FUNCTION------------
CREATE FUNCTION STUDENT_DETAILS()
RETURNS @TABLE TABLE(ID INT,NAME VARCHAR(30),ADDRESS VARCHAR(40))
AS
BEGIN
	INSERT INTO @TABLE
	SELECT studentid,studentname,Studentaddress FROM student1
	RETURN 
END;
--------UPDATING IS NOT POSSIBLE-----------
SELECT * FROM STUDENT_DETAILS();
UPDATE STUDENT_DETAILS() SET NAME ='RESHMA'WHERE ID = 3;

SELECT GETDATE();

SELECT GETUTCDATE();

SELECT CURRENT_TIMESTAMP;

SELECT SYSDATETIME();

SELECT SYSDATETIMEOFFSET();

SELECT ISDATE('29/02/2024');
--------------STRING FUNCTIONS------------------
SELECT ASCII('A');

SELECT CHAR(2);

SELECT CHARINDEX('SQL','SQL IS SQL SERVER',7);

SELECT CONCAT('NANDINI','NK');

SELECT LOWER('NANDINI')
SELECT UPPER('nandini')
SELECT LTRIM('I AM NANDINI','AM');
SELECT PATINDEX('%DIN%','NANDINI');
SELECT STUFF('SQL SERVER',1,3,'SQL TUTORIAL');
SELECT REPLICATE('NANDU',2);

-----------SYSTEM FUNCTIONS------------
SELECT 1 + CAST(1 AS INT) RESULT
SELECT CONVERT(INT,9.96);
SELECT CHOOSE (3,'FIRST','SECOND','THIRD');
SELECT TRY_CAST('12.34' AS DECIMAL)
SELECT TRY_CONVERT(INT,'ME')
SELECT TRY_PARSE('14 APRIL 2024' AS DATE);

-----------JSON FUNCTIONS-----------------

SELECT ISJSON('{}')
SELECT ISJSON('HELLO')
SELECT JSON_OBJECT()
SELECT JSON_ARRAY('JOHN', 'JOHN@GMAIL.COM')
SELECT JSON_VALUE('{"NAME": "NANDINI", "AGE" :"23"}','$.AGE');

----------------------trigerrs-----------------------------

CREATE TRIGGER COURSE_TRIGGER
BEFORE INSERT ON COURSE
FOR EACH ROW
BEGIN
	IF NEW.manegerid IS NULL THEN 
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'MANEGER ID CANNOT BE NULL';
	END IF;
END;


CREATE TRIGGER ENROLL_DATA
ON enrollment
FOR INSERT
AS
BEGIN
	select * from inserted
END;
select * from inserted
insert into enrollment values(22,9,106,'2016-06-11',12000);

select * from enrollment;

create table auditdata(
Id int identity(1,1) primary key,
Auditdata varchar(100)
);

select * from auditdata;

CREATE TRIGGER STUDENT_AUDIT
ON enrollment
FOR INSERT
AS
BEGIN
	Declare @Id int
	Select @Id = enrollmentid from inserted
	insert into auditdata
	values ('New Student with ID  = ' + CAST(@ID as varchar(30))
	 + ' is added at ' + cast(GETDATE() as varchar(30))
	 )
END

insert into enrollment values(23,10,106,GETDATE(),12000);

use nandinidb

CREATE TRIGGER ENROLLMENT_UPDATE
ON enrollment
FOR UPDATE
AS
BEGIN
	select * from deleted
	select * from inserted
END

Update enrollment SET coursefees = 101000 where enrollmentid = 21

------------LOGON TRIGERS---------------------

select studentname,courseid,enrollmentdate,coursename,managerid from student_course_enroll_details;

create function myfunction()
returns TABLE
AS
return (select studentid,studentname from student1)

select * from myfunction()

create function add2(@num1 int, @num2 int)
returns int
--declare @num1 int
--declare @num2 int
begin
return (@num1 + @num2)
end;

use nandinidb;
select dbo.add2(3,4) as results;
update Employee set  enpname = manju where empid =2

use Employeedb;
create procedure findvalues
AS
begin
select * from Employee where ENPNAME LIKE 'N%';
end

create procedure findvalues1
@id int
AS
begin
select * from Employee where EMPID=@id;
end

create procedure findvalues2
@id int
AS
begin
select EMPID,ENPNAME,AGE,ADDRESS,departmentid from Employee where EMPID=@id;
end


create table table1(
names varchar(30) unique,
age int
);

create procedure updatevalues
@name varchar(3)
AS
begin
select EMPID,ENPNAME,AGE,ADDRESS,departmentid from Employee where EMPID=@id;
end

CREATE procedure Updatevalues
@name varchar(30),
@age int
AS
BEGIN   if exists(select 1 from table1 where names = @name)
		begin
		update table1 set age = @age 
		end
		else
		begin
		insert into table1 values (@name,@age)
		end
END


CREATE procedure Displayvalue
AS 
BEGIN
	select names,age from table1;		
END


use nandinidb
insert into table1 values('nalini',23);
select * from table1
exec Updatevalues 'nandini',25


