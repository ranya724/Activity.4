CREATE DATABASE veterinary;

CREATE TABLE owners(
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE animals (
    animalid INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);

CREATE TABLE appointments (
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid)
);

CREATE TABLE doctors (
    doctorid INT PRIMARY KEY AUTO_INCREMENT,
    dfirstname VARCHAR(50) NOT NULL,
    dlastname VARCHAR(50) NOT NULL,
    specialty VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE invoices (
    invoiceid INT PRIMARY KEY,
    appointid INT,
    totalamount DECIMAL(10,2),
    paymenttime TIME,
    FOREIGN KEY (appointid) REFERENCES appointments(appointid)
);

CREATE TABLE medicalrecords (
    recordid INT PRIMARY KEY,
    animalid INT,
    recorddate DATETIME,
    doctorid INT,
    diagnosis VARCHAR(255),
    prescription VARCHAR(255),
    notes TEXT,
    FOREIGN KEY (animalid) REFERENCES animals(animalid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);

INSERT INTO owners(ownerid, ofirstname, olastname, address, phone, email)
VALUES
(1, 'Maria', 'Lopez', '123 Elm St', '09123456789', 'maria@example.com'),
(2, 'John', 'Reyes', '456 Pine St', '09998887777', 'john@example.com'),
(3, 'Anna', 'Dela Cruz', '789 Oak St', '09223334444', 'anna@example.com'),
(4, 'Paul', 'Santos', '321 Cedar St', '09117778888', 'paul@example.com'),
(5, 'Mark', 'Torres', '654 Maple St', '09995556666', 'mark@example.com'),
(6, 'Jenny', 'Flores', '987 Birch St', '09334445555', 'jenny@example.com'),
(7, 'David', 'Castro', '246 Walnut St', '09445556666', 'david@example.com'),
(8, 'Sarah', 'Garcia', '135 Aspen St', '09224446666', 'sarah@example.com'),
(9, 'Luke', 'Gomez', '864 Redwood St', '09994443322', 'luke@example.com'),
(10, 'Ella', 'Ramos', '753 Spruce St', '09123334455', 'ella@example.com');

INSERT INTO animals(animalid, name, species, breed, dateofbirth, gender, color, ownerid)
VALUES
(1, 'Simba', 'Cat', 'Persian', '2021-05-10', 'Male', 'Orange', 1),
(2, 'Whiskers', 'Cat', 'Siamese', '2020-02-14', 'Female', 2),
(3, 'Buddy', 'Dog', 'Labrador', '2019-09-01', 'Male', 3),
(4, 'Bella', 'Dog', 'Poodle', '2022-01-05', 'Female', 4),
(5, 'Rocky', 'Dog', 'Bulldog', '2020-07-20', 'Male', 5),
(6, 'Milo', 'Cat', 'Bengal', '2021-11-11', 'Male', 6),
(7, 'Luna', 'Cat', 'Ragdoll', '2019-04-22', 'Female', 7),
(8, 'Charlie', 'Dog', 'Beagle', '2018-12-12', 'Male', 8),
(9, 'Max', 'Dog', 'German Shepherd', '2020-03-03', 'Male', 9),
(10, 'Coco', 'Dog', 'Shih Tzu', '2022-06-01', 'Female', 10);

INSERT INTO appointments(appointid, animalid, appointdate, reason)
VALUES
(1, 1, '2023-01-01', 'Vaccination'),
(2, 2, '2023-01-03', 'Checkup'),
(3, 3, '2023-01-05', 'Surgery'),
(4, 4, '2023-01-07', 'Grooming'),
(5, 5, '2023-01-09', 'Dental'),
(6, 6, '2023-01-11', 'Checkup'),
(7, 7, '2023-01-13', 'Vaccination'),
(8, 8, '2023-01-15', 'Injury'),
(9, 9, '2023-01-17', 'Follow-up'),
(10, 10, '2023-01-19', 'Spaying');

INSERT INTO doctors(doctorid, dfirstname, dlastname, speciality, phone, email)
VALUES
(1, 'Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
(2, 'Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
(3, 'Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
(4, 'Sofia', 'Reyes-Gonzales', 'Dermatology Specialist', '999-888-7777', 'sofia@example.com'),
(5, 'Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
(6, 'Carmen', 'Fernandez', 'Opthalmology Specialist', '333-222-1111', 'carmen@example.com');

INSERT INTO invoices(invoiceid, appointid, totalamount, paymentdate)
VALUES
(1, 1, 50.00, '09:30:00'),
(2, 2, 75.00, '14:15:00'),
(3, 3, 100.00, '11:00:00'),
(4, 4, 200.00, '13:45:00'),
(5, 5, 80.00, '10:30:00'),
(6, 6, 30.00, '15:00:00'),
(7, 7, 75.00, '09:15:00'),
(8, 8, 150.00, '16:30:00'),
(9, 9, 60.00, '14:45:00'),
(10, 10, 40.00, '11:30:00');

INSERT INTO medicalrecords(recordid, animalid, recorddate, doctorid, diagnosis, prescription, notes)
VALUES
(1, 1, '2023-01-05 00:00:00', 1, 'Health check', 'N/A', 'Regular checkup'),
(2, 2, '2023-01-10 00:00:00', 1, 'Vaccination', 'Vaccine X', 'Administered vaccination X'),
(3, 3, '2023-02-02 00:00:00', 3, 'Sprained leg', 'Pain Medication', 'Rest 2 weeks'),
(4, 4, '2023-02-15 00:00:00', 1, 'Dental cleaning', 'N/A', 'Completed dental cleaning'),
(5, 5, '2023-03-10 00:00:00', 4, 'Skin infection', 'Antibiotics', 'Prescribed antibiotics'),
(6, 6, '2023-03-10 00:00:00', 2, 'Flea infestation', 'Flea Treatment', 'Administered flea treatment'),
(7, 7, '2023-04-12 00:00:00', 1, 'Vaccination', 'Vaccine Y', 'Administered vaccination Y'),
(8, 8, '2023-04-18 00:00:00', 5, 'Spaying', 'N/A', 'Successful surgery'),
(9, 9, '2023-05-02 00:00:00', 4, 'Allergy', 'Antihistamines', 'Prescribed antihistamines'),
(10, 10, '2023-05-20 00:00:00', 6, 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops');

UPDATE owners
SET registereddate = CURDATE();

ALTER TABLE invoices
RENAME COLUMN paymentdate TO 
paymenttime;

DELETE FROM appointments
WHERE animalid = (
 SELECT animalid FROM animals WHERE name = 
'Simba'
);

UPDATE doctors
SET dlastname = 'Reyes-Gonzales'
WHERE doctorid = 4;
