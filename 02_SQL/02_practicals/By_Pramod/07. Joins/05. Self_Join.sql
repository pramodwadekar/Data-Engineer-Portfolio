
-- 1. Basic Self Join – Employee with Manager’s Name
SELECT 
    EMP.Id   AS EMPID, 
    EMP.EName AS EMPNAME, 
    MGR.Id   AS MANAGERID, 
    MGR.EName AS MANAGERNAME
FROM Employee EMP
INNER JOIN Employee MGR 
    ON EMP.Manager = MGR.Id;
-- 👉 This returns employees who have a manager assigned, along with their manager’s name.



-- 2. Self Join – Only ETA Employees
SELECT 
    EMP.Id   AS EMPID, 
    EMP.EName AS EMPNAME, 
    MGR.Id   AS MANAGERID, 
    MGR.EName AS MANAGERNAME
FROM Employee EMP
INNER JOIN Employee MGR 
    ON EMP.Manager = MGR.Id
WHERE EMP.Dept = 'ETA';
-- 👉 Filters only employees from the ETA department.



-- 3. Employees Who Joined Before Their Managers
SELECT 
    EMP.Id   AS "EmpId", 
    EMP.DOJ  AS "EmpDOJ", 
    MGR.Id   AS "ManagerId", 
    MGR.DOJ  AS "ManagerDOJ"
FROM Employee EMP
INNER JOIN Employee MGR 
    ON EMP.Manager = MGR.Id
WHERE EMP.DOJ < MGR.DOJ;
-- 👉 This identifies employees whose Date of Joining (DOJ) is earlier than their manager’s DOJ.
