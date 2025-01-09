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
-- @block n : m
-- робиться за допомогою "зв'язувальної таблиці"
CREATE TABLE IF NOT EXISTS products(
  id SERIAL PRIMARY KEY,
  "name" VARCHAR(100),
  price NUMERIC(9,2) NOT NULL CHECK (price >= 0),
  quantity INT NOT NULL CHECK (quantity >= 0),
  category VARCHAR(100) NOT NULL CHECK (category != ''),
  is_for_adult BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);
-- зв`язувальна таблиця
CREATE TABLE IF NOT EXISTS products_to_orders (
  product_id INT NOT NULL REFERENCES products,
  order_id INT NOT NULL REFERENCES orders,
  quantity INT, 
  PRIMARY KEY (product_id, order_id)
);
-- @block 0 : 1 ( нежорстка версія)
CREATE TABLE IF NOT EXISTS country_1 (
  id SERIAL PRIMARY KEY,
  -- anthem_id INT UNIQUE REFERENCES anthem_1,
  "name" TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);
--
CREATE TABLE IF NOT EXISTS anthem_1 (
  id SERIAL PRIMARY KEY,
  country_id INT NOT NULL UNIQUE REFERENCES country_1,
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);
--
ALTER TABLE country_1
ADD COLUMN anthem_id INT UNIQUE REFERENCES anthem_1;
-- @block 1 : 1 (жорстка версія)
CREATE TABLE IF NOT EXISTS country_2 (
  id SERIAL PRIMARY KEY,
  -- anthem_id INT UNIQUE REFERENCES anthem_1,
  "name" TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);
--
CREATE TABLE IF NOT EXISTS anthem_2 (
  id SERIAL PRIMARY KEY,
  country_id INT NOT NULL UNIQUE REFERENCES country_2,
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);
--
ALTER TABLE country_2
ADD COLUMN anthem_id INT NOT NULL UNIQUE REFERENCES anthem_2;-- @block вставка даних
INSERT INTO users (
    id,
    first_name,
    last_name,
    email,
    account_balance,
    height,
    is_male,
    birthday
  )
VALUES (
    100000,
    'Buyer',
    'Byerenko',
    'buyer@gmail.com',
    150000000,
    1.88,
    false,
    '1989-05-05'
  );
-- 
INSERT INTO products (
    name,
    price,
    quantity,
    category,
    is_for_adult
  )
VALUES 
('Phone Super', 5000, 500, 'phones',false),
('GigaBrush', 150, 99999999, 'bathroom',false),
('Mega TV', 50000, 41582525, 'electronics', false),
('Rum', 3000, 145000, 'alcohol', true);
-- 1 : m
INSERT INTO orders (user_id)
VALUES (100000),
(208),
(208),
(210),
(208);
-- n : m
INSERT INTO products_to_orders (order_id, product_id, quantity)
VALUES 
(1, 1, 1),
(2, 2, 5),
(2, 4, 10),
(3, 1, 2);
-- error
INSERT INTO products_to_orders (order_id, product_id, quantity)
VALUES (NULL, 500000, 200);
-- @block 0 : 1
INSERT INTO country_1 ("name")
VALUES ('Країна 1'), ('Країна 2');
--
INSERT INTO anthem_1 (country_id)
VALUES (1), (2);
--
UPDATE country_1
SET anthem_id = 1 WHERE id = 1; 
UPDATE country_1
SET anthem_id = 2 WHERE id = 2; 
