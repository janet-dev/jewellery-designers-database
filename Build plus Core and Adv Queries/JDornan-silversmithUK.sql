-- Janet Dornan - Jewellery Designer's Store

CREATE DATABASE silversmithUK; 		-- with PRIMARY & FOREIGN keys
USE silversmithUK;

-- ------------------------------------
-- 1. Stock Table
-- ------------------------------------

CREATE TABLE stock (
    SKU INT PRIMARY KEY AUTO_INCREMENT,
    Item VARCHAR(50) NOT NULL,
    Shop VARCHAR(50) NOT NULL,
    Price DECIMAL(6, 2) NOT NULL,
    Quantity INT NOT NULL
);

INSERT INTO stock
(SKU, Item, Shop, Price, Quantity)
VALUES
(SKU, 'Silver Tension Ring', 'website', 135.00, 3),
(SKU, 'Silver Adjustible Ring', 'website', 15.00, 1),
(SKU, 'Silver Collet Set Ring', 'website', 90.00, 1 ),
(SKU, 'Silver Adjustible Bangle', 'website', 30.00, 4),
(SKU, 'Silver Cuff Bangle', 'website', 55.00, 1),
(SKU, 'Neon Yellow Cuff Bangle', 'website', 20.00, 6),
(SKU, 'Silver Pink Splash Pendant', 'gallery', 30.00, 2),
(SKU, 'Pure Silver Abstract Pendant', 'website', 30.00, 3),
(SKU, 'Neon Pink Orange Eve Pendant', 'website', 25.00, 1),
(SKU, 'Copper Domed Pendant', 'website', 15.00, 7),
(SKU, 'Snow Flowers Enamelled Pendant', 'gallery', 56.00, 1),
(SKU, 'Domed Enamelled Red Abstract Brooch', 'gallery', 60.00, 1),
(SKU, 'Handmade Silver Chain', 'gallery', 72.00, 1),
(SKU, '10ct Gold Casting Grain Studs', 'gallery', 30.00, 1),
(SKU, 'Silver Unisex Circle Studs', 'gallery', 15.00, 3),
(SKU, 'Pink Circle Studs', 'gallery', 20.00, 1),
(SKU, 'Upcycled Brew Dog Blue Earrings', 'Warwick', 12.00, 5),
(SKU, 'Upcycled Brew Dog Purple Earrings', 'Warwick', 12.00, 1),
(SKU, 'Upcycled Brew Dog Green Earrings', 'Warwick', 12.00, 2),
(SKU, 'Black & White Unisex Cube Studs', 'website', 15.00, 2);

SELECT * FROM stock;

-- ------------------------------------
-- 2. Customer Table
-- ------------------------------------

CREATE TABLE customer (
    id INT PRIMARY KEY AUTO_INCREMENT,
    surname VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    title VARCHAR(10) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    building_number VARCHAR(5) NOT NULL,
    city VARCHAR(50),
    postcode VARCHAR(10),
    country VARCHAR(20) NOT NULL
);

INSERT INTO customer
(id, surname, first_name, title, 
email, phone_number, 
building_number, city, postcode, country)
VALUES
(id, 'Red', 'Mike', 'Mr', 'mike.red@gmail.com', '44 7870 133426', '5', 'Bristol', 'BS1 2TD', 'UK'),
(id, 'Green', 'Andrea', 'Ms', 'agreen@hotmail.com', '44 7442 923458', '448', 'London', 'E17 6XS', 'UK'),
(id, 'Blue', 'Janet', 'Miss', 'blue-spike@gmail.com', '44 7871 121166','365', 'Dudley', 'DY11 4HK', 'UK'),
(id, 'Purple', 'Fred', 'Ms', 'PURPLE-SPOT@outlook.com', '44 7438 802322','12', 'London', 'SW2 5GB', 'UK'),
(id, 'Magenta', 'Sami', 'Ms', 'magentas@yahoo.com', '44 7221 802322','24', 'York', 'YK21 0IE', 'UK'),
(id, 'Ochre', 'Jake', 'Mr', 'jochre@mail.com', '38 7734 219023','31', 'Koln', '55322', 'Germany'),
(id, 'Yellow', 'Mariam', 'Dr', 'yellow-mar@aol.com', '44 7557 212596','60', 'Swansea', 'SN21 5CZ', 'UK'),
(id, 'Blue', 'Helen', 'Mrs', 'helen_blue@hotmail.com', '44 7871 702618','112', 'Ely', 'CB21 8NL', 'UK'),
(id, 'Orange', 'Becca', 'Miss', 'bex.orange@hello.com', '44 7973 159427', '6b', 'Glasgow', 'G7 2FB', 'UK'),
(id, 'Orange', 'Steve', 'Mr', 'sorange@take.com', '44 7973 159426', '6b', 'Glasgow', 'G7 2FB', 'UK'),
(id, 'Pink', 'Val', 'Mrs', 'pinkie@free.com', '44 7823 359352', '87', 'Berwick', 'BW7 9TW', 'UK');

