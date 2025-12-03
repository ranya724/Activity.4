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