USE AdventureWorksLT;

SELECT TOP(10) CONCAT_WS(' ', FirstName, MiddleName, LastName) AS FullName  FROM SalesLT.Customer  ORDER BY CustomerID;