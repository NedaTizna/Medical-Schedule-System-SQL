.-- =======================================
-- Project: MedSched (Medical Scheduling System)
-- Description: Doctors, Patients & Weekly Schedule
-- =======================================

-- Drop tables if they exist (avoid errors)
DROP TABLE IF EXISTS Schedule;
DROP TABLE IF EXISTS Patients;
DROP TABLE IF EXISTS Doctors;

-- -----------------------------
-- 1. Create Doctors table
-- -----------------------------
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Specialty VARCHAR(50)
);

-- -----------------------------
-- 2. Create Patients table
-- -----------------------------
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Phone VARCHAR(20)
);

-- -----------------------------
-- 3. Create Weekly Schedule table
-- -----------------------------
CREATE TABLE Schedule (
    ScheduleID INT PRIMARY KEY AUTO_INCREMENT,
    DoctorID INT,
    PatientID INT,
    DayOfWeek VARCHAR(10),
    AppointmentTime TIME,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- -----------------------------
-- 4. Insert sample doctors
-- -----------------------------
INSERT INTO Doctors (Name, Specialty) VALUES
('Ali', 'Cardiology'),
('Sara', 'Dermatology'),
('Amir', 'Neurology'),
('Maryam', 'Pediatrics'),
('Reza', 'Orthopedics');

-- -----------------------------
-- 5. Insert sample patients
-- -----------------------------
INSERT INTO Patients (Name, Phone) VALUES
('Mina', '09110001111'),
('Arian', '09112223344'),
('Zahra', '09113334455'),
('Sina', '09114445566'),
('Lila', '09115556677'),
('Amirhossein', '09116667788'),
('Fatemeh', '09117778899'),
('Hossein', '09118889900'),
('Mahsa', '09119990011'),
('Parsa', '09110001122');

-- -----------------------------
-- 6. Insert weekly schedule (5 patients per doctor per day)
-- -----------------------------
INSERT INTO Schedule (DoctorID, PatientID, DayOfWeek, AppointmentTime) VALUES
-- Doctor Ali - Monday
(1, 1, 'Monday', '09:00:00'), (1, 2, 'Monday', '10:00:00'), 
(1, 3, 'Monday', '11:00:00'), (1, 4, 'Monday', '12:00:00'), 
(1, 5, 'Monday', '13:00:00'),

-- Doctor Sara - Tuesday
(2, 6, 'Tuesday', '09:00:00'), (2, 7, 'Tuesday', '10:00:00'),
(2, 8, 'Tuesday', '11:00:00'), (2, 9, 'Tuesday', '12:00:00'),
(2, 10, 'Tuesday', '13:00:00'),

-- Doctor Amir - Wednesday
(3, 1, 'Wednesday', '09:00:00'), (3, 3, 'Wednesday', '10:00:00'),
(3, 5, 'Wednesday', '11:00:00'), (3, 7, 'Wednesday', '12:00:00'),
(3, 9, 'Wednesday', '13:00:00'),

-- Doctor Maryam - Thursday
(4, 2, 'Thursday', '09:00:00'), (4, 4, 'Thursday', '10:00:00'),
(4, 6, 'Thursday', '11:00:00'), (4, 8, 'Thursday', '12:00:00'),
(4, 10, 'Thursday', '13:00:00'),

-- Doctor Reza - Friday
(5, 1, 'Friday', '09:00:00'), (5, 2, 'Friday', '10:00:00'),
(5, 3, 'Friday', '11:00:00'), (5, 4, 'Friday', '12:00:00'),
(5, 5, 'Friday', '13:00:00');

-- -----------------------------
-- 7. Display all doctors
-- -----------------------------
SELECT * FROM Doctors;

-- -----------------------------
-- 8. Display all patients
-- -----------------------------
SELECT * FROM Patients;

-- -----------------------------
-- 9. Display full schedule
-- -----------------------------
SELECT * FROM Schedule;

-- -----------------------------
-- 10. Display all patients of Doctor Ali on Monday
-- -----------------------------
SELECT d.Name AS Doctor, p.Name AS Patient, s.DayOfWeek, s.AppointmentTime
FROM Schedule s
JOIN Doctors d ON s.DoctorID = d.DoctorID
JOIN Patients p ON s.PatientID = p.PatientID
WHERE d.Name = 'Ali' AND s.DayOfWeek = 'Monday';