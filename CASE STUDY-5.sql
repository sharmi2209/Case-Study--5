CREATE DATABASE HospitalDB;
USE HospitalDB;

CREATE TABLE  Patients (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50) NOT NULL,age INT NOT NULL,gender VARCHAR(10),contact VARCHAR(50));

INSERT INTO patients (name,age,gender,contact) VALUES
('Akshaya',35,'Female','123456'), 
('Akash',55,'Male','234567'),
('Tamil',40,'Female','345678'),
('Deena',78,'Male','456789'),
('Vinitha',35,'Female','567891');

SELECT * FROM patients; 

CREATE TABLE Doctors (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50) NOT NULL,specialization VARCHAR(50) NOT NULL);

INSERT INTO Doctors (name,specialization) VALUES
("Deekshit","Cardiologist"),
("Nani","Neurologist"),
("Darsha","General surgery");

SELECT * FROM Doctors;

CREATE TABLE Appointments( id INT AUTO_INCREMENT PRIMARY KEY, patient_id INT,
 FOREIGN KEY ( patient_id) REFERENCES Patients(id), doctor_id INT, FOREIGN KEY (doctor_id) REFERENCES Doctors(id), 
 appointment_date DATE NOT NULL, status ENUM ('Scheduled', 'Completed', 'Cancelled'));

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status) VALUES
(1, 1, '2024-02-10', 'Scheduled'),
(2, 2, '2024-02-17', 'Completed'),
(3, 3, '2024-02-21', 'Cancelled'),
(4, 1, '2024-03-05', 'Scheduled'),
(5, 3, '2024-03-15', 'Completed');

SELECT * FROM Appointments;

-- List all patients --

SELECT * FROM patients; 

 -- List all doctors --

SELECT * FROM Doctors;

 -- Show appointments with patient and doctor names --
 
SELECT Appointments.id AS appointment_id,patients.name AS patient_name,doctors.name AS doctor_name,Appointments.appointment_date,
status FROM Appointments JOIN Patients ON Appointments.patient_id = patients.id JOIN Doctors ON Appointments.doctor_id = Doctors.id;

-- Count appointments per doctor --

SELECT Doctors.name AS doctor_name,COUNT( Appointments.id) AS appointment_count FROM Doctors
LEFT JOIN Appointments  ON Doctors.id =  Appointments.doctor_id GROUP BY Doctors.id;







