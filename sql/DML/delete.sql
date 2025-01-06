-- видалення записів з таблиць
-- видалити всі записи з таблиці
-- @block
DELETE FROM users;
-- видалення конкретного користувача по його ключу
-- @block по id
DELETE FROM users
WHERE id = 6;
-- @block видалення всіх користувачів які народилися до 5 грудня 2001 року
DELETE FROM users
WHERE birthday < '2001-12-5'
-- повернути знчення з конкретних стовпчиків
RETURNING id, first_name, last_name, email;