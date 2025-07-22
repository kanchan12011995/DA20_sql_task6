--1. View: Employee Count per Bank Branch (GROUP BY + HAVING)

CREATE VIEW employee_count_per_branch AS
SELECT 
    b.branch AS branch_name,
    COUNT(e.employee_id) AS total_employees
FROM 
    employee e
JOIN 
    bank b ON e.bank_id = b.id
GROUP BY 
    b.branch
HAVING 
    COUNT(e.employee_id) >= 5  
ORDER BY 
    total_employees DESC;

select * from employee_count_per_branch;


--2. View: Employees in Managerial Positions (WHERE + JOIN + ORDER BY)

CREATE VIEW managerial_employees AS
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.position,
    b.bank_name,
    b.branch,
    e.email_id
FROM 
    employee e
JOIN 
    bank b ON e.bank_id = b.id
WHERE 
    e.position IN ('BankManager', 'Cashier')  
ORDER BY 
    b.branch ASC, e.last_name ASC;

select * from managerial_employees;
	

--3. View: Employee Distribution by Branch Address (GROUP BY + ORDER BY)

CREATE VIEW employee_distribution_by_address AS
SELECT 
    e.branch_address,
    COUNT(e.employee_id) AS num_employees,
    AVG(b.fund) AS avg_branch_fund
FROM 
    employee e
JOIN 
    bank b ON e.bank_id = b.id
GROUP BY 
    e.branch_address
ORDER BY 
    avg_branch_fund DESC;

select * from employee_distribution_by_address;
