CREATE VIEW employees_in_wealthy_banks AS
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.position,
    e.branch_address,
    b.bank_name,
    b.fund
FROM 
    employee e
JOIN 
    bank b ON e.bank_id = b.id
WHERE 
    b.fund > (
        SELECT AVG(fund) FROM bank
    )
ORDER BY 
    b.fund DESC, e.last_name;

SELECT * FROM employees_in_wealthy_banks;