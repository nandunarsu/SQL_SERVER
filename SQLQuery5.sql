use nandinidb
Declare @studentid int
Declare @Name varchar(40)

Declare studentcursor cursor for 
select studentid,studentname from student1;

open studentcursor

fetch Next from studentcursor into  @studentid , @Name
while(@@FETCH_STATUS = 0)
begin
print 'ID:' +  cast(@studentid as varchar(10))  + ' Name:' + @Name
fetch Next from studentcursor into @studentid,@Name
end

close studentcursor
deallocate studentcursor

select * from indexes;
use nandinidb
---------------CTE-----------------------
with studentdetails as (
select  s.studentid,s.studentname,e.earning from student1 s
inner join studentearning e on s.studentid =e.studentid
)select * from studentdetails

with studentdetail as (
select  s.studentid,s.studentname,e.earning from student1 s
inner join studentearning e on s.studentid =e.studentid
)--select * from studentearning
update studentdetail set studentname= 'nivedita' where studentid = 2

