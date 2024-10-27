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
INSERT INTO petEvent SET petname='Fluffy', eventdate='2020-10-15',
eventtype='vet', remark='antibiotics';
INSERT INTO petPet SET petname='Hammy', owner='Diane', gender = 'M', birth='2010-10-30';
INSERT INTO petEvent SET petname='Hammy', eventdate='2020-10-15',
eventtype='vet', remark='antibiotics';
UPDATE petEvent SET petname='Claws' WHERE eventdate = '1997-08-03';
UPDATE petPet SET death='2020-09-01' WHERE petname = 'Puffball';
DELETE FROM petPet, petEvent WHERE owner='Harold' AND species='dog';