--1.Retrieve number of students who have a value in their age.
Select COUNT(St_Id) as Number_Student 
from Student
where St_Age is not null

--2.Get all instructors Names without repetition
select distinct Ins_Name 
from Instructor

--3.Display student with the following Format (use isNull function)
select s.St_Id, Concat(s.St_Fname ,' ', s.St_Lname) as Full_name , ISNULL(d.Dept_Name, 'No Department') as Department
from Student s left join Department d
on s.Dept_Id = d.Dept_Id

--4.Display instructor Name and Department Name
select i.Ins_Name, d.Dept_Name
from Instructor i left join Department d
on i.Dept_Id = d.Dept_Id

--5.Display student full name and the name of the course he is taking
--For only courses which have a grade  
select concat(s.St_Fname , ' ' , s.St_Lname) as Full_Name, c.Crs_Name
from Student s join Stud_Course sc
on s.St_Id = sc.St_Id 
join Course c 
on sc.Crs_Id = c.Crs_Id
where sc.Grade is not null

--6.Display number of courses for each topic name
select count(c.Crs_Id) as Number_Courses , t.Top_Name
from Course c join Topic t
on c.Top_Id = t.Top_Id
group by t.Top_Name

--7.Display max and min salary for instructors
select Max(Salary) as 'Max Salary' , Min(Salary) as 'Min Salary'
from Instructor

--8.Display instructors who have salaries less than the average salary of all instructors.
select Ins_Id, Ins_Name
from Instructor
group by Ins_Id, Ins_Name
having avg(Salary)<(select avg(Salary) from Instructor)

--9.Display the Department name that contains the instructor who receives the minimum salary.
select d.Dept_Name
from Department d join Instructor i
on d.Dept_Id = i.Dept_Id
where i.Salary = (select min(Salary) from Instructor)
group by d.Dept_Name

--10.Select max two salaries in instructor table. 
select top 2 Salary
from Instructor
order by Salary Desc

--11.Select instructor name and his salary but if there 
--is no salary display instructor bonus keyword. "use coalesce Function"
select Ins_Name, ISNULL(CAST(Salary AS VARCHAR(20)), 'use coalesce Function') as Salary 
from Instructor

--12.Select Average Salary for instructors 
select avg(Salary) as 'Average Salary'
from Instructor

--13.Select Student first name and the data of his supervisor 
select s.St_Fname , sp.*
from Student s join Student sp
on s.St_Id = sp.St_super

--14.Create a view that displays student full name, course name if the student has a grade more than 50.
create view PassedStudent
as
select CONCAT(s.St_Fname, ' ', s.St_Lname) as full_name, c.Crs_Name AS course_name
from  Student s join Stud_Course sc 
on s.St_Id = sc.St_Id
join Course c 
on sc.Crs_Id = c.Crs_Id
where sc.Grade > 50;

--15. Create view that displays manager names and the topics they teach. 
create view display
as 
select i.Ins_Name, t.Top_Name
from Instructor i join Ins_Course ic
on i.Ins_Id = ic.Ins_Id
join Course c
on ic.Crs_Id = c.Crs_Id
join Topic t
on c.Top_Id = t.Top_Id

--16.Create a view that will display Instructor Name, Department Name for the 'SD' or 'Java' Department 
create view display_Inst
as 
select i.Ins_Name, d.Dept_Name
from Instructor i join Department d
on i.Dept_Id = d.Dept_Id
where d.Dept_Name in ('SD', 'Java')
