-- Commande pour créer un utilisateur
CREATE USER doyen;
CREATE USER saff;
CREATE USER admin;
-- -- Commande pour créer la table staff

CREATE TABLE IF NOT EXISTS staff (
    staff_no SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR (50) NOT NULL
);

-- -- Commande pour créer la table student

CREATE TABLE IF NOT EXISTS student (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    registered BOOLEAN NOT NULL,
    region VARCHAR (50) NOT NULL,
    staff_no INT REFERENCES staff (staff_no)
);

-- -- Commande pour créer la table course

CREATE TABLE IF NOT EXISTS course (
    cours_code SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    credit INT NOT NULL,
    quota INT NOT NULL,
    staff_no INT REFERENCES staff (staff_no)
);

-- -- Commande pour créer la table enrollement

CREATE TABLE IF NOT EXISTS enrollement (
    date_enrolled DATE DEFAULT CURRENT_DATE,
    final_grade INT NOT NULL,
    student_id INT REFERENCES student (student_id),
    cours_code INT REFERENCES course (cours_code),
    PRIMARY KEY(student_id, cours_code)
);

-- -- Commande pour créer la table assigment

CREATE TABLE IF NOT EXISTS assigment (
    assigment_no INT,
    grade INT NOT NULL,
    student_id INT REFERENCES student (student_id),
    cours_code INT REFERENCES course (cours_code),
    PRIMARY KEY(assigment_no, student_id, cours_code)
);

-- -- Commande pour Insérer les données dans la table staff

INSERT INTO staff(name, region) VALUES ('PA', 'N-k');
INSERT INTO staff(name, region) VALUES ('P0', 'S-k');
INSERT INTO staff(name, region) VALUES ('PHD', 'N-k');
INSERT INTO staff(name, region) VALUES ('PA', 'S-k');
INSERT INTO staff(name, region) VALUES ('PE', 'Kin');

-- Commande pour Insérer les données dans la table student

INSERT INTO student(name, registered, region, staff_no) VALUES ('PHD', TRUE, 'N-k', 1);
INSERT INTO student(name, registered, region, staff_no) VALUES ('PO', FALSE, 'S-k', 2);
INSERT INTO student(name, registered, region, staff_no) VALUES ('PA', TRUE, 'Kin', 3);
INSERT INTO student(name, registered, region, staff_no) VALUES ('PA', TRUE, 'S-K',4);
INSERT INTO student(name, registered, region, staff_no) VALUES ('PA', FALSE, 'N-k',5);

-- Commande pour Insérer les données dans la table course

INSERT INTO course(title, credit, quota, staff_no) VALUES ('AI', 4, 20,1);
INSERT INTO course(title, credit, quota, staff_no) VALUES ('MATH INFO', 5, 15,2);
INSERT INTO course(title, credit, quota, staff_no) VALUES ('SECURITE INFO', 2, 20,3);
INSERT INTO course(title, credit, quota, staff_no) VALUES ('DIG DATA', 4, 20,4);
INSERT INTO course(title, credit, quota, staff_no) VALUES ('POO', 4, 30,5);

-- Commande pour Insérer les données dans la table enrollement

INSERT INTO enrollement(final_grade, student_id, cours_code) VALUES (5, 1, 2);
INSERT INTO enrollement(final_grade, student_id, cours_code) VALUES (5, 2, 1);
INSERT INTO enrollement(final_grade, student_id, cours_code) VALUES (5, 3, 3);
INSERT INTO enrollement(final_grade, student_id, cours_code) VALUES (5, 4, 5);
INSERT INTO enrollement(final_grade, student_id, cours_code) VALUES (5, 5, 4);

-- Commande pour Insérer les données dans la table assigment

INSERT INTO assigment(assigment_no, grade, student_id, cours_code) VALUES (1, 3, 1, 2);
INSERT INTO assigment(assigment_no, grade, student_id, cours_code) VALUES (2, 3, 2, 1);
INSERT INTO assigment(assigment_no, grade, student_id, cours_code) VALUES (3, 3, 3, 3);
INSERT INTO assigment(assigment_no, grade, student_id, cours_code) VALUES (4, 4, 4, 5);
INSERT INTO assigment(assigment_no, grade, student_id, cours_code) VALUES (5, 5, 4, 4);
