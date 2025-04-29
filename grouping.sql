-- 1. Список назв товарів через кому для кожного виробника
SELECT m.name AS manufacturer, GROUP_CONCAT(g.name, ', ') AS products
FROM goods g
JOIN manufacturers m ON g.manufacturer_code = m.code
GROUP BY m.name;

-- 2. Кількість товарів ціною менше 20 грн для кожного виробника
SELECT m.name AS manufacturer, COUNT(*) AS cheap_goods_count
FROM goods g
JOIN manufacturers m ON g.manufacturer_code = m.code
WHERE g.price < 20
GROUP BY m.name;

-- 3. Середня ціна всіх товарів
SELECT AVG(price) AS average_price
FROM goods;

-- 4. Виробники, що виготовляють більше одного товару ціною менше 20 грн
SELECT m.name AS manufacturer, COUNT(*) AS cheap_goods_count
FROM goods g
JOIN manufacturers m ON g.manufacturer_code = m.code
WHERE g.price < 20
GROUP BY m.name
HAVING COUNT(*) > 1;
