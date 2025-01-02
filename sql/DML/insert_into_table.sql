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
INSERT INTO users
(account_balance, birthday, first_name, last_name, email, is_male)
VALUES
(5000, '1505-07-13', 'Vlad', 'Tcepes', 'email@email.com', true);
