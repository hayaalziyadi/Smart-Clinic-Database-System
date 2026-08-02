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



INSERT INTO Patients (FirstName, LastName, Gender, DOB, Phone, Address) VALUES
('Ahmed', 'Ali', 'Male', '1990-05-15', '0501234567', 'Riyadh'),
('Sara', 'Khalid', 'Female', '1995-08-20', '0502345678', 'Jeddah'),
('Mohammed', 'Hassan', 'Male', '1985-12-10', '0503456789', 'Dammam'),
('Fatima', 'Omar', 'Female', '2000-03-05', '0504567890', 'Riyadh'),
('Mona', 'Saleh', 'Female', '1992-11-25', '0505678901', 'Mecca');

INSERT INTO Staff (FirstName, LastName, Phone, Email, Role, Salary) VALUES
('Fahad', 'Al-Otaibi', '0551112233', 'fahad@clinic.com', 'Doctor', 25000.00),
('Noura', 'Al-Dosari', '0552223344', 'noura@clinic.com', 'Doctor', 22000.00),
('Tariq', 'Al-Shehri', '0553334455', 'tariq@clinic.com', 'Doctor', 20000.00),
('Reem', 'Al-Harbi', '0554445566', 'reem@clinic.com', 'Nurse', 8000.00),
('Amal', 'Al-Ghamdi', '0555556677', 'amal@clinic.com', 'Nurse', 7500.00);

INSERT INTO Doctors (StaffID, Specialization, LicenseNumber) VALUES
(1, 'Cardiology', 'DOC1001'),
(2, 'Pediatrics', 'DOC1002'),
(3, 'Dermatology', 'DOC1003');

INSERT INTO Nurses (StaffID, ShiftType, Department) VALUES
(4, 'Morning', 'Emergency'),
(5, 'Night', 'Outpatient');

INSERT INTO Appointments (PatientID, StaffID, AppointmentDate, AppointmentTime, Status) VALUES
(1, 1, '2026-08-01', '09:00:00', 'Completed'),
(2, 2, '2026-08-01', '10:30:00', 'Completed'),
(3, 3, '2026-08-02', '11:00:00', 'Scheduled'),
(4, 1, '2026-08-02', '14:00:00', 'Scheduled'),
(5, 2, '2026-08-03', '15:30:00', 'Cancelled');

INSERT INTO Medical_Records (AppointmentID, Diagnosis, Notes, RecordDate) VALUES
(1, 'Hypertension', 'Prescribed blood pressure medication.', '2026-08-01'),
(2, 'Seasonal Allergy', 'Mild fever and congestion.', '2026-08-01'),
(3, 'Routine Checkup', 'No abnormal symptoms found.', '2026-08-02'),
(4, 'Skin Rash', 'Topical cream applied.', '2026-08-02'),
(5, 'Migraine', 'Patient requested appointment cancellation.', '2026-08-03');

INSERT INTO Medicines (MedicineName, DosageForm, UnitPrice) VALUES
('Panadol Extra', 'Tablet', 15.50),
('Amoxicillin 500mg', 'Capsule', 45.00),
('Claritin 10mg', 'Tablet', 30.00),
('Cough Syrup 100ml', 'Liquid', 22.50),
('Lipitor 20mg', 'Tablet', 85.00);

INSERT INTO Prescription_Items (RecordID, MedicineID, QuantityPrescribed) VALUES
(1, 1, 2),
(1, 5, 1),
(2, 1, 1),
(2, 3, 1),
(3, 2, 1);

INSERT INTO Payments (AppointmentID, PaymentDate, AmountPaid, PaymentMethod) VALUES
(1, '2026-08-01', 250.00, 'Credit Card'),
(2, '2026-08-01', 150.00, 'Cash'),
(3, '2026-08-02', 200.00, 'Credit Card'),
(4, '2026-08-02', 180.00, 'Insurance'),
(5, '2026-08-03', 0.00, 'Cash');


SELECT PatientID, FirstName, LastName, Phone, Address 
FROM Patients 
WHERE Address = 'Riyadh';

SELECT 
    a.AppointmentID,
    CONCAT(p.FirstName, ' ', p.LastName) AS PatientName,
    CONCAT(s.FirstName, ' ', s.LastName) AS DoctorName,
    d.Specialization,
    a.AppointmentDate,
    a.Status
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.StaffID = d.StaffID
JOIN Staff s ON d.StaffID = s.StaffID;

SELECT 
    s.StaffID,
    CONCAT(s.FirstName, ' ', s.LastName) AS DoctorName,
    s.Salary
FROM Staff s
JOIN Doctors d ON s.StaffID = d.StaffID
WHERE s.Salary > (SELECT AVG(Salary) FROM Staff);

SELECT 
    PaymentMethod,
    COUNT(PaymentID) AS TotalTransactions,
    SUM(AmountPaid) AS TotalRevenue
FROM Payments
GROUP BY PaymentMethod;


SET SQL_SAFE_UPDATES = 0;
UPDATE Medicines 
SET UnitPrice = UnitPrice * 1.10 
WHERE UnitPrice < 30.00;
SET SQL_SAFE_UPDATES = 1;

DELETE FROM Appointments 
WHERE Status = 'Cancelled';


CREATE VIEW completed_appointments_summary AS
SELECT 
    a.AppointmentID,
    CONCAT(p.FirstName, ' ', p.LastName) AS PatientName,
    a.AppointmentDate,
    pay.AmountPaid,
    pay.PaymentMethod
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Payments pay ON a.AppointmentID = pay.AppointmentID
WHERE a.Status = 'Completed';

SELECT * FROM completed_appointments_summary;


DELIMITER //
CREATE TRIGGER Auto_Complete_Appointment
AFTER INSERT ON Medical_Records
FOR EACH ROW
BEGIN
    UPDATE Appointments
    SET Status = 'Completed'
    WHERE AppointmentID = NEW.AppointmentID;
END //
DELIMITER ;



