# Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
DROP DATABASE IF EXISTS sem2;
CREATE DATABASE IF NOT EXISTS sem2;
CREATE TABLE `sem2`.`sales` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATE NOT NULL,
  `count_product` INT NOT NULL,
  PRIMARY KEY (`id`));
  
INSERT INTO `sem2`.`sales` (`order_date`, `count_product`) VALUES ('2022-01-01', '156');
INSERT INTO `sem2`.`sales` (`order_date`, `count_product`) VALUES ('2022-01-02', '180');
INSERT INTO `sem2`.`sales` (`order_date`, `count_product`) VALUES ('2022-01-03', '21');
INSERT INTO `sem2`.`sales` (`order_date`, `count_product`) VALUES ('2022-01-04', '124');
INSERT INTO `sem2`.`sales` (`order_date`, `count_product`) VALUES ('2022-01-05', '341');

# Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300 (функция IF).
SELECT id AS 'id заказа',
IF (count_product < 100, 'маленький заказ',
	IF (count_product BETWEEN 100 AND 300, 'средний заказ', 'большой заказ')
    ) AS 'Тип заказа'
FROM sem2.sales;

# Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
CREATE TABLE `sem2`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `employee_id` VARCHAR(5) NOT NULL,
  `amount` DECIMAL(5,2) NOT NULL,
  `order_status` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`));
  
INSERT INTO `sem2`.`orders` (`employee_id`, `amount`, `order_status`) VALUES ('e03', '15.00', 'OPEN');
INSERT INTO `sem2`.`orders` (`employee_id`, `amount`, `order_status`) VALUES ('e01', '22.50', 'OPEN');
INSERT INTO `sem2`.`orders` (`employee_id`, `amount`, `order_status`) VALUES ('e05', '100.70', 'CLOSED');
INSERT INTO `sem2`.`orders` (`employee_id`, `amount`, `order_status`) VALUES ('e02', '22.80', 'OPEN');
INSERT INTO `sem2`.`orders` (`employee_id`, `amount`, `order_status`) VALUES ('e04', '9.50', 'CANCELLED');

SELECT id AS 'номер заказа',
CASE 
		WHEN order_status = 'OPEN' THEN 'Order is in open state'
		WHEN order_status = 'CLOSED' THEN 'Order is closed'
		WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
		ELSE 'order status error'
END AS 'full_order_status'
FROM sem2.orders;

# Чем NULL отличается от 0? Ответ: NULL - это фактическое отсутсвие значения в ячейке, а 0 - может быть значением, причем различных типов (BOOL, INT, VARCHAR, пр.)