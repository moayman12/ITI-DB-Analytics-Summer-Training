# Lab 6 — SQL Server: Stored Procedures & Triggers

## Task

1. Create a stored procedure (no parameters) to show the number of students per department name. [ITI DB]
2. Create a stored procedure that checks the number of employees on project P1: if 3 or more, print "The number of employees in the project p1 is 3 or more"; otherwise print "The following employees work for the project p1" along with each one's first and last name. [Company DB]
3. Create a stored procedure used when an old employee leaves a project and a new one replaces them. It takes 3 parameters (old employee number, new employee number, project number) and updates the `Works_On` table. [Company DB]
4. Add a `Budget` column to the Project table with draft values, then create an `Audit` table (ProjectNo, UserName, ModifiedDate, Budget_Old, Budget_New) to audit updates on the Budget column — only when the Budget column is actually updated. [Company DB]
5. Create a trigger to prevent anyone from inserting a new record into the Department table, printing a message telling the user they can't insert a new record. [ITI DB]
6. Create a trigger that prevents inserting into the Employee table during the month of March. [Company DB]
7. Create a trigger on the Student table, after insert, that adds a row to a `Student_Audit` table (Server User Name, Date, Note), where the note is `"[username] Insert New Row with Key=[Key Value] in table [table name]"`.
8. Create a trigger on the Student table, instead of delete, that adds a row to `Student_Audit` (Server User Name, Date, Note), where the note is `"try to delete Row with Key=[Key Value]"`.

## Answers

See [`queries.sql`](queries.sql).
