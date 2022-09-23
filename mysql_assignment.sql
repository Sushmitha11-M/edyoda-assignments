CREATE DATABASE assignment;
USE assignment;

CREATE TABLE Salespeople(Snum INT NOT NULL,Sname VARCHAR(50), City VARCHAR(50), Comm INT, PRIMARY KEY(Snum),UNIQUE (Sname));
INSERT INTO Salespeople(Snum,Sname,City,Comm) VALUES(1001,'Peel','London',12);
INSERT INTO Salespeople(Snum,Sname,City,Comm) VALUES(1002,'Serres','Sanjose',13);
INSERT INTO Salespeople(Snum,Sname,City,Comm) VALUES(1004,'Motika','London',11);
INSERT INTO Salespeople(Snum,Sname,City,Comm) VALUES(1007,'Rifkin','Barcelona',15);
INSERT INTO Salespeople(Snum,Sname,City,Comm) VALUES(1003,'Axelrod','Newyork',10);


SELECT * FROM Salespeople;

CREATE TABLE Customers(Cnum INT NOT NULL,Cname VARCHAR(50),City VARCHAR(50) NOT NULL,Snum INT,PRIMARY KEY(Cnum),FOREIGN KEY(Snum) REFERENCES Salespeople(Snum));
INSERT INTO Customers(Cnum,Cname,City,Snum) VALUES(2001,'Hoffman','London',1001);
INSERT INTO Customers(Cnum,Cname,City,Snum) VALUES(2002,'Giovanni','Rome',1003);
INSERT INTO Customers(Cnum,Cname,City,Snum) VALUES(2003,'Liu','Sanjose',1002);
INSERT INTO Customers(Cnum,Cname,City,Snum) VALUES(2004,'Grass','Berlin',1002);
INSERT INTO Customers(Cnum,Cname,City,Snum) VALUES(2006,'Clemens','London',1001);
INSERT INTO Customers(Cnum,Cname,City,Snum) VALUES(2008,'Cisneros','Cisneros',1007);
INSERT INTO Customers(Cnum,Cname,City,Snum) VALUES(2007,'Pereira','Rome',1004);

SELECT * FROM Customers;

CREATE TABLE Orders(Onum INT NOT NULL,Amt FLOAT,Odate DATE,Cnum INT,Snum INT, PRIMARY KEY(Onum),FOREIGN KEY(Cnum) REFERENCES Customers(Cnum),FOREIGN KEY(Snum) REFERENCES Salespeople(Snum));
INSERT INTO Orders(Onum,Amt,Odate,Cnum,Snum) VALUES(3001,18.69,'1990-10-03',2008,1007);
INSERT INTO Orders(Onum,Amt,Odate,Cnum,Snum) VALUES(3003,767.19,'1990-10-03',2001,1001);
INSERT INTO Orders(Onum,Amt,Odate,Cnum,Snum) VALUES(3002,1900.10,'1990-10-03',2007,1004);
INSERT INTO Orders(Onum,Amt,Odate,Cnum,Snum) VALUES(3005, 5160.45,'1990-10-03',2003,1002);
INSERT INTO Orders(Onum,Amt,Odate,Cnum,Snum) VALUES(3006 ,1098.16,'1990-10-03',2008,1007);
INSERT INTO Orders(Onum,Amt,Odate,Cnum,Snum) VALUES(3009,1713.23,'1990-10-04',2002,1003);
INSERT INTO Orders(Onum,Amt,Odate,Cnum,Snum) VALUES(3007, 75.75,'1990-10-04',2004,1002);
INSERT INTO Orders(Onum,Amt,Odate,Cnum,Snum) VALUES(3008, 4273.00,'1990-10-05',2006,1001);
INSERT INTO Orders(Onum,Amt,Odate,Cnum,Snum) VALUES(3010 ,1309.95,'1990-10-06',2004,1002);
INSERT INTO Orders(Onum,Amt,Odate,Cnum,Snum) VALUES(3011,9891.88,'1990-10-06',2006,1001);

SELECT * FROM Orders;

/*1. Count the number of Salesperson whose name begin with ‘a’/’A’*/
SELECT COUNT(Sname) FROM Salespeople WHERE Sname LIKE 'A%' OR 'a%';

/* 2. Display all the Salesperson whose all orders worth is more than Rs. 2000.*/
SELECT Snum FROM Orders WHERE Amt>2000;
SELECT Orders.Snum,Orders.Amt, Salespeople.Sname FROM Orders INNER JOIN Salespeople ON Orders.Snum=Salespeople.Snum WHERE Orders.Amt>2000;

/*3. Count the number of Salesperson belonging to Newyork */
SELECT COUNT(Sname) FROM Salespeople WHERE City='Newyork';

/* 4. Display the number of Salespeople belonging to London and belonging to Paris. */
SELECT Sname,City FROM Salespeople WHERE City='London' OR City='Paris';

/* 5. Display the number of orders taken by each Salesperson and their date of orders. */
CREATE VIEW AV_TOT_SAL AS
SELECT Odate,Sname,
       COUNT(*) "No. of Orders"
FROM Orders,Salespeople
WHERE Salespeople.Snum=Orders.Snum
GROUP BY Sname,Odate;

SELECT * FROM AV_TOT_SAL;