DESC employees;

SELECT lastName
FROM employees;

SELECT 
    lastName, 
    firstName, 
    jobTitle
FROM
    employees;
    
SELECT *
FROM employees;


SELECT 1 * 1 AS 售價
FROM DUAL;


SELECT CONCAT('Jane',' ','Doe') AS 'Full name' 
FROM DUAL;

SELECT NOW();


SELECT
	contactLastname,
	contactFirstname
FROM
	customers
ORDER BY
	contactLastname DESC;
	
	
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
    quantityOrdered * priceEach AS subtotal
FROM
    orderdetails
ORDER BY 
   quantityOrdered * priceEach DESC;
	
	
	
SELECT FIELD('B', 'A', 'B','C');


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

DESC orders;
	
	
SELECT 
    firstName, lastName, reportsTo
FROM
    employees
ORDER BY reportsTo ;


SELECT 
    firstName, lastName, reportsTo
FROM
    employees
ORDER BY reportsTo DESC;


SELECT 
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
    jobtitle = 'Sales Rep' AND
    officeCode = 1;
    
    
    

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
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode IN (1 , 3, 7)
ORDER BY 
    officeCode;


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



SELECT DISTINCT 
    lastname
FROM
    employees
ORDER BY 
    lastname;
    
    
   -- 註解mysql
	-- charter and ,or ,in ,not in ,between ,like 以下待補上
SELECT 
    customername, 
    country, 
    state
FROM
    customers
WHERE
    country = 'USA' AND 
    state = 'CA';
