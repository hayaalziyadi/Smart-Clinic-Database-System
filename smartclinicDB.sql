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


CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Phone VARCHAR(20),
    Email VARCHAR(50),
    Role VARCHAR(20),
    Salary DECIMAL(10, 2)
);

CREATE TABLE Doctors (
    StaffID INT PRIMARY KEY,
    Specialization VARCHAR(50),
    LicenseNumber VARCHAR(50),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID) ON DELETE CASCADE
);

CREATE TABLE Nurses (
    StaffID INT PRIMARY KEY,
    ShiftType VARCHAR(20),
    Department VARCHAR(50),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID) ON DELETE CASCADE
);

CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    StaffID INT NOT NULL,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    Status VARCHAR(20) DEFAULT 'Scheduled',
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID) ON DELETE CASCADE,
    FOREIGN KEY (StaffID) REFERENCES Doctors(StaffID) ON DELETE CASCADE
);


CREATE TABLE Medical_Records (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT UNIQUE NOT NULL,
    Diagnosis TEXT,
    Notes TEXT,
    RecordDate DATE NOT NULL,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID) ON DELETE CASCADE
);

CREATE TABLE Medicines (
    MedicineID INT AUTO_INCREMENT PRIMARY KEY,
    MedicineName VARCHAR(100) NOT NULL,
    DosageForm VARCHAR(50),
    UnitPrice DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Prescription_Items (
    RecordID INT NOT NULL,
    MedicineID INT NOT NULL,
    QuantityPrescribed INT NOT NULL,
    PRIMARY KEY (RecordID, MedicineID),
    FOREIGN KEY (RecordID) REFERENCES Medical_Records(RecordID) ON DELETE CASCADE,
    FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID) ON DELETE CASCADE
);

CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT UNIQUE NOT NULL,
    PaymentDate DATE NOT NULL,
    AmountPaid DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(20) NOT NULL,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID) ON DELETE CASCADE
);