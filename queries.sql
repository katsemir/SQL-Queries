-- 1. Відобразити прізвища та імена всіх працівників
SELECT last_name, first_name FROM workers;

-- 2. Відобразити назви товарів та вартість 10 їх одиниць з урахуванням знижки 50% на одну одиницю
SELECT name, (price * 9 + price * 0.5) AS discounted_price FROM goods;

-- 3. Відобразити товари в алфавітному порядку їх назв
SELECT * FROM goods ORDER BY name ASC;

-- 4. Відобразити працівників в алфавітному порядку категорій та у зворотному порядку номерів паспортів
SELECT * FROM workers ORDER BY qualification ASC, passport_no DESC;