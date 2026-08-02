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