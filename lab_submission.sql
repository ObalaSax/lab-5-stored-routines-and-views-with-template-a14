-- (i) A Procedure called PROC_LAB5
CREATE PROCEDURE PROC_LAB5
AS
BEGIN
    SELECT 
        c.customer_id, 
        c.first_name, 
        c.last_name, 
        SUM(o.total_amount) AS total_revenue
    FROM 
        customers c
    INNER JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY 
        c.customer_id, c.first_name, c.last_name;
END;

-- (ii) A Function called FUNC_LAB5

DELIMITER $$
CREATE FUNCTION fn_getCustomerRevenue(
    IN p_customerId INT
)
RETURNS TABLE (
    customer_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    total_revenue DECIMAL(10,2)
)
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        c.customer_id, 
        c.first_name, 
        c.last_name, 
        SUM(o.total_amount) AS total_revenue
    FROM 
        customers c
    INNER JOIN orders o ON c.customer_id = o.customer_id
    WHERE c.customer_id = p_customerId
    GROUP BY 
        c.customer_id, c.first_name, c.last_name;
END;
DELIMITER ;

-- (iii) A View called VIEW_LAB5
CREATE VIEW VIEW_LAB5 AS
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    SUM(o.total_amount) AS total_revenue
FROM 
    customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name;