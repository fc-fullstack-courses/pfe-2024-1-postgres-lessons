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
-- Сортування результатів
/*
  ORDER BY стовпчик_по_якому_сортувати напрям_сортування

  напрями:
    ASC - по зростанню (за замовчанням)
    DESC - по спаданню
*/
-- @block сортування по айдішніку по зростанню
SELECT * FROM users
ORDER BY id ASC;
-- @block сортування по айдішніку по зростанню
SELECT * FROM users
ORDER BY id;
-- @block сортування по балансу акканту по спаданню і по висоті по зростанню
SELECT * FROM users
ORDER BY account_balance DESC, height ASC;
-- @block
SELECT * FROM users
ORDER BY email ASC;
-- @block
SELECT * FROM users
ORDER BY birthday ASC;
-- пагінація
/*
  LIMIT число - вказує скільки результатів має повернути селект (results)
  OFFSET число - вказує скільки результатів треба пропустити (+- page)
*/
-- @block повернути одного користувача
SELECT * FROM users
ORDER BY id ASC
-- після сортування якщо воно є
LIMIT 1
OFFSET 2;
-- @block мінімальний зріст користувача
SELECT height FROM users
ORDER BY height ASC
LIMIT 1;
-- @block максимальний зріст користувача
SELECT height FROM users
ORDER BY height DESC
LIMIT 1;
-- @block середній зріст користувачів
???
/*
  агрегатні функції - фуннкціі які з багатьох значеть отримують 1 результат

    avg - середне значення
    min - мінмальне значення
    max - максимальн значення
    sum - сума вхідних значень / виразів. (аналог reduce у js)
    count - рахує кількість кортежів / рядків у запиті
*/
-- @block мінімальний зріст користувача
SELECT min(height) FROM users;
-- @block середній зріст користувачів
SELECT avg(height) FROM users;
-- @block максимальний зріст користувача
SELECT max(height) FROM users;
-- @block загальна кількість грошей не всіх акаунтах
SELECT sum(account_balance) "всього грошей" FROM users;
-- @block скільки користувачів мають певне ім'я
SELECT count(*) FROM users
WHERE first_name = 'Kuzman';