DESC employees;

SELECT lastName FROM employees;

SELECT 
    lastName, 
    firstName, 
    jobTitle
FROM
    employees;
    
    
SELECT employeeNumber,
       lastName,
       firstName,
       extension,
       email,
       officeCode,
       reportsTo,
       jobTitle
FROM   employees; 

SELECT 1 + 1;    


SELECT 1 * 1 as "售_價" FROM DUAL;


SELECT CONCAT('John',' ','Doe') AS NAME FROM DUAL;

SELECT
	contactLastname,
	contactFirstname
FROM
	customers
ORDER BY
	contactLastname desc;
	
	
SELECT
	contactLastname,
	contactFirstname
FROM
	customers
ORDER BY
	contactLastname desc;	




SELECT 
    contactLastname, 
    contactFirstname
FROM
    customers
ORDER BY 
	contactLastname DESC , 
	contactFirstname ASC;
	
	
	
SELECT 
    orderNumber, 
    orderlinenumber, 
    quantityOrdered * priceEach
FROM
    orderdetails
ORDER BY 
   quantityOrdered * priceEach DESC;	
   
   
   
SELECT 
    orderNumber,
    orderLineNumber,
    quantityOrdered * priceEach AS 總計
FROM
    orderdetails
ORDER BY 總計 DESC;   




SELECT FIELD('C', 'A', 'B','C') FROM DUAL;



SELECT 
    orderNumber, status
FROM
    orders
