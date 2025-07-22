select * from bank;
select * from customer;
select * from employee;



CREATE VIEW employee_bank_customer_view AS
SELECT
    e.employee_id,
    e.first_name AS employee_first_name,
    e.last_name AS employee_last_name,
    e.position,
    e.branch_address,
    e.email_id AS employee_email,
    e.mobile_no,

    b.id AS bank_id,
    b.bank_name,
    b.branch AS bank_branch,
    b.ifsc_code,
    b.email AS bank_email,
    b.fund,

    c.customer_id,
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name,
    c.email AS customer_email,
    c.account_number,
    c.account_type,
    c.account_status,
    c.balance
FROM
    employee e
RIGHT JOIN
    bank b ON e.bank_id = b.id
RIGHT JOIN
    customer c ON b.id = c.bank_id;
