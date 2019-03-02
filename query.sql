#1
SELECT B.Title
FROM books B
WHERE B.Unit_in_Stock > 5;

#2
SELECT SUM(B.Unit_Price) AS 'John Smith Total Price'
FROM books B, orders O, orderdetails D
WHERE O.CustomerID = 2 AND D.OrderID = 3 AND B.BookID = D.BookID;

#3
SELECT DISTINCT C.FirstName, C.LastName
FROM customers C, books B, orders O
WHERE C.FirstName IN (SELECT C.FirstName
					  FROM books B, customers C, orderdetails D, orders O
					  WHERE C.CustomerID = O.CustomerID AND D.OrderID = O.OrderID AND O.OrderID = '3');
     
#4
SELECT DISTINCT B.Title, S.ShipperName
FROM books B, Shippers S, orders O, orderdetails D
WHERE O.ShippedDate = '08/05/17' AND D.BookID = B.BookID AND  O.ShipperID = S.ShipperID AND O.OrderID = D.orderID;

#5
SELECT DISTINCT B.Title 
FROM books B
WHERE B.Title IN (SELECT DISTINCT B.Title
				  FROM books B, employees E, orders O, orderdetails D
				  WHERE O.EmployeeID = '2' AND O.OrderID = D.OrderID AND B.BookID = D.BookID);

#6
SELECT ROUND(SUM(D.Quantity * B.Unit_Price), 2) AS 'Total Price', C.FirstName, C.LastName
FROM customers C, orders O, orderdetails D, books B
WHERE O.OrderID = D.OrderID AND D.BookID = B.BookID AND O.CustomerID = C.CustomerID
GROUP BY C.FirstName
ORDER BY SUM(D.Quantity * B.Unit_Price) DESC;

#7
SELECT DISTINCT B.Title
FROM books B, customers C, orders O, orderdetails D
WHERE C.CustomerID = O.CustomerID AND D.OrderID = O.OrderID AND (O.OrderID = '3' OR O.OrderID = '4') AND B.BookID = D.BookID;

#8
SELECT B.Title, SUM(D.Quantity) AS 'Quantity Ordered'
FROM books B 
INNER JOIN orderdetails as D
ON B.BookID = D.BookID
GROUP BY B.Title
ORDER BY SUM(D.Quantity);

#9
SELECT DISTINCT C.FirstName, C.LastName
FROM customers C, books B, orders O, orderdetails D
WHERE C.CustomerID = O.CustomerID AND B.BookID = D.BookID AND O.OrderID = D.OrderID AND B.Title LIKE '%Louisiana%';

#10
SELECT DISTINCT C.FirstName, C.LastName
FROM customers C, books B, orders O, orderdetails D
WHERE C.CustomerID = O.CustomerID AND B.BookID = '7' AND (O.OrderID = '2' OR O.OrderID = '4');

#11
SELECT DISTINCT C.FirstName, C.LastName, B.Title
FROM customers C, books B, orders O, orderdetails D, subjects S
WHERE (S.CategoryName = 'Fiction' OR S.CategoryName = 'Travel') AND C.CustomerID = O.CustomerID AND O.OrderID = D.OrderID AND (B.BookID = '1' OR B.BookID = '2' OR B.BookID = '3' OR B.BookID = '6') AND B.BookID = D.BookID;

#12
SELECT DISTINCT S.CategoryName, ROUND(MIN(B.Unit_Price), 2) AS Cheapest
FROM subjects S, books B
WHERE S.SubjectID = B.SubjectID 
GROUP BY S.CategoryName;

#13
SELECT B.Title, SUM(D.Quantity) AS 'Quantity For Open Orders'
FROM orders O, books B, orderdetails D
WHERE (O.OrderID = '4' OR O.OrderID = '2') AND O.OrderID = D.OrderID AND B.BookID = D.BookID AND NOT (O.ShippedDate = '08/04/17' OR O.ShippedDate = '08/03/17')
GROUP BY B.BookID;

#14
SELECT DISTINCT C.FirstName, C.LastName, SUM(D.Quantity) AS Quantity
FROM customers C, books B, orders O, orderdetails D
WHERE C.CustomerID = O.CustomerID AND O.OrderID = D.OrderID AND B.BookID = D.BookID AND NOT O.OrderID = '3' 
GROUP BY C.FirstName
ORDER BY SUM(D.Quantity) DESC;

#15
SELECT DISTINCT C.FirstName, C.LastName, C.Phone
FROM customers C, books B, orders O, orderdetails D
WHERE C.CustomerID = O.CustomerID AND O.OrderID = D.OrderID AND B.BookID = D.BookID
GROUP BY D.Quantity
ORDER BY SUM(D.Quantity) > '1';






