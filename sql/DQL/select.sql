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
-- @block кількісь чоловіків
SELECT count(height) FROM users
WHERE is_male = TRUE;
-- @block середній зріст чоловіків
SELECT avg(height), id  FROM users
WHERE is_male = TRUE;
-- @block середній зріст жінок
SELECT avg(height) FROM users
WHERE is_male = FALSE;
-- @block середній зріст і чоловіків і жінок у одному запиті
SELECT avg(height), min(height), is_male FROM users
GROUP BY is_male;
-- группування
-- @block всі унікальні значення висоти
SELECT height FROM users
GROUP BY height;
/*
  1. мінімальний баланс чоловіків

  2. мінімальний, максимальний і середній баланс жінок

  3. кількість людей які народилися у певну дату

  4. кількість чоловіків і жінок баланс яких більше за 3000
*/

-- @block 1. мінімальний баланс чоловіків
SELECT min(account_balance) "balance" FROM users
WHERE is_male;

-- @block 2. мінімальний, максимальний і середній баланс жінок
SELECT min(account_balance), avg(account_balance), max(account_balance) FROM users
WHERE NOT is_male;
-- @block 3. кількість людей які народилися у певну дату
SELECT count(*) FROM users
WHERE birthday = '1946-06-20';
-- @block 4. кількість чоловіків і жінок баланс яких більше за 3000
SELECT count(*), is_male FROM users
WHERE account_balance > 3000
GROUP BY is_male;
-- @block вивести кількість записів у таблиці для кожного імені
SELECT count(id) "кількість імен", first_name FROM users
GROUP BY first_name;
-- @block вивести кількість записів у таблиці для кожного імені якщо цих записів більше ніж 1
SELECT count(id) "кількість імен", first_name FROM users
-- WHERE count(id) > 1 -- не спрацюєб агрегатні функції запускаються після WHERE
GROUP BY first_name
-- HAVING -  аналог WHERE який фільтрує результати группування та агреграцій
HAVING count(id) > 1;
-- Підзапити
SELECT avg(weight) FROM users;
-- показати всіх користувачів, вага яких меньша за середню
SELECT * FROM users
WHERE weight < 86.6400000000000000;
--
SELECT * FROM users
WHERE weight < (SELECT avg(weight) FROM users); -- використання скалярного підзапиту для знаходження середньої ваги
-- показати ім'я, прізвище, емейл, вік та дату нарождення корстувачів які старші за 40 років
SELECT first_name, last_name, email, extract(year from age(birthday)) "age", birthday
FROM users
WHERE extract(year from age(birthday)) > 50;
--
SELECT first_name, last_name, email, users_with_age.age, birthday, id
FROM (
  SELECT id, first_name, last_name, email, extract(year from age(birthday)) "age", birthday
  FROM users
) users_with_age
WHERE users_with_age.age > 50;