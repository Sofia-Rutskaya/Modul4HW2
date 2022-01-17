--------------------------ДОМАШКА----------------------------

----------------------ЗАДАНИЕ №1-----------------------------
--Вывести всю информацию из таблицы Sales.Customer 
-------------------------------------------------------------

SELECT *
FROM Sales.Customer

GO

----------------------ЗАДАНИЕ №2-----------------------------
--Вывести всю информацию из таблицы Sales.Store отсортированную 
--по Name в алфавитном порядке
-------------------------------------------------------------

SELECT *
FROM Sales.Store
ORDER BY Name

GO

----------------------ЗАДАНИЕ №3-----------------------------
--Вывести из таблицы HumanResources.Employee всю информацию
--о десяти сотрудниках, которые родились позже 1989-09-28
-------------------------------------------------------------
SELECT TOP(10)*
FROM HumanResources.Employee
WHERE BirthDate > '1989-09-28'
GO

----------------------ЗАДАНИЕ №4-----------------------------
--Вывести из таблицы HumanResources.Employee сотрудников
--у которых последний символ LoginID является 0.
--Вывести только NationalIDNumber, LoginID, JobTitle.
--Данные должны быть отсортированы по JobTitle по убиванию
-------------------------------------------------------------
SELECT employee.NationalIDNumber, employee.LoginID, employee.JobTitle
FROM HumanResources.Employee AS employee
WHERE LoginID LIKE '%0'
ORDER BY employee.JobTitle DESC
GO

----------------------ЗАДАНИЕ №5-----------------------------
--Вывести из таблицы Person.Person всю информацию о записях, которые были 
--обновлены в 2008 году (ModifiedDate) и MiddleName содержит
--значение и Title не содержит значение 
-------------------------------------------------------------

SELECT *
FROM Person.Person 
WHERE ModifiedDate LIKE '%2008%' AND MiddleName IS NOT NULL AND Title IS NULL
GO

----------------------ЗАДАНИЕ №6-----------------------------
--Вывести название отдела (HumanResources.Department.Name) БЕЗ повторений
--в которых есть сотрудники
--Использовать таблицы HumanResources.EmployeeDepartmentHistory и HumanResources.Department
-------------------------------------------------------------
SELECT DISTINCT Department.Name
FROM HumanResources.Department as Department, HumanResources.EmployeeDepartmentHistory as History
WHERE Department.DepartmentID = History.DepartmentID
AND History.EndDate IS NULL

GO

----------------------ЗАДАНИЕ №7-----------------------------
--Сгрупировать данные из таблицы Sales.SalesPerson по TerritoryID
--и вывести сумму CommissionPct, если она больше 0
-------------------------------------------------------------
SELECT SUM(Sales.SalesPerson.CommissionPct) AS 'CommissionPct'
FROM Sales.SalesPerson
GROUP BY Sales.SalesPerson.TerritoryID
HAVING SUM(Sales.SalesPerson.CommissionPct) > 0
GO

----------------------ЗАДАНИЕ №8-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют самое большое кол-во 
--отпуска (HumanResources.Employee.VacationHours)
-------------------------------------------------------------
SELECT TOP(20)*
FROM HumanResources.Employee
ORDER BY HumanResources.Employee.VacationHours DESC

GO

----------------------ЗАДАНИЕ №9-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют позицию (HumanResources.Employee.JobTitle)
--'Sales Representative' или 'Network Administrator' или 'Network Manager'
-------------------------------------------------------------

SELECT *
FROM HumanResources.Employee
WHERE HumanResources.Employee.JobTitle = 'Sales Representative'
OR HumanResources.Employee.JobTitle = 'Network Administrator'
OR HumanResources.Employee.JobTitle = 'Network Manager'

GO

----------------------ЗАДАНИЕ №10-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) и 
--их заказах (Purchasing.PurchaseOrderHeader). ЕСЛИ У СОТРУДНИКА НЕТ
--ЗАКАЗОВ ОН ДОЛЖЕН БЫТЬ ВЫВЕДЕН ТОЖЕ!!!
-------------------------------------------------------------
SELECT *
FROM HumanResources.Employee
LEFT JOIN Purchasing.PurchaseOrderHeader ON Purchasing.PurchaseOrderHeader.EmployeeID = HumanResources.Employee.BusinessEntityID

GO

