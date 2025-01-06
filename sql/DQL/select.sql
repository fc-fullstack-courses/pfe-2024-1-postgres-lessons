-- команда для отримання даних з БД
/*
  SELECT список_виборки FROM табличний_вираз

  список_виборки -  список стовпчиків дані з яких треба повернути у результаті
                    може складати як з існуючих стовпчиків так і з якихсь стовпчиків
                    які будуть розраховані чисто для цього запиту

  табличний_вираз - таблиця або більш складна клнструкція з декілької таблиць

  Селект сам по собі повертає як результат табличний вираз
*/
-- -- @block
-- SELECT random();
-- @block повернути всі записи з конкретної таблиці
SELECT * FROM users;
-- @block повернути дані щі стовпчиків id, email, is_male, birthday
SELECT id, email, is_male, birthday FROM users;
-- @block порвернути стовпчик id та новий стовпчик у якому буде ім'я прізвище користувача
SELECT id, first_name || ' ' || last_name full_name FROM users;
-- @block повернути дані зі стовпчика account_balance але при цьому перейменувати його
SELECT id, email, account_balance AS "accountBalance" FROM users;
-- @block або
SELECT id айдішнік, email пошта, account_balance "accountBalance" FROM users;
-- WHERE
-- @block усі користувачі з висотою 1.75
SELECT * FROM users
WHERE height = 1.75;
-- @block всі користувачі які не вказали дату народження
SELECT * FROM users
WHERE birthday IS NULL;
-- @block знайти всіх чоловіків
SELECT * FROM users
WHERE is_male;
-- @block знайти всіх жінок
SELECT * FROM users
WHERE NOT is_male;
-- @block всі користувачі з балансом від 500 до 4000
SELECT * FROM users
WHERE account_balance >= 500 AND account_balance <= 4000;
-- @block всі користувачі з балансом від 500 до 4000
SELECT * FROM users
WHERE account_balance BETWEEN 500 AND 4000;