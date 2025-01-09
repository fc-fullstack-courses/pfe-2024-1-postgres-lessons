/*
  Види зв'язків сутностей у БД:

    1 : 1 - один до одного 
      ( у 1 країни є 1 прапор, у 1 прапора 1 країна )
      ( 1 користувачу відповідає 1 запис даних куристувача, 1 запис кори стувача налехить 1 користувачу)
    
    1 : m - один до багатох
      (в одній групі багато студентів, у 1 студента буде 1 група)
      (у книжки один автор, у автора книжок багато)

    n : m - багато до багатьох
      (в одному чаті багато людей, конкретний користувач теж має багато чатів)
      (в обному замовленні може бути багато товарів, товар може знаходитися в багатьох замовленнях)

    По жорсткості зв'язку (по обов'язковості)
      Жорсткі - запис обо'вязково пов'язаний з записом у іншій таблиці (1)
      Нежорсткі - запис необо'вязково пов'язаний з записом у іншій таблиці (0)

    По кількості таблиць у зв'язку:
      унарні звязки (запис з таблиці посилається на інший запис з цієї ж таблиці)
      бінарний зв'язок (дві даблиці у зв'язку)
      тернарний зв'язок
      ...
*/
-- @block 1 : m
CREATE TABLE IF NOT EXISTS users(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(64) NOT NULL CHECK (first_name != ''),
  last_name VARCHAR(64) NOT NULL,
  email VARCHAR(256) NOT NULL 
  CONSTRAINT "email must be unique" UNIQUE 
  CONSTRAINT "not empty email" CHECK (email != ''),
  account_balance NUMERIC(11,2) DEFAULT 0.00 CHECK (account_balance >= 0),-- число
  height NUMERIC(3,2) NOT NULL CHECK(height >= 0.5 AND height <= 3),
  is_male BOOLEAN,
  birthday DATE CHECK (birthday > '1890-01-01' AND birthday <= current_date), -- дата
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  CONSTRAINT "only unique combination of first and last name allowed" UNIQUE (first_name, last_name),
  CHECK (last_name != '')
);
-- 
CREATE TABLE IF NOT EXISTS orders(
  id SERIAL PRIMARY KEY,
  -- user_id INT NOT NULL REFERENCES users (id), 
  user_id INT NOT NULL REFERENCES users, 
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);
