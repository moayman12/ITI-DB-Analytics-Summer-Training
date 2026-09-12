--1.Display the Department id, name and id and the name of its manager.--
select Dnum, Dname, SSN ,Fname + ' ' + Lname as full_name
from Departments d join Employee e
on d.Dnum = e.Dno
--2.Display the name of the departments and the name of the projects under its control--
select d.Dname, p.Pname
from Departments d join Project p
on d.Dnum = p.Dnum
--3.Display the full data about all
--the dependence associated with the name of the employee they depend on him/her--
select d.*, e.Fname + ' ' + e.Lname As Full_name
from Dependent d join Employee e
on d.ESSN = e.SSN
--4.Display the Id, name and location of the projects in Cairo or Alex city.--
select Pnumber, Pname, Plocation
from Project
where City = 'Cairo' or City= 'Alex'
--5.Display the Projects full data of the projects with a name starts with "a" letter.--
select *
from Project
where Pname like 'a%'
--6.display all the employees in department 30 whose salary from 1000 to 2000 LE monthly--
select *
from Employee 
where Dno = 30 and Salary between 1000 and 2000
--7.Retrieve the names of all employees in department 10 who works 
--more than or equal10 hours per week on "AL Rabwah" project.
select Fname +' ' + Lname as Full_name
from Employee e join Works_for w
on e.SSN = w.ESSn 
join Project p 
on w.Pno = p.Pnumber
where e.Dno = 30 and w.Hours > 10 and p.Plocation = 'AL Rabwah'
--8.Find the names of the employees who directly supervised with Kamel Mohamed.
select e.Fname + ' ' + e.Lname as Full_name
from Employee e join Employee s
on e.SSN = s.Superssn
where s.Fname + ' ' + s.Lname = 'Kamel Mohamed'
--9.Retrieve the names of all employees and the names of the projects 
--they are working on, sorted by the project name
select e.Fname + ' ' + e.Lname as Full_Name
from Employee e join Works_for w
on e.SSN = w.ESSn
join Project p 
on w.Pno = p.Pnumber
order by p.Pname
--10.For each project located in Cairo City , find the project number, the controlling department name 
--,the department manager last name ,address and birthdate
select p.Pnumber, d.Dname, e.Lname, e.Address, e.Bdate
from Project p join Departments d
on p.Dnum = d.Dnum
join Employee e
on d.MGRSSN = e.SSN
where p.City = 'Cairo'
--11.Display All Data of the managers--
select e.*
from Employee e join Departments d
ON e.ssn = d.mgrssn;
--12.Display All Employees data and the data of their dependents even if they have no dependents
select
    e.*,
    d.*
from Employee e left join Dependent d 
on e.ssn = d.essn;

--13.Insert your personal data to the employee table as a new employee in department number 30, 
--SSN = 102672, Superssn = 112233, salary=3000.--
insert into Employee(Dno, SSN, Superssn, Salary)
values(30, 102672, 112233, 3000)

--14.Insert another employee with personal data your friend as new employee in department number 30,
--SSN = 102660,but don't enter any value for salary or supervisor number to him.
insert into Employee(Fname, Lname, SSN, Bdate, Address, Sex, Dno)
values('Mohamed', 'Ali', 212121, '2005-05-08', 'Giza, Egypt', 'M', 30)

--15.Upgrade your salary by 20 % of its last value.--
update Employee
set Salary =  Salary * 1.20
