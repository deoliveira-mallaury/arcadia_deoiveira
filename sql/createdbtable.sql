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
    description VARCHAR (50) NOT NULL,
    habitat_comment VARCHAR (50) NOT NULL
);
CREATE TABLE avis (
    id AUTOINCREMENT PRIMARY KEY,
    pseudo VARCHAR (50) NOT NULL,
    comment VARCHAR (50) NOT NULL,
    isVisible YESNO  NOT NULL
);
CREATE TABLE service (
    id AUTOINCREMENT PRIMARY KEY,
    name VARCHAR (50) NOT NULL,
    description VARCHAR (50) NOT NULL
);
ALTER TABLE veterinary_report
    ADD animal_id INT NOT NULL,
    ADD FOREIGN KEY (animal_id)  REFERENCES animal(id);

ALTER TABLE user
    ADD vet_report_id INT NOT NULL,
    ADD FOREIGN KEY (vet_report_id) REFERENCES veterinary_report(id);

ALTER TABLE animal
    ADD habitat_id INT NOT NULL,
    ADD race_id INT NOT NULL,
    ADD FOREIGN KEY (habitat_id) REFERENCES habitat(id),
    ADD FOREIGN KEY (race_id) REFERENCES race(id);
