select * from bank;
select * from customer;

-- 1.create a view that combines customer details with their bank information using joins.

CREATE VIEW customer_with_bank_info AS
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.phone_number,
    c.account_number,
    c.account_type,
    c.account_status,
    c.date_opened,
    b.bank_name,
    b.branch,
    b.ifsc_code
FROM
    customer c
JOIN
    bank b ON c.bank_id = b.id;

select * from customer_with_bank_info;


--TASK1_VIEW_2_USING JOINS.
---- 2.create a view that combines employee details with their bank information using  left joins.


SELECT * FROM BANK;
SELECT * FROM EMPLOYEE;

CREATE VIEW BANK_WITH_EMPLOYEE_INFO AS
SELECT
B.ID,
B.BANK_NAME,
B.BRANCH,
B.IFSC_CODE,
E.FIRST_NAME,
E.LAST_NAME,
E.BANK_ID,
E.POSITION,
E.MOBILE_NO 
FROM EMPLOYEE AS E
LEFT JOIN 
BANK AS B ON E.BANK_ID = B.ID;

select * from BANK_WITH_EMPLOYEE_INFO;

--TASK1_VIEW_3_USING JOINS.
---- 3.create a view that combines employee details with their bank information using  left joins.

select * from customer;
select * from transaction_details;

CREATE VIEW CUSTOMER_WITH_TRANSACTION_INFO AS
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.balance,
    c.account_number,
    c.account_type,
    td.transaction_id,
    td.transaction_type,
    td.status
FROM customer AS c
INNER JOIN transaction_details AS td 
    ON c.customer_id = td.customer_id;

select * from CUSTOMER_WITH_TRANSACTION_INFO;









