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