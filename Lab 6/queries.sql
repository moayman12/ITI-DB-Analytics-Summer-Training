--1.Create a stored procedure without parameters to 
--show the number of students per department name.[use ITI DB] 
create procedure StudentCount
as
begin
select  d.Dept_Name,  COUNT(s.St_Id) AS number_of_students
from Department d left join Student s 
on d.Dept_Id = s.Dept_Id
group by d.Dept_Name
end

--2.Create a stored procedure that will check for the # of employees in the project p1 if they 
--are more than 3 print message to the user 'The number of employees in the project p1 is 3 or more' 
--if they are less display a message to the user 'The following employees work for the project p1' 
--in addition to the first name and last name of each one. [Company DB] 

create procedure checkProjectP1Employees
as
begin
declare @EmpCount int
 set @EmpCount = (select COUNT(ESSn)  from works_for where Pno = 1)

 if @EmpCount >= 3
select 'The number of employees in the project p1 is 3 or more'
else
begin
select 'The following employees work for the project p1'

select e.fname, e.lname
FROM Employee e join Works_for w
on e.SSN = w.ESSn
where w.Pno = 1
end
end;

--3.Create a stored procedure that will be used in case there is an old employee has left 
--the project and a new one become instead of him. The procedure should take 3 parameters 
--(old Emp. number, new Emp. number and the project number) and it will be used to update works_on table. [Company DB]
create procedure ReplaceEmp
@OldEmpNo int,
@NewEmpNo int,
@ProjectNo int
as
begin
update Works_for
set ESSn = @NewEmpNo
where ESSn = @OldEmpNo and Pno = @ProjectNo
end;

--4.Add column budget in project table and insert any draft values in it then 
--create an Audit table with the following structure 

alter table project
add Budget decimal(15, 2);

update project
set Budget = 95000;

create table ProjectBudget
(
    Projectno varchar(20),
    Username varchar(20),
    Modifieddate date,
    Budgetold decimal(12, 2),
    Budgetnew decimal(12, 2)
);

create trigger TR_Audit
on project
after update
as
begin
IF update(Budget)
begin
insert into ProjectBudget ( Projectno, Username,  Modifieddate, Budgetold, Budgetnew)
select i.Pnumber, SUSER_NAME(), CAST(GETDATE() AS DATE), d.Budget, i.Budget                     
from inserted i join deleted d 
on i.Pnumber = d.Pnumber
where i.Budget <> d.Budget OR (i.Budget IS NOT NULL AND d.Budget IS NULL)
end;
end;

--5.Create a trigger to prevent anyone from inserting a new record in the Department table [ITI DB]
--"Print a message for user to tell him that he can't insert a new record in that table"
create trigger PreventInsert
on Department
instead of insert
as
begin 
    select 'You can''t insert a new record in this table.'
end;

--6.Create a trigger that prevents the insertion Process for Employee table in March [Company DB].
create trigger PreventInsertEmployee
on Employee
instead of insert
as
begin
if MONTH(GETDATE()) = 3
   select 'You can''t insert a new record in this table during March.';
else 
  begin
   insert into Employee
    select * from inserted;
  end
end;

--7.Create a trigger on student table after insert to add Row in Student Audit table 
--(Server User Name , Date, Note) where note will be "[username] Insert New Row with Key=[Key Value] in table [table name]"

create table Student_Audit
(
    Serverusername varchar(100),
    Date date,
    Note varchar(250)
);

create trigger TR_Audit_
on Student
after insert
as
begin
    insert into Student_Audit (Serverusername, Date, Note)
    select  SUSER_NAME(),CAST(GETDATE() AS DATE),CONCAT(SUSER_NAME(), ' Insert New Row with Key=', i.St_ID, ' in table student')
    from inserted i;
end;

--8.Create a trigger on student table instead of delete to add Row in Student Audit table 
--(Server User Name, Date, Note) where note will be "try to delete Row with Key=[Key Value]"
create trigger TR_PreventDelete
on Student
instead of delete
as
begin
insert into Student_Audit (Serverusername, Date, Note)
   select SUSER_NAME(), CAST(GETDATE() AS DATE), CONCAT('try to delete Row with Key=', d.st_id)
   from deleted d;
end;
