USE `csa exp`;

DELIMITER //

CREATE FUNCTION customer_level(mark INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    IF mark >= 80 THEN
        RETURN 'High';
    ELSE
        RETURN 'Low';
    END IF;
END //

DELIMITER ;

SELECT customer_level(90);
SELECT customer_level(65);
