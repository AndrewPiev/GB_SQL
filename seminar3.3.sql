DROP DATABASE IF EXISTS lesson3;
CREATE DATABASE IF NOT EXISTS lesson3;

USE lesson3;

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff`
(`id` INT PRIMARY KEY AUTO_INCREMENT,
`firstname` VARCHAR(45),
`lastname` VARCHAR(45),
`post` VARCHAR(45),
`seniority` INT,
`salary` INT,
`age` INT
);

INSERT INTO `staff` (`firstname`, `lastname`, `post`,`seniority`,`salary`, `age`)
VALUES
('Вася', 'Васькин', 'Начальник', 40, 100000, 60), 
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);


DROP TABLE IF EXISTS `activity_staff`;
CREATE TABLE IF NOT EXISTS `activity_staff`
(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`staff_id` INT,
FOREIGN KEY(staff_id) REFERENCES staff(id),
`date_activity` DATE,
`count_pages` INT
);


INSERT activity_staff (`staff_id`, `date_activity`, `count_pages`)
VALUES
(1,'2022-01-01',250),
(2,'2022-01-01',220),
(3,'2022-01-01',170),
(1,'2022-01-02',100),
(2,'2022-01-01',220),
(3,'2022-01-01',300),
(7,'2022-01-01',350),
(1,'2022-01-03',168),
(2,'2022-01-03',62),
(3,'2022-01-03',84);


SELECT *
FROM `staff`;

SELECT AVG(salary) AS 'Средняя зарплата по фирме'
FROM staff;

SELECT *
FROM staff
WHERE salary > 38500;

SELECT *
FROM staff
WHERE salary > (SELECT AVG(salary) FROM staff);


SELECT *
FROM staff
ORDER BY salary; -- ORDER BY salary ASC - от меньшего к большему, ORDER BY salary DESC


SELECT *
FROM staff
WHERE seniority > 5 AND post = "Рабочий"
ORDER BY salary DESC;


-- Найдем кол-во уникальных фамилий
SELECT COUNT(DISTINCT lastname) AS 'Уникальные фамилии кол-во'
FROM staff;

-- Найдем кол-во неуникальных фамилий
SELECT COUNT(lastname) - COUNT(DISTINCT lastname) AS 'Неуникальные фамилии кол-во'
FROM staff;

SELECT *
FROM staff;

SELECT *
FROM staff
LIMIT 5; -- От первой строки до пятой

SELECT *
FROM staff
LIMIT 3, 9; -- Пропускаем 3 строки и выводим следующие 9 строк


SELECT salary, lastname, post,
MAX(salary) AS "Максимальная зарплата",
MIN(salary) AS "Минимальная зарплата",
MAX(salary) - MIN(salary) AS "Разница между минимальной и максимальной зарплатой"
FROM staff
GROUP BY post;


SELECT COUNT(salary) AS 'Кол-во сотрудников',
GROUP_CONCAT(lastname) AS 'Имена сотрудников',
post,
MAX(salary) AS "Максимальная зарплата",
MIN(salary) AS "Минимальная зарплата",
MAX(salary) - MIN(salary) AS "Разница между минимальной и максимальной зарплатой"
FROM staff
GROUP BY post;


   SELECT  name_age, SUM(salary)
   FROM 
	(SELECT salary,
		CASE 
			WHEN age < 20 THEN 'Младше 20 лет'
			WHEN age between 20 AND 40 THEN 'от 20 до 40 лет'
			WHEN age > 40 THEN 'Старше 40 лет'
			ELSE 'Не определено'
		END AS name_age 
	FROM staff ) AS list
   GROUP BY name_age;  


SELECT salary,
		CASE 
			WHEN age < 20 THEN 'Младше 20 лет'
			WHEN age between 20 AND 40 THEN 'от 20 до 40 лет'
			WHEN age > 40 THEN 'Старше 40 лет'
			ELSE 'Не определено'
		END AS name_age 
	FROM staff;

SELECT GROUP_CONCAT(lastname), salary
FROM staff
GROUP BY salary
HAVING salary > 50000;



SELECT GROUP_CONCAT(lastname), salary
FROM staff
WHERE salary > 50000; -- WHERE = HAVING


SELECT post, AVG(salary)
FROM staff
WHERE post != 'Инженер'
GROUP BY post
HAVING AVG(salary) > 50000;