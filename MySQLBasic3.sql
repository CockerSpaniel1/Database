/**1130 
CREATE/DROP STORE PROCEDURE
Delimiter
Declaring variables(DECLARE)
Variable scopes (SELECT INTO, using @ outside the procedure)
Parameters (in & out)
if then elseif then  else
case (when then)
loop
Cursor
Create TRIGGER (with UPDATE)
DROP TRIGGER
BEFORE INSERT
c13 INSERT INTO
**/



DROP PROCEDURE IF EXISTS GetCustomers;

DELIMITER $$

CREATE PROCEDURE GetCustomers()
BEGIN
	SELECT 
		customerName, 
		city, 
		state, 
		postalCode, 
		country
	FROM
		customers
	ORDER BY customerName;    
END$$
DELIMITER ;


CALL GetCustomers();


/*----------------------------------------*/
DROP PROCEDURE IF EXISTS GetTotalOrder;

DELIMITER $$

CREATE PROCEDURE GetTotalOrder()
BEGIN
	DECLARE totalOrder INT DEFAULT 0;
    
    SELECT COUNT(*) 
    INTO totalOrder
    FROM orders;
    
    SELECT totalOrder;
END$$

DELIMITER ;

CALL GetTotalOrder();




/*----------------------------------------*/
DROP PROCEDURE IF EXISTS GetCustomerLevel;

DELIMITER $$

CREATE PROCEDURE GetCustomerLevel(
    IN  pCustomerNumber INT, 
    OUT pCustomerLevel  VARCHAR(20))
BEGIN
    DECLARE credit DECIMAL(10,2) DEFAULT 0;

    SELECT creditLimit 
    INTO credit
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    IF credit > 50000 THEN
        SET pCustomerLevel = '白金卡';
        
    ELSEIF credit <= 50000 AND credit > 10000 THEN
        SET pCustomerLevel = '金卡';
    
	 ELSE
        SET pCustomerLevel = '一般卡';    
    
    END IF;
END$$

DELIMITER ;
/*白金 金 一般*/
CALL GetCustomerLevel(141, @LEVEL); 
SELECT @LEVEL;

CALL GetCustomerLevel(103, @LEVEL); 
SELECT @LEVEL;

CALL GetCustomerLevel(3, @level); 
SELECT @LEVEL;




/*----------------------------------------*/
DROP PROCEDURE IF EXISTS GetCustomerShipping;

DELIMITER $$

CREATE PROCEDURE GetCustomerShipping(
	IN  pCustomerNUmber INT, 
	OUT pShipping       VARCHAR(50)
)
BEGIN
    DECLARE customerCountry VARCHAR(100);

SELECT 
    country
INTO customerCountry FROM
    customers
WHERE
    customerNumber = pCustomerNUmber;

    CASE customerCountry
		WHEN  'USA' THEN
		   SET pShipping = '2-day Shipping';
		WHEN 'Canada' THEN
		   SET pShipping = '3-day Shipping';
		ELSE
		   SET pShipping = '5-day Shipping';
	END CASE;
END$$

DELIMITER ;


CALL GetCustomerShipping(112, @shipping);
SELECT @SHIPPING;



DROP PROCEDURE IF EXISTS GetDeliveryStatus;

DELIMITER $$

CREATE PROCEDURE GetDeliveryStatus(
	IN pOrderNumber INT,
    OUT pDeliveryStatus VARCHAR(100)
)
BEGIN
	DECLARE waitingDay INT DEFAULT 0;
    SELECT 
		DATEDIFF(requiredDate, shippedDate)
	INTO waitingDay
	FROM orders
    WHERE orderNumber = pOrderNumber;
    
    CASE 
		WHEN waitingDay = 0 THEN 
			SET pDeliveryStatus = 'On Time';
        WHEN waitingDay >= 1 AND waitingDay < 5 THEN
			SET pDeliveryStatus = 'Late';
		WHEN waitingDay >= 5 THEN
			SET pDeliveryStatus = 'Very Late';
		ELSE
			SET pDeliveryStatus = 'No Information';
	END CASE;	
END$$
DELIMITER ;

CALL GetDeliveryStatus(10100,@delivery);

SELECT @delivery




/*----------------------------------------*/
DROP PROCEDURE IF EXISTS LoopDemo;

DELIMITER $$
CREATE PROCEDURE LoopDemo()
BEGIN
	DECLARE x  INT;
	DECLARE str  VARCHAR(255);
        
	SET x = 1;
	SET str =  '';
        
	loop_label:  LOOP
		IF  x > 10 THEN 
			LEAVE  loop_label;
		END  IF;
            
		SET  x = x + 1;
		IF  (x mod 2) THEN
			ITERATE  loop_label;
		ELSE
			SET  str = CONCAT(str,x,',');
		END  IF;
	END LOOP;
	SELECT str;
END$$

DELIMITER ;

CALL LoopDemo();


/*----------------------------------------*/
CREATE TABLE calendars(
    id INT AUTO_INCREMENT,
    fulldate DATE UNIQUE,
    day TINYINT NOT NULL,
    month TINYINT NOT NULL,
    quarter TINYINT NOT NULL,
    year INT NOT NULL,
    PRIMARY KEY(id)
);


