SET SQL_SAFE_UPDATES = 0;
UPDATE Medicines 
SET UnitPrice = UnitPrice * 1.10 
WHERE UnitPrice < 30.00;
SET SQL_SAFE_UPDATES = 1;

DELETE FROM Appointments 
WHERE Status = 'Cancelled';