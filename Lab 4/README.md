# Lab 4 — DQL (Aggregation, Subqueries & DML)

## Task

1. Display (using `UNION`) the name and gender of female dependents who depend on a female employee, and male dependents who depend on a male employee.
2. For each project, list the project name and the total hours per week (for all employees) spent on that project.
3. Display the data of the department that has the smallest employee ID over all employees' IDs.
4. For each department, retrieve the department name and the maximum, minimum and average salary of its employees.
5. List the full name of all managers who have no dependents.
6. For each department — if its average salary is less than the average salary of all employees — display its number, name and number of employees.
7. Retrieve a list of employee names and the project names they are working on, ordered by department number and, within each department, alphabetically by last name then first name.
8. Get the max 2 salaries using a subquery.
9. Get the full name of employees whose name is similar to any dependent name.
10. Display the employee number and name if at least one of them has dependents (use `EXISTS`, self-study).
11. Insert a new department called "DEPT IT" with ID 100, with the employee whose SSN = 112233 as manager, start date '1-11-2006'.
12. Scenario: Mrs. Noha Mohamed (SSN = 968574) moved to be manager of the new department (ID = 100), and you (SSN = 102672) took over her old position (Dept. 20 manager):
    - Update her record in the department table.
    - Update your record to be department 20 manager.
    - Update employee number 102660 to be supervised by you (SSN = 102672).
13. The company ended the contract with Mr. Kamel Mohamed (SSN = 223344) — delete his data, knowing you will temporarily take his position. (Check if he has dependents, is a department manager, supervises employees, or works on any projects, and handle these cases.)
14. Update the salaries of all employees who work on project "Al Rabwah" by +30%.

## Answers

See [`queries.sql`](queries.sql).