select * from customer;

-- ------------------------------------
-- 3. Supplier Table
-- ------------------------------------

CREATE TABLE supplier (
    ref INT PRIMARY KEY AUTO_INCREMENT,
    company VARCHAR(50),
	country VARCHAR(20),
    base VARCHAR(50),
    coating VARCHAR(50),
    stones VARCHAR(50),
    readyMade VARCHAR(50)
);

INSERT INTO supplier
(ref, company, country, base, coating, stones, readyMade)
VALUES
(ref, 'Cooksongold', 'UK', 'Silver', null, null, null),
(ref, 'Cooksongold', 'UK', 'Gold', null, null, null),
(ref, 'Cooksongold', 'UK', null, null, null, 'Chain'),
(ref, 'Kernow Craft', 'UK', null, null, 'Gems', null),
(ref, 'Kernow Craft', 'UK', 'Copper', null, null, null),
(ref, 'Amazon', 'UK', null, null, null, 'Findings'),
(ref, 'Amazon', 'UK', null, 'Acrylic', null, null),
(ref, 'Warm Glass', 'UK', null, null, 'Glass', null),
(ref, 'Warm Glass', 'UK', null, 'Enamel', null, null),
(ref, 'Green Cast', 'Italy', 'Perspex', null, null, null),
(ref, 'Metal Clay Co', 'UK', 'Silver Clay', null, null, null),
(ref, 'Brew Dog', 'UK', 'Aluminium', null, null, null);

SELECT * FROM supplier;

-- ------------------------------------
-- 4. Customer Invoice Table
-- ------------------------------------

CREATE TABLE customer_inv (
    bill INT PRIMARY KEY AUTO_INCREMENT,
    id INT NOT NULL,			-- FK - customer.id
    purchase INT NOT NULL, 		-- FK - stock.SKU
	amount DECIMAL(6, 2) NOT NULL,
    period VARCHAR(3) NOT NULL,
    paid BOOLEAN NOT NULL,
    refund BOOLEAN NOT NULL,
    CONSTRAINT fk_id
		FOREIGN KEY (id) 
        REFERENCES customer(id),
	CONSTRAINT fk_purchase
		FOREIGN KEY (purchase) 
        REFERENCES stock(SKU)
);

INSERT INTO customer_inv
(bill, id, purchase, amount, period, paid, refund)
VALUES
(bill, 8, 5, 55.00, 'jan', true, false),
(bill, 1, 1, 135.00, 'feb', false, false),
(bill, 5, 9, 25.00, 'feb', true, false),
(bill, 4, 11, 56.00, 'mar', true, false),
(bill, 11, 19, 12.00, 'apr', true, false),
(bill, 6, 3, 90.00, 'apr', true, false),
(bill, 2, 14, 30.00, 'may', true, true),
(bill, 1, 13, 72.00, 'may', false, false),
(bill, 4, 16, 20.00, 'jun', true, false),
(bill, 10, 18, 12.00, 'jun', true, false),
(bill, 7, 10, 15.00, 'oct', true, false),
(bill, 7, 6, 20.00, 'dec', true, false),
(bill, 9, 8, 30.00, 'dec', true, false),
(bill, 3, 12, 60.00, 'dec', true, false);

SELECT * FROM customer_inv;

-- ------------------------------------
-- 5. Supplier Invoice Table
-- ------------------------------------

