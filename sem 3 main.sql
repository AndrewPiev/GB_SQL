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

/*

Выведите все записи, отсортированные по полю "age" по возрастанию


Выведите все записи, отсортированные по полю “firstname"


Выведите записи полей "firstname ", “lastname", "age", отсортированные по полю "firstname " в алфавитном порядке по убыванию


Выполните сортировку по полям " firstname " и "age" по убыванию


1. Выведите уникальные (неповторяющиеся) значения полей "firstname"

2. Отсортируйте записи по возрастанию значений поля "id". Выведите первые   две записи данной выборки

3. Отсортируйте записи по возрастанию значений поля "id". Пропустите первые 4 строки данной выборки и извлеките следующие 3

4. Отсортируйте записи по убыванию поля "id". Пропустите две строки данной выборки и извлеките следующие за ними 3 строки

*/
# если глючит группировка:

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT COUNT(salary) AS 'Кол-во сотрудников',
GROUP_CONCAT(lastname) AS 'Имена сотрудников',
post,
MAX(salary) AS "Максимальная зарплата",
MIN(salary) AS "Минимальная зарплата",
MAX(salary) - MIN(salary) AS "Разница между минимальной и максимальной зарплатой"
FROM staff
GROUP BY post;