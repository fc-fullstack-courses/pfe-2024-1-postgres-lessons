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
(account_balance, first_name, last_name, email, is_male, height, birthday)
VALUES
(5000, 'Jane', 'Tcepes', 'email@email.com', true, 1.75, '2001-12-5');
-- (5000, NULL, NULL, NULL, NULL, NULL);
-- @block
INSERT INTO users
(first_name, last_name, email, account_balance, is_male, birthday, height)
VALUES
('Jane2', 'Smith', 'jd2@mail.com', 99999.99, false, '2000-12-12', 1.5),
('Test2', 'Test', 'test1@gmail.com', 0.99, true, '1999-01-01', 2),
('Admin2', 'Moder', 'admoder1@gmail.com',1, true, '2000-12-12', 1.33);
