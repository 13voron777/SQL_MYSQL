USE ShopDB;

SELECT od.OrderId, SUM(TotalPrice) AS TotalSumPrice, c.FName, c.Mname, c.LName 
FROM OrderDetails od
JOIN Orders o1 ON o1.OrderId = od.OrderID
JOIN Customers c ON c.CustomerNo = o1.CustomerNo
GROUP BY od.OrderID HAVING TotalSumPrice > 1000;

SELECT od.OrderId, SUM(TotalPrice) AS TotalSumPrice, e.FName, e.Mname, e.LName 
FROM OrderDetails od
JOIN Orders o1 ON o1.OrderId = od.OrderID
JOIN Employees e ON e.EmployeeId = o1.EmployeeId
GROUP BY od.OrderID HAVING TotalSumPrice > 1000;