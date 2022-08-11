--					Assignment 2

-- 1. Retrieve a list of MANAGERS. 
select * from table_Emp where Job = 'Manager'


-- 2. Find out the names and salaries of all employees earning more than 1000 per month. 
select EName as 'Name', Salary as 'Salary' FROM table_Emp where Salary > 1000


-- 3. Display the names and salaries of all employees except JAMES. 
select EName as 'Name', Salary as 'Salary' FROM table_Emp where EName != 'James'

-- 4. Find out the details of employees whose names begin with ‘S’. 
select * from table_Emp where EName like 'S%'


-- 5. Find out the names of all employees that have ‘A’ anywhere in their name. 
select * from table_Emp where EName like '%A%'

-- 6. Find out the names of all employees that have ‘L’ as their third character in their name. 
select * from table_Emp where EName like '__L%'


-- 7. Compute daily salary of JONES. 
select EName, (Salary/30) as 'Daily Salary' from table_Emp where EName = 'Jones'


-- 8. Calculate the total monthly salary of all employees. 
select sum(Salary) as 'Total Salary' from table_Emp


-- 9. Print the average annual salary . 
select avg(Salary*12) as 'Average Salary' from table_Emp


-- 10. Select the name, job, salary, department number of all employees except SALESMAN from department number 30. 
select e.EmpNo, e.EName, e.Job, e.Salary, e.DeptNo from table_Emp e except (select empNo, EName, Job, Salary, DeptNo from table_Emp where DeptNo = 30 and Job = 'Salesman') 
  

-- 11. List unique departments of the EMP table. 
select distinct(e.DeptNo), d.DName from table_Emp e join table_Dept d on e.DeptNo = d.DeptNo


-- 12. List the name and salary of employees who earn more than 1500 and are in department 10 or 30. Label the columns Employee and Monthly Salary respectively.
select EName as 'Employee', Salary as 'Monthly Salary', DeptNo from table_Emp where Salary > 1500 and DeptNo in (10,30)


-- 13. Display the name, job, and salary of all the employees whose job is MANAGER or ANALYST and their salary is not equal to 1000, 3000, or 5000. 
select EName, Job, Salary from table_Emp where Job in ('Manager', 'Analyst') and Salary not in (1000,3000,5000)


-- 14. Display the name, salary and commission for all employees whose commission amount is greater than their salary increased by 10%. 
select EName, Salary, Comm from table_Emp where Comm > (Salary + (Salary * 10/100))
   

-- 15. Display the name of all employees who have two Ls in their name and are in department 30 or their manager is 7782. 
select * from table_Emp where EName like '%L%l%' and DeptNo=30 or MgrId=7782


-- 16. Display the names of employees with experience of over 10 years and under 20 yrs. Count the total number of employees. 
select EName, DateDiff(Year,DateName(YEAR,HireDate),DateName(YEAR,GETDATE())) as Experience from table_Emp 
where DateDiff(Year,DateName(YEAR,HireDate),DateName(YEAR,GETDATE()))  >10 and DateDiff(Year,DateName(YEAR,HireDate),DateName(YEAR,GETDATE())) < 20

	 
-- 17. Retrieve the names of departments in ascending order and their employees in  descending order. 
select d.DeptNo, d.DName, e.EName from table_Dept d, table_Emp e where d.DeptNo = e.DeptNo order by d.DName, e.EName desc


-- 18. Find out experience of MILLER.
select EName, DateDiff(Year,DateName(YEAR,HireDate),DateName(YEAR,GETDATE())) as Experience from table_Emp where EName='Miller'
