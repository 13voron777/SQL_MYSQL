USE ShopDB;

SELECT SUM(od.TotalPrice) AS TotalSumPrice, 
	(
    SELECT concat(c.FName, ' ',  c.Mname, ' ', c.LName) FROM Customers c
    WHERE c.CustomerNo = 
		(
        SELECT o1.CustomerNo FROM Orders o1 WHERE od.OrderId = o1.OrderId
        )
    ) AS FML 
FROM OrderDetails od
GROUP BY FML HAVING TotalSumPrice > 1000
UNION
SELECT SUM(od.TotalPrice) AS TotalSumPrice, 
	(
    SELECT concat(e.FName, ' ',  e.Mname, ' ', e.LName) FROM Employees e
    WHERE e.EmployeeID = 
		(
        SELECT o1.EmployeeID FROM Orders o1 WHERE od.OrderId = o1.OrderId
        )
    ) AS FML 
FROM OrderDetails od
GROUP BY FML HAVING TotalSumPrice > 1000;