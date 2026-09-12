# Lab 5 — Advanced SQL Server Lab

**Notes:** Restore the `ITI` and `AdventureWorks2012` DBs to the server first.

## Part 1 — ITI DB

1. Retrieve the number of students who have a value in their age.
2. Get all instructor names without repetition.
3. Display each student with ID, full name, and department name (use `ISNULL`).
4. Display instructor name and department name (show all instructors whether attached to a department or not).
5. Display student full name and the course name he is taking, only for courses that have a grade.
6. Display the number of courses for each topic name.
7. Display the max and min salary for instructors.
8. Display instructors who have salaries less than the average salary of all instructors.
9. Display the department name that contains the instructor who receives the minimum salary.
10. Select the max two salaries in the instructor table.
11. Select instructor name and salary, but if there is no salary display "use coalesce Function" (use `COALESCE`).
12. Select the average salary for instructors.
13. Select student first name and the data of his supervisor.
14. Create a view that displays student full name and course name, only if the student has a grade more than 50.
15. Create a view that displays manager names and the topics they teach.
16. Create a view that displays instructor name and department name for the 'SD' or 'Java' department.

## Part 2 — AdventureWorks DB

1. Display SalesOrderID and ShipDate (SalesOrderHeader, Sales schema) for orders between '7/28/2002' and '7/29/2014'.
2. Display products (Production schema) with StandardCost below $110.00 (ProductID, Name only).
3. Display ProductID and Name if the weight is unknown.
4. Display all products with a Silver, Black, or Red color.
5. Display any product with a name starting with the letter B.
6. Run the given `UPDATE` on `Production.ProductDescription` (id = 3), then write a query that displays any product description containing an underscore.
7. Calculate the sum of `TotalDue` for each `OrderDate` in `Sales.SalesOrderHeader` between '7/1/2001' and '7/31/2014'.
8. Display the employees' HireDate with no repeated values.
9. Calculate the average of the unique `ListPrice` values in the Product table.
10. Display the product name and its `ListPrice` (between 100 and 120) as "The [product name] is only! [List price]", sorted by list price.

## Answers

Part 1 answers are in [`queries_part1.sql`](queries_part1.sql).
Part 2 (AdventureWorks) answers are in [`queries_part2.sql`](queries_part2.sql).
