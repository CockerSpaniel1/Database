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



SELECT * FROM committees ;

DELETE FROM committees 
WHERE committee_id IN (5,6,7,8);


SELECT 
    m.member_id, 
    m.name AS "會員", 
    c.committee_id, 
    c.name AS "委員"
FROM
    members m
INNER JOIN committees c 
ON c.name = m.name;


SELECT 
    m.member_id, 
    m.name AS "會員", 
    c.committee_id, 
    c.name AS "委員"
FROM
    members m
LEFT JOIN committees c ON c.name = m.name;


SELECT 
    m.member_id, 
    m.name AS "會員", 
    c.committee_id, 
    c.name AS "委員"
FROM
    members m
LEFT JOIN committees c ON c.name = m.name
WHERE c.committee_id IS NULL;

SELECT 
    m.member_id, 
    m.name AS "會員", 
    c.committee_id, 
    c.name AS "委員"
FROM
    members m
RIGHT JOIN committees c ON c.name = m.name


SELECT 
    m.member_id, 
    m.name AS "會員", 
    c.committee_id, 
    c.name AS "委員"
FROM
    members m
RIGHT JOIN committees c ON c.name = m.name
WHERE m.member_id IS NULL;


SELECT 
    m.member_id, 
    m.name AS "會員", 
    c.committee_id, 
    c.name AS "委員"
FROM
    members m
CROSS JOIN committees c;

SELECT 
    productCode, 
    productName, 
    textDescription
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
    orders.orderNumber,
    orderDate,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
INNER JOIN
    orderdetails ON orders.orderNumber = orderdetails.orderNumber
INNER JOIN
    products ON productCode
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
    quantityOrdered
    
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
    lastName, 
    firstName, 
    customerName, 
    checkNumber, 
    amount
FROM
    employees
LEFT JOIN customers ON 
    employeeNumber = salesRepEmployeeNumber
LEFT JOIN payments ON 
    payments.customerNumber = customers.customerNumber
ORDER BY 
    customerName, 
    checkNumber;


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
  status 
FROM 
  orders 
GROUP BY 
  status;

SELECT 
  DISTINCT status 
FROM 
  orders;
  
SELECT 
  status, 
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
  orderNumber, 
  SUM(quantityOrdered * priceEach) AS total 
FROM 
  orderdetails 
GROUP BY 
  orderNumber;
  
  
  
SELECT 
  YEAR(orderDate) AS year, 
  SUM(quantityOrdered * priceEach) AS total 
FROM 
  orders 
  INNER JOIN orderdetails USING (orderNumber) 
WHERE 
  status = 'Shipped' 
GROUP BY 
  YEAR(orderDate);
  
  
SELECT 
  YEAR(orderDate) AS year, 
  SUM(quantityOrdered * priceEach) AS total 
FROM 
  orders 
  INNER JOIN orderdetails USING (orderNumber) 
WHERE 
  status = 'Shipped' 
GROUP BY 
  year 
HAVING 
  year > 2003;
  
  
SELECT 
  ordernumber, 
  SUM(quantityOrdered) AS itemsCount, 
  SUM(priceeach * quantityOrdered) AS total 
FROM 
  orderdetails 
GROUP BY 
  ordernumber 
HAVING 
  total > 1000;  
  
 
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


  


/** 
SELECT 
    m.member_id, 
    m.name AS "會員", 
    c.committee_id, 
    c.name AS "委員"
FROM
    members m , committees c;

SELECT 
    m.member_id, 
    m.name AS "會員", 
    c.committee_id, 
    c.name AS "委員"
FROM
    members m
LEFT JOIN committees c ON c.name = m.name;**/