CREATE TABLE supplier_inv (
    invoice INT PRIMARY KEY AUTO_INCREMENT,
    ref INT NOT NULL,			-- FK - supplier.ref
	amount DECIMAL(6, 2) NOT NULL,
    paid BOOLEAN NOT NULL,
    refund BOOLEAN NOT NULL,
    CONSTRAINT fk_ref
    FOREIGN KEY(ref) 
		REFERENCES supplier(ref)
);

INSERT INTO supplier_inv
(invoice, ref, amount, paid, refund)
VALUES
(invoice, 8, 155.00, true, false),
(invoice, 1, 1135.00, false, false),
(invoice, 5, 125.00, true, false),
(invoice, 4, 157.00, true, false),
(invoice, 11, 112.00, true, false),
(invoice, 6, 190.00, true, false),
(invoice, 2, 130.00, true, true),
(invoice, 1, 172.00, false, false),
(invoice, 4, 120.00, true, false),
(invoice, 10, 112.00, true, false),
(invoice, 7, 115.00, true, false),
(invoice, 7, 121.00, true, false),
(invoice, 9, 256.00, true, false),
(invoice, 3, 160.00, true, false);

SELECT * FROM supplier_inv;

-- ------------------------------------
-- 6. Design Table
-- ------------------------------------

CREATE TABLE design (
	id INT PRIMARY KEY AUTO_INCREMENT,
    SKU INT,					-- FK - stock.SKU
    Category VARCHAR(50) NOT NULL,
    Base VARCHAR(20) NOT NULL,
    Purity INT,
    Finish VARCHAR(20),
    Gems VARCHAR(20),
    Recycled BOOLEAN NOT NULL,
    CONSTRAINT fk_SKU
    FOREIGN KEY(SKU) 
		REFERENCES stock(SKU)
);

INSERT INTO design
(id, SKU, Category, Base, Purity, Finish, Gems, Recycled)
VALUES
(id, 16, 'Earrings', 'Silver', 925, 'Acrylic', null, true),
(id, 20, 'Earrings', 'Silver', 925, 'Acrylic', null, true),
(id, 17, 'Earrings', 'Aluminium', 0, 'Original', null, true),
(id, 6, 'Bangle', 'Perspex', 0, 'Texture', null, true),
(id, 12, 'Brooch', 'Copper', 0, 'Enamel', null, false),
(id, 4, 'Bangle', 'Silver', 925, 'Texture', 'Glass', true),
(id, 13, 'Necklace', 'Silver', 925, 'Brush', null, true),
(id, 18, 'Earrings', 'Aluminium', 0, 'Original', null, true),
(id, 19, 'Earrings', 'Aluminium', 0, 'Original', null, true),
(id, 15, 'Earrings', 'Silver', 925, 'Brush', null, true),
(id, 14, 'Earrings', 'Gold', 10, 'Brush', 'Gold', true),
(id, 5, 'Bangle', 'Silver', 925, 'Texture', null, true),
(id, 7, 'Pendant', 'Silver', 925, 'Acrylic', null, false),
(id, 11, 'Pendant', 'Copper', 0, 'Enamel', null, false),
(id, 10, 'Pendant', 'Copper', 0, 'Texture', null, false),
(id, 1, 'Ring', 'Silver', 925, 'Mirror', 'Blue Topaz', false),
(id, 3, 'Ring', 'Silver', 925, 'Brush', 'Orange CZ', false),
(id, 8, 'Pendant', 'Silver', 999, 'Texture', null, true),
(id, 9, 'Pendant', 'Perspex', 0, 'Mirror', null, false),
(id, 2, 'Ring', 'Silver', 925, 'Texture', null, true);

SELECT * FROM design;

-- -------------------------------------------------------------------
-- Janet Dornan - Jewellery Designer Store - CORE REQUIREMENTS
-- -------------------------------------------------------------------
-- Joins 
-- -------------------------------------------------------------------
-- Inner join used to see the customer 'paid' status & what they purchased.
SELECT 
	cinv.amount AS 'Price £', cinv.paid AS 'Paid',	-- from customer_inv table
    st.item AS 'Description',						-- from stock table
    d.Category AS 'Category',						-- from design table
    c.surname AS 'Customer Surname', c.email AS 'Customer Email',	-- from customer table
    -- Displaying below; the purchase/stock/design SKUs & customer/invoice id columns, 
    -- as a quick check, to see if the information is correct.
    -- Normally these columns would not be shown
    cinv.purchase AS 'cinv.purchase', st.SKU AS 'st.SKU', d.SKU as 'd.SKU',
    cinv.id AS 'cinv.id', c.id AS 'c.id'
