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