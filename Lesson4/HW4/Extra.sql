USE ShopDB;

SELECT od.OrderId, SUM(TotalPrice) AS TotalSumPrice, concat(c.FName, ' ',  c.Mname, ' ', c.LName) AS FML 
FROM Customers c
JOIN Orders o1 ON o1.CustomerNo = c.CustomerNo
JOIN OrderDetails od ON od.OrderId = o1.OrderId
GROUP BY FML HAVING TotalSumPrice > 1000;

SELECT od.OrderId, SUM(TotalPrice) AS TotalSumPrice, concat(e.FName, ' ', e.Mname, ' ', e.LName) AS FML
FROM Employees e
JOIN Orders o1 ON o1.EmployeeID = e.EmployeeID
JOIN OrderDetails od ON od.OrderId = o1.OrderId
GROUP BY FML HAVING TotalSumPrice > 1000;