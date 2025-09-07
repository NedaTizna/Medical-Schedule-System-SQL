# MedSched (Medical Scheduling System)

A SQL-based medical scheduling system that manages doctors, patients, and their weekly appointments.  
This database project is designed for clinics or hospitals to easily keep track of doctors’ schedules and patients' bookings.

## Features
- Store doctors with their specialties.
- Store patient contact information.
- Schedule appointments for doctors and patients by day and time.
- Sample data for 5 doctors, 10 patients, and a weekly schedule.
- Easy-to-use queries for:
  - Viewing all doctors
  - Viewing all patients
  - Viewing the full weekly schedule
  - Viewing specific doctor’s patients on a given day
## How It Works
1. Doctors and Patients are stored in separate tables.  
2. Schedule table connects doctors to patients with a specific day and time.  
3. The project uses foreign keys to maintain data integrity.  
4. Sample data includes:
   - 5 doctors with different specialties
   - 10 patients with phone numbers
   - A weekly schedule (Monday to Friday)

## Key SQL Queries
1. View all doctors:
   `sql
   SELECT * FROM Doctors;

2. View all patients:
SELECT * FROM Patients;

3. View full schedule:
SELECT * FROM Schedule;

4. View all patients of Doctor Ali on Monday:
SELECT d.Name AS Doctor, p.Name AS Patient, s.DayOfWeek, s.AppointmentTime
FROM Schedule s
JOIN Doctors d ON s.DoctorID = d.DoctorID
JOIN Patients p ON s.PatientID = p.PatientID
WHERE d.Name = 'Ali' AND s.DayOfWeek = 'Monday';

Skills Practiced:
SQL table design (with primary keys and foreign keys)
Relational database schema creation
Writing SELECT, JOIN, and filtering queries
Inserting and organizing sample data
Designing a scheduling system for a medical clinic