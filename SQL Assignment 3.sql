
use fisdb2

select * from dept

select * from emp

--1. Retrieve a list of MANAGERS. 
select * from emp where job='MANAGER'

--2. Find out the names and salaries of all employees earning more than 1000 per month.
select ename,sal from emp where sal>1000

--3. Display the names and salaries of all employees except JAMES. 
select ename,sal from emp where ename !='JAMES'

--4. Find out the details of employees whose names begin with ‘S’. 
select * from emp where ename like 'S%'

--5. Find out the names of all employees that have ‘A’ anywhere in their name. 
select ename from emp where ename like '%A%'

--6. Find out the names of all employees that have ‘L’ as their third character in their name.
select ename from emp where ename like '__L%'

--7. Compute daily salary of JONES. 
Select ename,sal/30 as daily_salary from emp where ename='JONES'

--8. Calculate the total monthly salary of all employees. 
select ename,sal*12 as total_monthly_salary from emp

--9. Print the average annual salary . 
Select avg(sal*12) as avg_salary from emp

--10. Select the name, job, salary, department number of all employees except SALESMAN from department number 30.
Select ename,job,sal,deptno from emp where job not in('SALESMAN') and deptno=30

--11. List unique departments of the EMP table. 
select distinct emp.deptno,dept.dname from emp inner join dept on emp.deptno=dept.deptno 

--12. List the name and salary of employees who earn more than 1500 and are in department 10 or 30. Label the columns Employee and Monthly Salary respectively.
select ename as employees,sal as monthly_salary,deptno from emp where sal>1500 and (deptno=10 or deptno=30)

--13. Display the name, job, and salary of all the employees whose job is MANAGER or ANALYST and their salary is not equal to 1000, 3000, or 5000. 
select ename,job,sal from emp where (job='MANAGER'or job='ANALYST') and (sal not in(1000,3000,5000))


--14. Display the name, salary and commission for all employees whose commission amount is greater than their salary increased by 10%. 
select ename,sal,comm from emp where comm is not null and comm>(sal*0.1)

--15. Display the name of all employees who have two Ls in their name and are in department 30 or their manager is 7782. 
select ename from emp where ename like '%L%L%' and (deptno=30 or mgr_id=7738)

--16. Display the names of employees with experience of over 10 years and under 20 yrs Count the total number of employees. 
--m1
select ename from emp where datediff(year,hiredate,getdate()) between 10 and 20
select count(ename) from emp where datediff(year,hiredate,getdate()) between 10 and 20
--m2
select ename,deptno,datediff(year,hiredate,getdate()) as experience from emp where (datediff(year,hiredate,getdate())>10 ) and (datediff(year,hiredate,getdate())<20)

--17. Retrieve the names of departments in ascending order and their employees in descending order. 
select dept.dname,emp.ename from emp inner join dept on emp.deptno=dept.deptno 
order by dept.dname asc,emp.ename desc

--18. Find out experience of MILLER. 
select datediff(year,hiredate,getdate()) as experience from emp where ename='MILLER'