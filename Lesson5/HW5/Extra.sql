USE ShopDB;

SELECT od.OrderId, SUM(TotalPrice) AS TotalSumPrice, c.FName, c.Mname, c.LName 
FROM OrderDetails od
JOIN Orders o1 ON o1.OrderId = od.OrderID
JOIN Customers c ON c.CustomerNo = o1.CustomerNo
GROUP BY od.OrderID HAVING TotalSumPrice > 1000;

SELECT o1.OrderId, 
	(
    SELECT SUM(od.TotalPrice) AS TotalSumPrice FROM OrderDetails AS od WHERE od.OrderId = o1.OrderId
    GROUP BY od.OrderID HAVING TotalSumPrice > 1000
	) AS SubSum,
	(
    SELECT CONCAT(c.FName, ' ', c.Mname, ' ', c.LName) FROM Customers AS c WHERE c.CustomerNo = o1.CustomerNo
    ) AS FML
FROM Orders AS o1;

SELECT o1.OrderId, 
	#(
    #SELECT SUM(od.TotalPrice) AS TotalSumPrice FROM OrderDetails AS od WHERE od.OrderId = o1.OrderId
    #GROUP BY od.OrderID HAVING TotalSumPrice > 1000
	#) AS SubSum,
	(
    SELECT CONCAT(e.FName, ' ', e.Mname, ' ', e.LName) FROM Employees AS e WHERE e.EmployeeId = o1.EmployeeId
    ) AS FML
FROM Orders AS o1;