FROM customer_inv cinv			-- to customer_inv join stock, design & customer tables 
	INNER JOIN stock st			-- join stock table using stock.SKU
		ON cinv.purchase = st.SKU
	INNER JOIN design d			-- join design table using design.SKU
		ON cinv.purchase = d.SKU
	INNER JOIN customer c		-- join customer table using customer.id
		ON cinv.id = c.id;

-- -------------------------------------------------------------------
-- Stored Function 
-- -------------------------------------------------------------------
-- Find out postage charges depending on customer location
SELECT * FROM customer;

DELIMITER //
-- identify postage costs
CREATE FUNCTION post(      -- function name
	country VARCHAR(20)
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
	DECLARE post_costs DECIMAL(6, 2);
    IF country = 'UK' THEN
		SET post_costs = 1.55;
	ELSEIF country = 'Germany' THEN
		SET post_costs = 2.95;
	ELSEIF country = 'France' THEN
		SET post_costs = 2.95;
	ELSEIF country = 'Spain' THEN
		SET post_costs = 2.95;
	ELSEIF country = 'Italy' THEN
		SET post_costs = 2.95;
	ELSEIF country = 'Netherlands' THEN
		SET post_costs = 2.95;
	ELSEIF country = 'Ireland' THEN
		SET post_costs = 2.95;
	ELSE SET post_costs = '5.95';  -- catch-all REST OF WORLD condition
	END IF;
    RETURN (post_costs);    -- return outcome
END//country
DELIMITER ;

SELECT
	title, first_name, surname, city, country,
    post(country) AS 'postage' -- name of the new temporary column
FROM customer;

-- SHOW FUNCTION STATUS;

-- -------------------------------------------------------------------
--  Query & Sub-query
-- -------------------------------------------------------------------
-- 1. Find customer & their phone number, due a refund
SELECT title, first_name, surname, phone_number
FROM customer
WHERE id IN (
	SELECT id
	FROM customer_inv
	WHERE refund = True
	) 
;

-- 2. Find the customer orders where the raw base material has not yet been paid for.
SELECT id AS 'Customer Id', purchase AS 'Orders(no_raw_material)'
FROM customer_inv cinv		
WHERE purchase IN (				-- customer_inv.purchase
	SELECT SKU					-- design.SKU
    FROM design d
    WHERE Base IN (				-- design.Base
		SELECT base				-- supplier.base
        FROM supplier su
        WHERE ref IN (			-- supplier.ref
			SELECT ref			-- supplier_inv.ref
            FROM supplier_inv sinv
            WHERE paid = False		-- Cooksongold silver not yet paid for
            )
		)
	)
ORDER by id			-- customer_inv.id
;

-- 3. Which customers (& find their cities), have bought recycled jewellery?
SELECT first_name, surname, city
FROM customer
WHERE id IN (
	SELECT id
    FROM customer_inv
    WHERE purchase IN (
		SELECT SKU
        FROM design
        WHERE Recycled = TRUE
        )
	)
;

-- -------------------------------------------------------------------
-- Database Diagram - see the EER file
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- Janet Dornan - Jewellery Designer Store - ADVANCED OPTIONS
-- -------------------------------------------------------------------
-- Stored Procedure
-- -------------------------------------------------------------------
SELECT * FROM supplier;

-- set delimiter to '//'
DELIMITER //
-- Procedure to easily add new materials and their suppliers
CREATE PROCEDURE new_Supplier(   -- declare procedure called 'new_Supplier'
	IN num INT,
    IN firm VARCHAR(50),
    IN loc VARCHAR(20),
    IN metal VARCHAR(50),
    IN enamel VARCHAR(50),
    IN stone VARCHAR(50),
    IN offShelf VARCHAR(50)
)
BEGIN     -- begin the procedure
	INSERT INTO supplier(ref, company, country, base, coating, stones, readyMade)
    VALUES (num, firm, loc, metal, enamel, stone, offShelf);
END//  -- end of procedure

-- set delimiter back to  ';'
DELIMITER ;

CALL new_Supplier (NULL, 'MetalClays4You', 'UK', 'Titanium', null, null, null); 
-- NULL at beginning allows the auto increment sequence to continue
SELECT * FROM supplier;

-- DELETE FROM supplier WHERE supplier.base='Titanium';  -- to restore to original table
-- DROP PROCEDURE new_Supplier;
SHOW PROCEDURE STATUS;

-- ----------------------------------------------------------
-- Trigger
-- ----------------------------------------------------------
SELECT * FROM customer;

-- keeping a log of updates to address details in the 'customer' table

CREATE TABLE customer_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    building_number VARCHAR(5) NOT NULL,
    city VARCHAR(50),
    postcode VARCHAR(10),
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);

