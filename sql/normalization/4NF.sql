-- 4 нормальна форма
/*
  є три сутності 
    ресторани
    іжа
    райони міста

  ресторани готують певні блюда
  служба доставки може діставляти їжу з ресторанів у певні райони міста

*/
-- @block не у 4 НФ
CREATE TABLE restoraunts (
  id SERIAL PRIMARY KEY,
  name TEXT,
  address TEXT
);
--
CREATE TABLE food_types (
  id SERIAL PRIMARY KEY,
  name TEXT,
  price NUMERIC
);
--
CREATE TABLE delivery (
  restoraunt_id INT REFERENCES restoraunts,
  food_id INT REFERENCES food_types,
  delivery_location TEXT,
  PRIMARY KEY (restoraunt_id, food_id, delivery_location)
);
--
INSERT INTO delivery 
VALUES
(1, 1, 'District 1'),
(1, 1, 'District 2'),
(1, 1, 'District 3'),
(1, 1, 'District 4'),
(1, 2, 'District 1'),
(1, 2, 'District 2'),
(1, 2, 'District 3'),
(1, 2, 'District 4'),
(2, 1,  'District 1'),
(2, 1,  'District 2'),
(2, 1,  'District 4');
-- @block 4 НФ
CREATE TABLE restoraunts (
  id SERIAL PRIMARY KEY,
  name TEXT,
  address TEXT
);
--
CREATE TABLE food_types (
  id SERIAL PRIMARY KEY,
  name TEXT,
  price NUMERIC
);
--
CREATE TABLE delivery_locations (
  id SERIAL PRIMARY KEY,
  elivery_location TEXT
);
--
CREATE TABLE restoraunts_to_foods (
  restoraunt_id INT REFERENCES restoraunts,
  food_id INT REFERENCES food_types,
  PRIMARY KEY (restoraunt_id, food_id)
);
--
CREATE TABLE restoraunts_to_locations (
  restoraunt_id INT REFERENCES restoraunts,
  location_id INT REFERENCES delivery_locations,
  PRIMARY KEY (restoraunt_id, location_id)
);
--
INSERT INTO restoraunts_to_foods
VALUES
(1, 1),
(1, 2),
(2, 1);
--
INSERT INTO restoraunts_to_locations
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 4);
--
INSERT INTO restoraunts
(name, address)
VALUES
('Пузата Хата', 'addr 1'),
('tratoria', 'addr 2');
--
INSERT INTO food_types
(name, price)
VALUES
('Борщ', 70),
('Макарони', 50);
--
INSERT INTO delivery_locations
(elivery_location)
VALUES
('District 1'),
('District 2'),
('District 3'),
('District 4');