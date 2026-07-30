CREATE DATABASE smartclinicDB;

USE smartclinicDB;

CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DOB DATE,
    Phone VARCHAR(20),
    Address VARCHAR(100)
);