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