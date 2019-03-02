create table Suppliers(
SupplierID INT NOT NULL,
CompanyName VARCHAR(30),
ContactLastName VARCHAR(15),
ContactFirstName VARCHAR(15),
Phone CHAR(13),
PRIMARY KEY(SupplierID));

create table Subjects(
SubjectID INT NOT NULL,
CategoryName VARCHAR(30),
PRIMARY KEY(SubjectID));

create table Employees(
EmployeeID INT NOT NULL,
LastName VARCHAR(15),
FirstName VARCHAR(15),
PRIMARY KEY(EmployeeID));

create table Shippers(
ShipperID INT NOT NULL,
ShipperName VARCHAR(15),
PRIMARY KEY(ShipperID));

create table Customers(
CustomerID INT NOT NULL,
LastName VARCHAR(15),
FirstName VARCHAR(15),
Phone CHAR(13),
PRIMARY KEY(CustomerID));

create table Orders(
OrderID INT NOT NULL,
CustomerID INT,
EmployeeID INT,
OrderDate CHAR(8),
ShippedDate Char(8),
ShipperID INT,
PRIMARY KEY(OrderID),
FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),
FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID),
FOREIGN KEY(ShipperID) REFERENCES Shippers(ShipperID));

create table OrderDetails(
BookID INT NOT NULL,
OrderID INT NOT NULL,
Quantity INT,
PRIMARY KEY(BookID, OrderID));

create table Books(
BookID INT NOT NULL,
Title VARCHAR(30),
Unit_Price REAL,
Author VARCHAR(15),
Unit_in_Stock INT,
SupplierID INT,
SubjectID INT,
PRIMARY KEY(BookID),
FOREIGN KEY(SupplierID) REFERENCES Suppliers(SupplierID),
FOREIGN KEY(SubjectID) REFERENCES Subjects(SubjectID));

show tables;

INSERT INTO Suppliers
VALUES ('1', 'Amazon', 'Hamilton', 'Laurell', '605-145-1875');
INSERT INTO Suppliers
VALUES ('2', 'Ebay', 'Koontz', 'Dean', '605-244-1104');
INSERT INTO Suppliers
VALUES ('3', 'Booksamillion', 'Roberts', 'Nora', '916-787-3320');
INSERT INTO Suppliers
VALUES ('4', 'University', 'Carter', 'Stephen', '916-412-2004');

INSERT INTO Subjects
VALUES ('1', 'Fiction');
INSERT INTO Subjects
VALUES ('2', 'History');
INSERT INTO Subjects
VALUES ('3', 'Travel');
INSERT INTO Subjects
VALUES ('4', 'Technology');

INSERT INTO Books
VALUES ('1', 'The Quickie', '15.94', 'James', '5', '3', '1');
INSERT INTO Books
VALUES ('2', 'Blaze', '13.24', 'Richard', '2', '3', '1');
INSERT INTO Books
VALUES ('3', 'The Navigator', '14.01', 'Clive', '10', '2', '1');
INSERT INTO Books
VALUES ('4', 'Birmingham', '19.99', 'Tim', '12', '3', '2');
INSERT INTO Books
VALUES ('5', 'North Carolina Ghosts', '7.95', 'Lynne', '5', '2', '2');
INSERT INTO Books
VALUES ('6', 'Why I still live in Louisiana', '5.95', 'Ellen', '30', '1', '3');
INSERT INTO Books
VALUES ('7', 'The World Is Flat', '30', 'Thomas', '17', '3', '4');

INSERT INTO Employees
VALUES ('1', 'Larson', 'Erik');
INSERT INTO Employees
VALUES ('2', 'Steely', 'John');

INSERT INTO Shippers
VALUES ('1', 'UPS');
INSERT INTO Shippers
VALUES ('2', 'USPS');
INSERT INTO Shippers
VALUES ('3', 'FedEx');

INSERT INTO Customers
VALUES ('1', 'Lee', 'James', '916-541-4568');
INSERT INTO Customers
VALUES ('2', 'Smith', 'John', '916-057-0087');
INSERT INTO Customers
VALUES ('3', 'See', 'Lisa', '605-054-0010');
INSERT INTO Customers
VALUES ('4', 'Collins', 'Jackie', '605-044-6582');

INSERT INTO Orders
VALUES ('1', '1', '1', '08/01/17', '08/03/17', '1');
INSERT INTO Orders
VALUES ('2', '1', '2', '08/04/17', NULL, NULL);
INSERT INTO Orders
VALUES ('3', '2', '1', '08/01/17', '08/03/17', '2');
INSERT INTO Orders
VALUES ('4', '4', '2', '08/04/17', '08/05/17', '1');

INSERT INTO OrderDetails
VALUES ('1', '1', '2');
INSERT INTO OrderDetails
VALUES ('4', '1', '1');
INSERT INTO OrderDetails
VALUES ('6', '2', '2');
INSERT INTO OrderDetails
VALUES ('7', '2', '3');
INSERT INTO OrderDetails
VALUES ('5', '3', '1');
INSERT INTO OrderDetails
VALUES ('3', '4', '1');
INSERT INTO OrderDetails
VALUES ('4', '4', '1');
INSERT INTO OrderDetails
VALUES ('7', '4', '1');

