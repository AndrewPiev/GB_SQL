SELECT ProductName, Manufacturer, Price
FROM phones.new_table
WHERE ProductCount > 2;

SELECT *
FROM phones.new_table
WHERE Manufacturer = "Samsung";

SELECT *
FROM phones.new_table
WHERE ProductName LIKE '%iPhone%';

SELECT *
FROM phones.new_table
WHERE Manufacturer LIKE '%Samsung%';

SELECT *
FROM phones.new_table
WHERE ProductName LIKE '%8%';

select * from phones.new_table;
