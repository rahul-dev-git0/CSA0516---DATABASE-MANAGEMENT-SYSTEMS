USE `csa exp`;

CREATE TABLE employees (
    id INT,
    name VARCHAR(30),
    salary INT
);

INSERT INTO employees VALUES
(1, 'Arun', 25000),
(2, 'Rahul', 30000),
(3, 'Kiran', 28000);

DELIMITER //

CREATE PROCEDURE show_employee_names()
BEGIN
    DECLARE finished INT DEFAULT 0;
    DECLARE emp_name VARCHAR(30);

    DECLARE emp_cursor CURSOR FOR
        SELECT name FROM employees;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

    OPEN emp_cursor;

    read_loop: LOOP
        FETCH emp_cursor INTO emp_name;

        IF finished = 1 THEN
            LEAVE read_loop;
        END IF;

        SELECT emp_name;
    END LOOP;

    CLOSE emp_cursor;
END //

DELIMITER ;

CALL show_employee_names();