DELIMITER $$

CREATE PROCEDURE InsertCalendar(dt DATE)
BEGIN
    INSERT INTO calendars(
        fulldate,
        day,
        month,
        quarter,
        year
    )
    VALUES(
        dt, 
        EXTRACT(DAY FROM dt),
        EXTRACT(MONTH FROM dt),
        EXTRACT(QUARTER FROM dt),
        EXTRACT(YEAR FROM dt)
    );
END$$

DELIMITER ;




DELIMITER $$

CREATE PROCEDURE LoadCalendars(
    startDate DATE, 
    day INT
)
BEGIN
    
    DECLARE counter INT DEFAULT 1;
    DECLARE dt DATE DEFAULT startDate;

    WHILE counter <= day DO
        CALL InsertCalendar(dt);
        SET counter = counter + 1;
        SET dt = DATE_ADD(dt,INTERVAL 1 day);
    END WHILE;

END$$

DELIMITER ;


CALL LoadCalendars('2019-11-30',50);
SELECT * FROM Calendars



/*----------------------------------------*/
DROP PROCEDURE IF EXISTS RepeatDemo;

DELIMITER $$

CREATE PROCEDURE RepeatDemo()
BEGIN
    DECLARE counter INT DEFAULT 100;
    DECLARE result VARCHAR(100) DEFAULT '';
    
    REPEAT
        SET result = CONCAT(result,counter,',');
        SET counter = counter + 1;
    UNTIL counter > 110
    END REPEAT;
    
    -- display result
    SELECT result;
END$$

DELIMITER ;

CALL RepeatDemo();


/*----------------------------------------*/
DROP TABLE IF EXISTS employees_audit;

CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);



DROP TRIGGER IF EXISTS before_employee_update;

CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
 INSERT INTO employees_audit
 SET action = 'update',
     employeeNumber = OLD.employeeNumber,
     lastname = OLD.lastname,
     changedat = NOW();

SHOW TRIGGERS;

SELECT * FROM employees WHERE employeeNumber = 1056; 
SELECT * FROM employees_audit;


UPDATE employees 
SET 
    lastName = 'TEST3'
WHERE
    employeeNumber = 1056;





/*----------------------------------------*/
DROP TABLE IF EXISTS billings;

CREATE TABLE billings (
    billingNo INT AUTO_INCREMENT,
    customerNo INT,
    billingDate DATE,
    amount DEC(10 , 2 ),
    PRIMARY KEY (billingNo)
);

DROP TRIGGER IF EXISTS before_billing_update;

DELIMITER $$
CREATE TRIGGER before_billing_update
    BEFORE UPDATE 
    ON billings FOR EACH ROW
BEGIN
    IF new.amount > old.amount * 10 THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'New amount cannot be 10 times greater than the current amount.';
    END IF;
END$$    
DELIMITER ;


SHOW TRIGGERS;

DROP TRIGGER before_billing_update;
SHOW TRIGGERS;


/*----------------------------------------*/
DROP TABLE IF EXISTS WorkCenters;

CREATE TABLE WorkCenters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    capacity INT NOT NULL
);


DROP TABLE IF EXISTS WorkCenterStats;

CREATE TABLE WorkCenterStats(
    totalCapacity INT NOT NULL
);


DELIMITER $$

CREATE TRIGGER before_workcenters_insert
BEFORE INSERT
ON WorkCenters FOR EACH ROW
BEGIN
    DECLARE rowcount INT;
    
    SELECT COUNT(*) 
    INTO rowcount
    FROM WorkCenterStats;
    
    IF rowcount > 0 THEN
        UPDATE WorkCenterStats
        SET totalCapacity = totalCapacity + new.capacity;
    ELSE
        INSERT INTO WorkCenterStats(totalCapacity)
        VALUES(new.capacity);
    END IF; 

END $$

DELIMITER ;


INSERT INTO WorkCenters(name, capacity)
VALUES('Mold Machine',100);

INSERT INTO WorkCenters(name, capacity)
VALUES('Packing',200);


SELECT * FROM WorkCenters;
SELECT * FROM WorkCenterStats;  


/*----------------------------------------*/
DROP TABLE IF EXISTS suppliers;
CREATE TABLE suppliers (
    supplierNumber INT AUTO_INCREMENT,
    supplierName VARCHAR(50) NOT NULL,
    phone VARCHAR(50),
    addressLine1 VARCHAR(50),
    addressLine2 VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postalCode VARCHAR(50),
    country VARCHAR(50),
    customerNumber INT,
    PRIMARY KEY (supplierNumber)
);


INSERT INTO suppliers (
    supplierName, 
    phone, 
    addressLine1,
    addressLine2,
    city,
    state,
    postalCode,
    country,
    customerNumber
)
SELECT 
    customerName,
    phone,
    addressLine1,
    addressLine2,
    city,
    state ,
    postalCode,
    country,
    customerNumber
FROM 
    customers
WHERE 
    country = 'USA' AND 
    state = 'CA';



SELECT * FROM suppliers;
