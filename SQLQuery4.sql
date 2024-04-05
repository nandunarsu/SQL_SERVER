create database storedprocedure;
use storedprocedure;
create table Employee(empid int identity(1,1) primary key, Name varchar(20),Age int,Address varchar(30));

create procedure CreateStudentSP
AS
BEGIN
create table Employee(empid int identity(1,1) primary key, Name varchar(20),Age int,Address varchar(30));
END;

create procedure InsertEmpSP
AS
BEGIN
insert into Employee(Name,Age,Address) values('nandita',21,'bangalore');
END;

select * from Employee;

sp_helptext InsertEmpSP;

create procedure GetvaluesSP
@NAME varchar(20)
AS
BEGIN
select empid,Name,Age,Address from Employee where Name = @NAME
END;

Exec GetvaluesSP 'nandita';
Exec GetvaluesSP @NAME = 'nandita';

create procedure DisplaySP
AS
BEGIN
select empid,Name,Age,Address from Employee;
END;

create procedure InsertvaluesSP
@NAME varchar(20),
@AGE int,
@ADDRESS varchar(30)
AS
BEGIN
insert into Employee(Name,Age,Address) values(@NAME,@AGE,@ADDRESS);
END;

InsertvaluesSP 'namrata', 28,'Basavanagudi';

create procedure UpdatevaluesSP
@NAME varchar(20),
@AGE int,
@ADDRESS varchar(30),
@empid int
AS
BEGIN
update Employee set Name = @NAME, Age = @AGE, Address = @ADDRESS where empid = @empid;
END;
UpdatevaluesSP 'narsu',24,'rajajinagar',1;

create procedure DeletevaluesSP
@NAME varchar(20)
AS
BEGIN
delete from Employee where Name = @NAME
END;
----drop proc DeletevaluesSP;----
DeletevaluesSP 'narsu';

select * from Employee;

create procedure selectSp1
@ID INT
AS
BEGIN 
SELECT empid,Name,Age,Address FROM Employee WHERE empid = @ID;
END;

SELECT empid,Name,Age,Address FROM Employee WHERE empid = 2

