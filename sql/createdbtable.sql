CREATE TABLE user_roles(
    id AUTOINCREMENT PRIMARY KEY,
    name VARCHAR (50),
    label VARCHAR (50)
);
CREATE TABLE user(
    id AUTOINCREMENT,
    email VARCHAR (50),
    name VARCHAR (50),
    lastname VARCHAR (50),
    role_id INT,
    FOREIGN KEY (role_id)  REFERENCES user_roles(id)
);
CREATE TABLE veterinary_report (
    id AUTOINCREMENT PRIMARY KEY,
    date_repport DATE NOT NULL,
    detail VARCHAR (50) NOT NULL
);
CREATE TABLE animal (
    id AUTOINCREMENT PRIMARY KEY,
    name VARCHAR (50) NOT NULL,
    conditiion VARCHAR (50) NOT NULL
);

CREATE TABLE race (
    id AUTOINCREMENT PRIMARY KEY,
    label VARCHAR (50) NOT NULL
);
CREATE TABLE habitat (
    id AUTOINCREMENT PRIMARY KEY,
    name VARCHAR (50) NOT NULL,
    description VARCHAR (50) NOT NULL
);
CREATE TABLE avis (
    id AUTOINCREMENT PRIMARY KEY,
    pseudo VARCHAR (50) NOT NULL,
    comment VARCHAR (50) NOT NULL,
    isVisible YESNO  NOT NULL
);
ALTER TABLE veterinary_report
ADD animal_id INT NOT NULL,
FOREIGN KEY (animal_id)  REFERENCES animal(id);
