-- оновлення записів у таблиці
-- @block змінити всім користувачам прізвище на Baker
UPDATE users
SET last_name = 'Baker';
-- @block змінити конкретному користувачу ім'я на Adam
UPDATE users
SET first_name = 'Adam'
WHERE email = 'test1@gmail.com';
-- зміна декілької стовпчиків одразу
-- @block змінити ім'я прізвищу та поле updated_at користувача
UPDATE users
SET first_name = 'Eduardo', last_name = 'Santiago', updated_at = current_timestamp
WHERE id = 11;
-- @block встановити баланс у 1500 9 та 11 користувачу
UPDATE users
SET account_balance = 1500, updated_at = current_timestamp
WHERE id = 11 OR id = 9;
-- @block
UPDATE users
SET account_balance = 2500, updated_at = current_timestamp
WHERE id IN (9, 10, 11);
-- @block
UPDATE users
SET is_male = TRUE
WHERE id % 2 = 0;
-- оновлення даних на основі старих даних
-- @block збільшити висоту 10 юзера на 5 сантиметрів
UPDATE users
SET height = height + 0.05
WHERE id = 10;