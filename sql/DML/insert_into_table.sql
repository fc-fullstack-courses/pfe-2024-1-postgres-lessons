-- INSERT INTO - команда для вставки записів у таблицю
-- вставка 1 запису
INSERT INTO users VALUES 
('John', 'Doe', 'jd@gmail.com', 9999.99, true, '2001-02-01');
-- вставка декількох записів
INSERT INTO users VALUES
('Jane', 'Smith', 'js@gmail.com', 99999.99, false, '2000-12-12'),
('Test', 'Test', 'test@gmail.com', 0.99, true, '2001-01-01'),
('Admin', 'Moder', 'admoder@gmail.com', -5000, true, '5000-12-12');
-- вставка даних у довільному порядку і у вказані стовпчики
-- @block 
INSERT INTO users
(account_balance, first_name, last_name, email, is_male)
VALUES
(5000, 'Jane', 'Tcepes', 'email@email.com', true);
-- (5000, NULL, NULL, NULL, NULL, NULL);
-- @block
INSERT INTO users
(first_name, last_name, email, account_balance, is_male, birthday, height)
VALUES
('Jane1', 'Smith', 'jd1@mail.com', 99999.99, false, '2000-12-12', 1.5),
('Test1', 'Test', 'test3@gmail.com', 0.99, true, '1999-01-01', 1),
('Admin1', 'Moder', 'admoder3@gmail.com',1, true, '2000-12-12', 2.99);
