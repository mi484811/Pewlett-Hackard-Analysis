
--Create alias for Titles
SELECT t.emp_no,
     t.titles,
     t.from_date,
     t.to_date
FROM titles as t
INNER JOIN employees as e
ON t.emp_no = e.emp_no;

--Retrieve the emp_no, first_name, and last_name columns from the Employees table. Retrieve the title, from_date, and to_date columns from the Titles table.
--Create a new table using the INTO clause. Join both tables on the primary key.
--Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
--Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
--Before you export your table, confirm that it looks like this image:
SELECT e.emp_no,
e.first_name,
e.last_name,
t.titles,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;


--Create alias for Titles
SELECT rt.emp_no,
     rt.first_name,
     rt.last_name,
     rt.titles
FROM retirement_titles as rt
INNER JOIN employees as e
ON rt.emp_no = e.emp_no;

--Check retirement_titles table
SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows for part 2/Deliverable 1
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.titles
INTO unique_title
FROM retirement_titles AS rt
WHERE (to_date ='9999-01-01')
ORDER BY emp_no ASC, to_date DESC;

--Check unique_titles
SELECT * FROM unique_title;

--Removing employees who have left
to_date
-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


--Create alias for Titles
SELECT ut.emp_no,
     ut.titles,
     ut.first_name,
     ut.last_name
FROM unique_title as ut
INNER JOIN employees as e
ON ut.emp_no = e.emp_no;

--COUNT titles of employees going to retire and create table to store quiery results
SELECT COUNT(ut.emp_no),ut.titles
INTO retiring_titles
FROM unique_titles as ut
GROUP BY titles 
ORDER BY COUNT(titles) DESC;

--Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
--Retrieve the from_date and to_date columns from the Department Employee table. Retrieve the title column from the Titles table.
--Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
--Create a new table using the INTO clause.
SELECT DISTINCT ON(e.emp_no)e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.titles
INTO mentor_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1962-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;

--Check mentor_eligibility table
SELECT * FROM mentor_eligibility;
