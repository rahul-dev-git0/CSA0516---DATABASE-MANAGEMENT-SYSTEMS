USE `csa exp`;

CREATE TABLE student_info (
    id INT PRIMARY KEY,
    name VARCHAR(30),
    mark INT
);

INSERT INTO student_info VALUES
(1, 'Rahul', 85),
(2, 'Arun', 78),
(3, 'Kiran', 90);

DELIMITER //

CREATE PROCEDURE get_students()
BEGIN
    SELECT * FROM student_info;
END //

DELIMITER ;

CALL get_students();
