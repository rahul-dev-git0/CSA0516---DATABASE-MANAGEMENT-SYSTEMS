USE `csa exp`;

CREATE TABLE employees_audit (
    id INT,
    old_salary INT,
    new_salary INT
);

DELIMITER //

CREATE TRIGGER before_employee_update
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employees_audit
    VALUES (OLD.id, OLD.salary, NEW.salary);
END //

DELIMITER ;

UPDATE employees
SET salary = 35000
WHERE id = 1;

SELECT * FROM employees;
SELECT * FROM employees_audit;