CREATE TRIGGER before_customer_update 
    BEFORE UPDATE ON customer
    FOR EACH ROW 
 INSERT INTO customer_audit
 SET action = 'update',
     building_number = OLD.building_number,
     city = OLD.city,
     postcode = OLD.postcode,
     changedat = NOW();
     
SHOW TRIGGERS;

UPDATE customer 
SET 
    building_number = '42',
    city = 'Dundee',
    postcode = 'DD1 1DB'
WHERE
    id = 9;
    
UPDATE customer 
SET 
    building_number = '6b',
    city = 'Glasgow',
    postcode = 'G7 2FB'
WHERE
    id = 9;
    
SELECT * FROM customer_audit;    
SELECT * FROM customer;

-- ----------------------------------------------------------
-- Event
-- ----------------------------------------------------------
SHOW PROCESSLIST;    -- view the status of the event scheduler thread
-- if not enabled, set the event_scheduler system variable to enable and start it
SET GLOBAL event_scheduler = ON;
SHOW PROCESSLIST;    -- check it's running

-- SET GLOBAL event_scheduler = OFF;  -- to disable

-- create table to store the customers yet to pay
CREATE TABLE nonPayment (
    surname VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    title VARCHAR(10) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

CREATE EVENT event_NonPayment
	ON SCHEDULE EVERY 12 HOUR STARTS NOW()	-- '2021-06-08 09:31:00'
	DO INSERT INTO nonPayment (surname, first_name, title, email, phone_number)
    -- Run a twice daily query, to find out which customers have not paid their bill
	SELECT surname, first_name, title, email, phone_number
    FROM customer
    WHERE id IN (
		SELECT id
        FROM customer_inv
        WHERE paid = False
        )
;
SELECT * FROM nonPayment;

SHOW EVENTS;
-- DROP EVENT event_NonPayment;
-- SET GLOBAL event_scheduler = OFF;  -- to disable

-- ----------------------------------------------------------
-- View
-- ----------------------------------------------------------
-- Want to quickly check sales data for recycled items sold:
-- outlet purchased from, customer location & month.
-- Joined stock, design & customer tables to customer_inv.

CREATE OR REPLACE VIEW vw_stock_design AS 
	SELECT st.SKU, st.Shop, d.Category, c.city, cinv.period
    FROM customer_inv AS cinv 
		INNER JOIN customer AS c 
			ON cinv.id = c.id
		INNER JOIN stock AS st
			ON cinv.purchase = st.SKU
		INNER JOIN design AS d
			ON cinv.purchase = d.SKU
	WHERE Recycled = True
    ORDER BY cinv.period
;
SELECT * FROM vw_stock_design;

SHOW FULL TABLES IN silversmithUK WHERE TABLE_TYPE LIKE 'VIEW';

-- ----------------------------------------------------------
-- Group By
-- ----------------------------------------------------------
-- Monthly sales (group by month) where total is greater than £30
SELECT
	period AS 'Month',
    SUM(amount) AS 'Amount £/mth'
    FROM customer_inv
    GROUP BY period
    HAVING SUM(amount) > 30
    ORDER BY period;

-- ----------------------------------------------------------
-- THE END -- 
-- Thank you Charlotte, Mabel & Sahba 
-- for all your help and inspiration!!!
-- ----------------------------------------------------------

