CREATE DATABASE HospitalDB;
USE HospitalDB;

-- Doctor Table
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100),
    Phone VARCHAR(15),
    Experience INT
);

-- Patient Table
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100) NOT NULL,
    Age INT,
    Gender VARCHAR(10),
    Disease VARCHAR(100),
    DoctorID INT,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

-- Insert 10 Doctors
INSERT INTO Doctor (DoctorID, DoctorName, Specialization, Phone, Experience)
VALUES
(1, 'Dr. Arun Kumar', 'Cardiologist', '9876543210', 12),
(2, 'Dr. Meera Nair', 'Dermatologist', '9876543211', 8),
(3, 'Dr. Rahul Menon', 'Neurologist', '9876543212', 15),
(4, 'Dr. Anjali Thomas', 'Pediatrician', '9876543213', 10),
(5, 'Dr. Vishnu Raj', 'Orthopedic', '9876543214', 11),
(6, 'Dr. Neha Joseph', 'Gynecologist', '9876543215', 9),
(7, 'Dr. Suresh Babu', 'General Physician', '9876543216', 20),
(8, 'Dr. Priya Das', 'ENT Specialist', '9876543217', 7),
(9, 'Dr. Akhil Varma', 'Pulmonologist', '9876543218', 13),
(10, 'Dr. Fathima Ali', 'Psychiatrist', '9876543219', 6);

-- Insert 10 Patients
INSERT INTO Patient (PatientID, PatientName, Age, Gender, Disease, DoctorID)
VALUES
(1, 'Rahul', 45, 'Male', 'Heart Disease', 1),
(2, 'Anu', 32, 'Female', 'Skin Allergy', 2),
(3, 'Vijay', 55, 'Male', 'Migraine', 3),
(4, 'Aisha', 8, 'Female', 'Fever', 4),
(5, 'Manoj', 48, 'Male', 'Back Pain', 5),
(6, 'Sneha', 29, 'Female', 'PCOS', 6),
(7, 'Ramesh', 60, 'Male', 'Diabetes', 7),
(8, 'Amal', 25, 'Male', 'Sinusitis', 8),
(9, 'Divya', 40, 'Female', 'Asthma', 9),
(10, 'Nikhil', 35, 'Male', 'Anxiety', 10);

-- View the tables
SELECT * FROM Doctor;
SELECT * FROM Patient;

-- Join Doctor and Patient tables
SELECT 
    p.PatientID,
    p.PatientName,
    p.Age,
    p.Gender,
    p.Disease,
    d.DoctorName,
    d.Specialization
FROM Patient p
JOIN Doctor d
ON p.DoctorID = d.DoctorID;