ORDER BY FIELD(status,
        'In Process',
        'Cancelled',
        'Resolved',
        'Disputed',
        
        
        
        
SELECT 
    orderNumber, status
FROM
    orders
ORDER BY FIELD(status,
        'In Process',
        'On Hold',
        'Cancelled',
        'Resolved',
        'Disputed',
        'Shipped');      
		  
		  
		  
		  
SELECT 
    firstName, lastName, reportsTo
FROM
    employees
ORDER BY reportsTo;		    



SELECT 
    firstName, lastName, reportsTo
FROM
    employees
ORDER BY reportsTo DESC;


DESC employees;


SELECT 
    employeeNumber, firstName, lastName, reportsTo
FROM
    employees;
    
    
    
SELECT 
	 employeeNumber,
    lastname, 
    firstname, 
    jobtitle
FROM
    employees
WHERE
    jobtitle = 'Sales Rep';  
    
    
    
    
SELECT 
    lastname, 
    firstname, 
    jobtitle,
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' OR 
    officeCode = 1
	 ORDER BY 
    officeCode , 
    jobTitle;
    
    
    
SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode BETWEEN 1 AND 3
ORDER BY officeCode;    




SELECT 
    firstName, 
    lastName
FROM
    employees
WHERE
    lastName LIKE '%son'
ORDER BY firstName;



SELECT 
    lastName, 
    firstName, 
    reportsTo
FROM
    employees
WHERE
    reportsTo IS NULL;
    
    
SELECT 
    lastname, 
    firstname, 
    jobtitle
FROM
    employees
WHERE
    jobtitle <> 'Sales Rep';    
    
    
    
SELECT 
    DISTINCT lastname
FROM
    employees
ORDER BY 
    lastname;


SELECT DISTINCT state
FROM customers;    


SELECT DISTINCT
    state, city
FROM
    customers
WHERE
    state IS NOT NULL
ORDER BY 
    state, 
    city;
    
    
    
SELECT 
    customername, 
    country, 
    state
FROM
    customers
WHERE
    country = 'USA' AND 
    state = 'CA';    
    
    
SELECT 
    customername, 
    country, 
    state, 
    creditlimit
FROM
    customers
WHERE
    country = 'USA' AND 
    state = 'CA' AND 
    creditlimit > 100000;    
    
    
    
    
SELECT    
	customername, 
	country
FROM    
	customers
WHERE country IN ('USA', 'France');    



SELECT   
	customername, 
	country, 
	creditLimit
FROM   
	customers
WHERE(country = 'USA'
		OR country = 'France')
	  AND creditlimit > 100000;
	  
	  


SELECT    
    customername, 
    country, 
    creditLimit
FROM    
    customers
WHERE 
    country = 'USA'
    OR country = 'France'
    AND creditlimit > 100000;	  
	  
	  
	  
	  
SELECT 
    officeCode, 
    city, 
    phone
FROM
    offices
WHERE
    country NOT IN ('USA' , 'France')
ORDER BY 
    city;	  
    
    
SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice BETWEEN 90 AND 100;    
    
    
    
    
    
SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice NOT BETWEEN 20 AND 100;    
    
    
SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice < 20 OR buyPrice > 100;    
    
    
    
SELECT 
   orderNumber,
   requiredDate,
   status
FROM 
   orders
WHERE 
   requireddate BETWEEN 
     CAST('2003-01-01' AS DATE) AND 
     CAST('2003-01-31' AS DATE);    
    
    
SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice >= 90 AND buyPrice <= 100;    
    
    
    
    
    



SELECT 
   orderNumber,
   requiredDate,
   status
FROM 
   orders
WHERE 
   requireddate BETWEEN 
     CAST('2003-01-01' AS DATE) AND 
     CAST('2003-01-31' AS DATE);    
     
     
     
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    firstName LIKE 'f%';   
	 
	 
	 
	 
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    lastName LIKE '%on';	  
	 
	 
	 
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    lastname LIKE '%on%';
    
    
    
    
SELECT 
    productCode, 
    productName
FROM
    products
WHERE
    productCode LIKE '%\_20%';    
    
    
SELECT 
    productCode, 
    productName
FROM
    products
WHERE
    productCode LIKE '%$_20%' ESCAPE '$';    
    
    
    
    
    
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    firstname LIKE 'T_m';    
    
    
    
    
    
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    lastName NOT LIKE 'B%';    
    
    
    
    
SELECT 
    productCode, 
    productName
FROM
    products
WHERE
    productCode LIKE '%$_20%' ESCAPE '$';  
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
SELECT 
    orderNumber, status
FROM
    orders
ORDER BY STATUS;


SELECT 
    orderNumber, status
FROM
    orders
ORDER BY FIELD(status,
        'In Process',
        'On Hold',
        'Cancelled',
        'Resolved',
        'Disputed',
        'Shipped');
        
        


SELECT 
    lastname
FROM
    employees
ORDER BY 
    lastname;
    
    
SELECT 
    DISTINCT lastname
FROM
    employees
ORDER BY 
    lastname;    
    



SELECT DISTINCT state
FROM customers;




SELECT DISTINCT
    state, city
FROM
    customers
ORDER BY 
    state, 
    city;
    
    
    
    
SELECT 
    state, city
FROM
    customers
ORDER BY 
    state , 
    city;    
    
    
    
SELECT 
    officeCode, 
    city, 
    phone, 
    country
FROM
    offices
WHERE
    country IN ( 子查詢-1 ...classicmodels  IN (  子查詢-2 ... )   );    
    
    
    
    
SELECT 
    customerNumber, 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY creditLimit DESC
LIMIT 10;    






CREATE TABLE members (
    member_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (member_id)
);

CREATE TABLE committees (
    committee_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (committee_id)
);




INSERT INTO members(name)
VALUES('John'),('Jane'),('Mary'),('David'),('Amelia');

INSERT INTO committees(name)
VALUES('John'),('Mary'),('Amelia'),('Joe');




SELECT * FROM members;


SELECT * FROM committees;




SELECT 
    members.member_id, 
    members.name AS '會員', 
    committees.committee_id, 
    committees.name AS '委員'
FROM
    members
INNER JOIN committees ON members.name = committees.name;































CREATE TABLE members (
    member_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (member_id)
);

CREATE TABLE committees (
    committee_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (committee_id)
);


































CREATE TABLE members (
    member_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (member_id)
);

CREATE TABLE committees (
    committee_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (committee_id)
);





INSERT INTO members(name)
VALUES('John'),('Jane'),('Mary'),('David'),('Amelia');

INSERT INTO committees(name)
VALUES('John'),('Mary'),('Amelia'),('Joe');




SELECT * FROM members;

SELECT * FROM committees;

SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
INNER JOIN committees c ON c.name = m.name



SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
RIGHT JOIN committees c USING(name)
WHERE m.member_id IS NULL;



SELECT 
    m.member_id, 
    m.name AS member, 
FROM
    members m
UNION SELECT
    c.committee_id, 
    c.name AS committee
FROM 
    committees c;






























SELECT 
    t1.productCode, 
    t1.productName, 
    t2.textDescription
FROM
    products t1
JOIN productlines t2 
    ON t1.productline = t2.productline;
    
    
    
SELECT 
    t1.orderNumber,
    t1.status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders t1
INNER JOIN orderdetails t2 
    ON t1.orderNumber = t2.orderNumber
GROUP BY orderNumber;    





SELECT 
    orderNumber,
    orderDate,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
JOIN
    orderdetails USING (orderNumber)
JOIN
    products USING (productCode)
ORDER BY 
    orderNumber, 
    orderLineNumber;





SELECT 
    orderNumber,
    orderDate,
    customerName,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
INNER JOIN products 
    USING (productCode)
INNER JOIN customers 
    USING (customerNumber)
ORDER BY 
    orderNumber, 
    orderLineNumber;



SELECT 
    orderNumber, 
    productName, 
    msrp, 
    priceEach,
    o.quantityOrdered
FROM
    products p
INNER JOIN orderdetails o 
   ON p.productcode = o.productcode
      AND p.msrp > o.priceEach
WHERE
    p.productcode = 'S10_1678';





SELECT 
    customers.customerNumber, 
    customerName, 
    orderNumber, 
    status
FROM
    customers
LEFT JOIN orders ON 
    orders.customerNumber = customers.customerNumber;







SELECT 
    c.customerNumber, 
    c.customerName, 
    o.orderNumber, 
    o.status
FROM
    customers c
LEFT JOIN orders o 
    ON c.customerNumber = o.customerNumber
WHERE
    orderNumber IS NULL;
    
    
    
    
    











SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
INNER JOIN committees c;


SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
CROSS JOIN committees c;




SELECT 
    lastName, 
    firstName, 
    customerName, 
    checkNumber, 
    amount
FROM
    employees
JOIN customers ON 
    employeeNumber = salesRepEmployeeNumber
JOIN payments ON 
    payments.customerNumber = customers.customerNumber
ORDER BY 
    customerName, 
    checkNumber;





DESC customers


SELECT customerNumber, customerName FROM customers WHERE salesRepEmployeeNumber IS NULL;


SELECT 
    o.orderNumber, 
    customerNumber, 
    productCode
FROM
    orders o
LEFT JOIN orderDetails 
    USING (orderNumber)
WHERE
    orderNumber = 10123;



SELECT 
    o.orderNumber, 
    customerNumber, 
    productCode
FROM
    orders o
LEFT JOIN orderDetails d 
    ON o.orderNumber = d.orderNumber AND 
       o.orderNumber = 10123;





SELECT 
    employeeNumber, 
    customerNumber
FROM
    customers
RIGHT JOIN employees 
    ON salesRepEmployeeNumber = employeeNumber
ORDER BY 
	customerNumber, employeeNumber;
	
	
	
SELECT m.employeeNumber, m.lastName, e.employeeNumber, e.lastName  
FROM 
	employees e 
LEFT JOIN employees m 
	ON e.reportsTo = m.employeeNumber 
ORDER BY 
	m.employeeNumber;
	
	
	
	
	
	
	
SELECT 
    CONCAT(m.lastName, ', ', m.firstName) AS Manager,
    CONCAT(e.lastName, ', ', e.firstName) AS 'Direct report'
FROM
    employees e
INNER JOIN employees m ON 
    m.employeeNumber = e.reportsTo
ORDER BY 
    Manager;	




SELECT 
    IFNULL(CONCAT(m.lastname, ', ', m.firstname),
            'Top Manager') AS 'Manager',
    CONCAT(e.lastname, ', ', e.firstname) AS 'Direct report'
FROM
    employees e
LEFT JOIN employees m ON 
    m.employeeNumber = e.reportsto
ORDER BY 
    manager DESC;
    
    
    
    
SELECT 
    c1.city, 
    c1.customerName, 
    c2.customerName
FROM
    customers c1
INNER JOIN customers c2 ON 
    c1.city = c2.city
    AND c1.customername > c2.customerName
ORDER BY 
    c1.city;    

 	
	
	
	
SELECT 
    employeeNumber, 
    customerNumber
FROM
    customers
RIGHT JOIN employees ON 
	salesRepEmployeeNumber = employeeNumber
WHERE customerNumber is NULL
ORDER BY employeeNumber;	






SELECT 
    c1.city, 
    c1.customerName, 
    c2.customerName
FROM
    customers c1
INNER JOIN customers c2 ON 
    c1.city = c2.city
    AND c1.customerName > c2.customerName
ORDER BY 
    c1.city;
    
    
DESC customers ;    




































SELECT 
    c1.city, 
    c1.customerName, 
    c2.customerName
FROM
    customers c1
INNER JOIN customers c2 ON 
    c1.city = c2.city
    AND c1.customername > c2.customerName
ORDER BY 
    c1.city;
    
    
    
    
    
    
    
    
    
SELECT 
  status 
FROM 
  orders;
  
  
SELECT DISTINCT
  status 
FROM 
  orders;
  
  
  
  
SELECT 
  STATUS,
  COUNT(*) 
FROM 
  orders 
GROUP BY 
  status;  
  
  
SELECT 
  STATUS,
  COUNT(STATUS) 
FROM 
  orders 
GROUP BY 
  status;    
  
  
  
  
  
  
  
  
  
  
SELECT 
  status, 
  SUM(quantityOrdered * priceEach) AS amount 
FROM 
  orders 
  INNER JOIN orderdetails USING (orderNumber) 
GROUP BY 
  status;







SELECT 
  status, 
  SUM(quantityOrdered * priceEach) AS amount 
FROM 
  orders 
  JOIN orderdetails USING (orderNumber) 
GROUP BY 
  orderNumber;
  
  
  
SELECT year(orderdate) FROM orders;  








SELECT 
  orderNumber,
  status, 
  SUM(quantityOrdered * priceEach) AS amount 
FROM 
  orders 
  INNER JOIN orderdetails USING (orderNumber) 
GROUP BY 
  orderNumber;
  
  
  
SELECT 
  YEAR(orderDate), 
  SUM(quantityOrdered * priceEach) AS total 
FROM 
  orders 
  INNER JOIN orderdetails USING (orderNumber) 
WHERE 
  status = 'Shipped' 
GROUP BY 
  YEAR(orderDate)
HAVING 
  YEAR(orderDate) > 2003;  
  




SELECT 
  YEAR(orderDate) AS year, 
  SUM(quantityOrdered * priceEach) AS total 
FROM 
  orders 
  INNER JOIN orderdetails USING (orderNumber) 
WHERE 
  status = 'Shipped' 
GROUP BY 
  YEAR(orderDate)
HAVING
  year > 2003;
  
  
  
SELECT 
  ordernumber, 
  SUM(quantityOrdered) AS itemsCount, 
  SUM(priceeach * quantityOrdered) AS total 
FROM 
  orderdetails 
GROUP BY 
  ordernumber;  
  
  
SELECT 
  ordernumber, 
  SUM(quantityOrdered) AS itemsCount, 
  SUM(priceeach * quantityOrdered) AS total 
FROM 
  orderdetails 
GROUP BY 
  ordernumber 
HAVING 
  total > 10000;  
  
  
  
CREATE TABLE sales (
    id INT AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    sale_amount DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY(id)
);  



INSERT INTO sales (product_name, sale_amount)
VALUES
    ('Product A', 100.50),
    ('Product B', 75.25),
    ('Product A', 120.75),
    ('Product C', 50.00),
    ('Product B', 90.80);
    
    
SELECT product_name, COUNT(id)
FROM sales
GROUP BY product_name;   


SELECT 
  product_name, 
  COUNT(id) 
FROM 
  sales 
GROUP BY 
  product_name 
HAVING 
  COUNT(id) > 1; 
  
  
  
  
  
  
  























/** 11/24  **/

SELECT MAX(amount) FROM payments; 

CREATE VIEW viewname AS
SELECT 
    customerNumber, 
    checkNumber, 
    amount
FROM
    payments
WHERE
    amount = (VIEW);
    
    



CREATE VIEW TEST1
AS     
SELECT 
    customerName
FROM
    customers
WHERE
    customerNumber NOT IN (SELECT DISTINCT
            customerNumber
        FROM
            orders);    
            
            
            
            
SELECT * FROM test1;    











CREATE OR REPLACE VIEW TEST1
AS 
SELECT 
    customerNumber, customerName, salesRepEmployeeNumber
FROM
    customers
WHERE
    customerNumber IN (SELECT * FROM sub1);      
				
SELECT * FROM test1;		

CREATE VIEW sub1 AS
SELECT DISTINCT
            customerNumber
        FROM
            orders;	
				
SELECT * FROM sub1;	




SELECT t.customerName, t.salesRepEmployeeNumber, e.firstName, e.lastName
FROM test1 t
INNER JOIN employees e;






			
				
				
SELECT * FROM test1;	







SELECT 
    customerNumber, 
    checkNumber, 
    amount
FROM
    payments
WHERE
    amount = (SELECT MAX(amount) FROM payments);	
	 
	 

CREATE VIEW TEST2
AS
SELECT MAX(amount) FROM payments;	


SELECT * FROM TEST2; 		 


SELECT 
    customerNumber, 
    checkNumber, 
    amount
FROM
    payments
WHERE
    amount = (SELECT * FROM TEST2); 
    
    
    




SELECT 
    customerNumber, 
    customerName
FROM
    customers
WHERE
    EXISTS( SELECT 
            orderNumber, SUM(priceEach * quantityOrdered)
        FROM
            orderdetails
                INNER JOIN
            orders USING (orderNumber)
        WHERE
            customerNumber = customers.customerNumber
        GROUP BY orderNumber
        HAVING SUM(priceEach * quantityOrdered) > 60000);
		  
		  







SELECT 
    productCode, 
    ROUND(SUM(quantityOrdered * priceEach)) sales
FROM
    orderdetails
        INNER JOIN
    orders USING (orderNumber)
WHERE
    YEAR(shippedDate) = 2003
GROUP BY productCode
ORDER BY sales DESC
LIMIT 5;     



SELECT 
    productName, sales
FROM
    (SELECT 
        productCode, 
        ROUND(SUM(quantityOrdered * priceEach)) sales
    FROM
        orderdetails
    INNER JOIN orders USING (orderNumber)
    WHERE
        YEAR(shippedDate) = 2003
    GROUP BY productCode
    ORDER BY sales DESC
    LIMIT 5) top5products2003
INNER JOIN
    products USING (productCode);














CREATE OR REPLACE VIEW test21
AS
SELECT 
    productCode, 
    ROUND(SUM(quantityOrdered * priceEach)) sales
FROM
    orderdetails
        INNER JOIN
    orders USING (orderNumber)
WHERE
    YEAR(shippedDate) = 2003
GROUP BY productCode
ORDER BY sales DESC
LIMIT 5;  



SELECT 
    productName, sales
FROM
    test21
INNER JOIN
    products USING (productCode);
sakila