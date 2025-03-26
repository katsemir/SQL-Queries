-- 1. Всі можливі комбінації товарів та виробників
SELECT goods.name AS товар, manufacturers.name AS виробник
FROM goods
JOIN manufacturers ON goods.manufacturer_code = manufacturers.code;

-- 2. Пари колег (працівники, що мають одного начальника)
SELECT w1.first_name || ' ' || w1.last_name AS працівник1,
       w2.first_name || ' ' || w2.last_name AS працівник2,
       w1.chief AS начальник
FROM workers w1
JOIN workers w2 ON w1.chief = w2.chief AND w1.passport_no < w2.passport_no
WHERE w1.chief IS NOT NULL;

-- 3. Дані про виробника кожного товару
SELECT goods.name AS товар, manufacturers.name AS виробник, manufacturers.address AS адреса
FROM goods
JOIN manufacturers ON goods.manufacturer_code = manufacturers.code;

-- 4. Подружні пари серед працівників
SELECT h.first_name || ' ' || h.last_name AS чоловік,
       w.first_name || ' ' || w.last_name AS дружина
FROM marriage
JOIN workers h ON marriage.husband_passport_no = h.passport_no
JOIN workers w ON marriage.wife_passport_no = w.passport_no;

-- 5. Які товари на яких складах зберігаються
SELECT goods.name AS товар, warehouses.name AS склад, holds.amount AS кількість
FROM holds
JOIN goods ON holds.goods_code = goods.code
JOIN warehouses ON holds.warehouse_code = warehouses.code;

-- 6. Для кожного складу відобразити ПІБ його керівника
SELECT warehouses.name AS склад,
       workers.first_name || ' ' || workers.last_name AS керівник
FROM warehouses
JOIN workers ON warehouses.chief_passport_no = workers.passport_no;

-- 7. Товари, що наявні в кількості принаймні 15 одиниць на одному зі складів
SELECT DISTINCT goods.name AS товар
FROM holds
JOIN goods ON holds.goods_code = goods.code
WHERE holds.amount >= 15;

-- 8. Вся інформація про товари, які зберігаються на складах супермаркетів
SELECT goods.*
FROM goods
JOIN holds ON goods.code = holds.goods_code;

-- 9. Вся інформація про товари, які НЕ зберігаються на складах супермаркетів
SELECT goods.*
FROM goods
WHERE goods.code NOT IN (SELECT goods_code FROM holds);

-- 10. Вся інформація про неодружених працівників
SELECT workers.*
FROM workers
WHERE workers.passport_no NOT IN (
    SELECT husband_passport_no FROM marriage
    UNION
    SELECT wife_passport_no FROM marriage
);

-- 11. Вся інформація про працівників, які НЕ керують складами
SELECT workers.*
FROM workers
WHERE workers.passport_no NOT IN (
    SELECT chief_passport_no FROM warehouses
);