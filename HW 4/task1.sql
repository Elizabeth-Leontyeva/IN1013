
CREATE TABLE petPet (
petname CHAR(20) NOT NULL PRIMARY KEY,
owner VARCHAR(45),
species VARCHAR(45),
gender ENUM('F', 'M'),
birth DATE,
death DATE
);
CREATE TABLE petEvent (
petname CHAR(20),
FOREIGN KEY (petname) REFERENCES petPet(petname),
eventdate DATE,
eventtype VARCHAR(15),
remark VARCHAR(255)
);
