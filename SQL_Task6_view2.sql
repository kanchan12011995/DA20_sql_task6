--1. View with WHERE and ORDER BY: High-Fund Banks

CREATE VIEW high_fund_banks AS
SELECT 
    id, bank_name, branch, fund
FROM 
    bank
WHERE 
    fund > 10000000  -- Only banks with funds above ₹1 Crore
ORDER BY 
    fund DESC;

select * from high_fund_banks;

--This view helps identify banks with significant available funds, sorted from richest to leanest.

--2. View with GROUP BY and HAVING: Fund Summary Per Branch

select * from bank;

CREATE VIEW branch_fund_summary AS
SELECT 
    branch,
    COUNT(*) AS total_banks,
    SUM(fund) AS total_fund
FROM 
    bank
GROUP BY 
    branch
HAVING 
    SUM(fund) > 5000000  -- Only branches where total funds exceed ₹50 Lakhs
ORDER BY 
    total_fund DESC;

select * from branch_fund_summary;
	
--Great for comparing financial performance across different branches.


--3. View with WHERE, GROUP BY, and ORDER BY: Banks Grouped by City in Address

CREATE VIEW bank_by_city_summary AS
SELECT 
    address AS city,
    COUNT(*) AS num_banks,
    AVG(fund) AS avg_fund_per_bank
FROM 
    bank
WHERE 
    fund > 100000  -- Filter out low-fund banks
GROUP BY 
    city
ORDER BY 
    avg_fund_per_bank DESC;

select * from bank_by_city_summary;
