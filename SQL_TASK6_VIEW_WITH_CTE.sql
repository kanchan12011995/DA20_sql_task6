CREATE VIEW employee_customer_summary AS
WITH emp_bank AS (
    SELECT 
        e.employee_id,
        e.first_name AS employee_first_name,
        e.last_name AS employee_last_name,
        e.position,
        e.bank_id,
        b.bank_name,
        b.branch AS bank_branch,
        b.fund
    FROM 
        employee e
    JOIN 
        bank b ON e.bank_id = b.id
)
SELECT 
    emp_bank.employee_id,
    emp_bank.employee_first_name,
    emp_bank.employee_last_name,
    emp_bank.position,
    emp_bank.bank_name,
    emp_bank.bank_branch,
    emp_bank.fund,
    c.customer_id,
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name,
    c.email AS customer_email,
    c.balance
FROM 
    emp_bank
JOIN 
    customer c ON emp_bank.bank_id = c.bank_id
ORDER BY 
    emp_bank.bank_name,
    emp_bank.employee_last_name,
    c.balance DESC;
