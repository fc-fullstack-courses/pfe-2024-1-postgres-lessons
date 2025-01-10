-- Нормальна форма Бойса-Кодда (BCNF)
/*
  атрибут первинного ключа не має залежати від неключового атрибута

  існують студенти викладачі та дисципліни

    студенти вивчають багато дисциплін
    на одну дисципліну ходять багато студентів

    у одної дисципліни може бути декілька викладачей
    викладач викладає тількі одну дисципліну

    у студентів багато викладачей
    у виклада багато студентів

    students : subjects (n : m)
    subjects : teachers (n : 1)
    students : teachers (n : m)
*/
-- @block відношення не у BCNF
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name TEXT,
);
--
CREATE TABLE teachers (
  id SERIAL PRIMARY KEY,
  name TEXT,
);
--
CREATE TABLE students_to_teachers_to_subjects (
  student_id INT REFERENCES students,
  teacher_id INT REFERENCES teachers,
  "subject" TEXT,
  PRIMARY KEY (teacher_id, student_id)
);
--
INSERT INTO students_to_teachers_to_subjects
(student_id, teacher_id, "subject" ) VALUES
(1, 1, 'biology'),
(2, 1, 'biology'),
(1, 2, 'math'),
(2, 2, 'physics');
-- @block відношення у BCNF
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name TEXT
);
--
CREATE TABLE subjects (
  id SERIAL PRIMARY KEY,
  name TEXT
);
--
CREATE TABLE teachers (
  id SERIAL PRIMARY KEY,
  subject_id INT REFERENCES subjects,
  name TEXT
);
--
CREATE TABLE students_to_teachers (
  student_id INT REFERENCES students,
  teacher_id INT REFERENCES teachers,
  PRIMARY KEY (teacher_id, student_id)
);
--
CREATE TABLE students_to_subjects (
  student_id INT REFERENCES students,
  subject_id INT REFERENCES subjects,
  PRIMARY KEY (teacher_id, subject_id)
);