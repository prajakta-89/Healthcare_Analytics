SET FOREIGN_KEY_CHECKS = 0;
DROP DATABASE IF EXISTS Healthcare_Analytics_DB;
CREATE DATABASE Healthcare_Analytics_DB CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE Healthcare_Analytics_DB;



CREATE TABLE departments (
  department_id INT PRIMARY KEY AUTO_INCREMENT,
  department_name VARCHAR(100) NOT NULL,
  city VARCHAR(80) NOT NULL,
  location_floor VARCHAR(20) NOT NULL,
  phone_extension VARCHAR(10) NOT NULL,
  total_staff INT NOT NULL DEFAULT 0,
  budget_allocation DECIMAL(12,2) NOT NULL DEFAULT 0,
  established_year INT NOT NULL,
  shift_timing VARCHAR(50) NOT NULL,
  head_doctor_id INT NULL
) ENGINE=InnoDB;
CREATE INDEX ix_departments_city ON departments(city);
SET SQL_SAFE_UPDATES=0;



CREATE TABLE doctors (
  doctor_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name  VARCHAR(50) NOT NULL,
  gender ENUM('Male','Female','Other') NOT NULL,
  specialization VARCHAR(100) NOT NULL,
  department_id INT NOT NULL,
  city VARCHAR(80) NOT NULL,
  experience_years INT NOT NULL CHECK (experience_years >= 0),
  phone VARCHAR(15) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  joining_date DATE NOT NULL,
  consultation_fee DECIMAL(10,2) NOT NULL CHECK (consultation_fee >= 0),
  status ENUM('Active','On Leave','Retired') NOT NULL DEFAULT 'Active',
  CONSTRAINT fk_doc_dept FOREIGN KEY (department_id) REFERENCES departments(department_id)
) ENGINE=InnoDB;
CREATE INDEX ix_doctors_dept ON doctors(department_id);
CREATE INDEX ix_doctors_name ON doctors(last_name, first_name);
CREATE INDEX ix_doctors_city ON doctors(city);



CREATE TABLE patients (
  patient_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name  VARCHAR(50) NOT NULL,
  gender ENUM('Male','Female','Other') NOT NULL,
  date_of_birth DATE NOT NULL,
  phone VARCHAR(15) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(80) NOT NULL,
  blood_group ENUM('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  admission_date DATE NULL,
  discharge_date DATE NULL,
  doctor_id INT NULL,
  insurance_provider VARCHAR(100) NULL,
  CONSTRAINT fk_patient_doctor FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
) ENGINE=InnoDB;
CREATE INDEX ix_patients_city ON patients(city);
CREATE INDEX ix_patients_doctor ON patients(doctor_id);
CREATE INDEX ix_patients_name ON patients(last_name, first_name);



CREATE TABLE appointments (
  appointment_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  department_id INT NOT NULL,
  appointment_date DATE NOT NULL,
  appointment_time TIME NOT NULL,
  purpose VARCHAR(100) NOT NULL,
  diagnosis VARCHAR(255) NULL,
  status ENUM('Scheduled','Completed','Cancelled') NOT NULL,
  follow_up_required BOOLEAN NOT NULL DEFAULT FALSE,
  follow_up_date DATE NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_appt_patient FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  CONSTRAINT fk_appt_doctor FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
  CONSTRAINT fk_appt_department FOREIGN KEY (department_id) REFERENCES departments(department_id)
) ENGINE=InnoDB;
CREATE INDEX ix_appt_patient ON appointments(patient_id);
CREATE INDEX ix_appt_doctor ON appointments(doctor_id);
CREATE INDEX ix_appt_dept ON appointments(department_id);
CREATE INDEX ix_appt_status_date ON appointments(status, appointment_date);



CREATE TABLE bills (
  bill_id INT PRIMARY KEY AUTO_INCREMENT,
  appointment_id INT NOT NULL UNIQUE,
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL CHECK (total_amount >= 0),
  discount DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (discount >= 0),
  insurance_amount DECIMAL(10,2) NULL CHECK (insurance_amount >= 0),
  net_amount DECIMAL(10,2) NOT NULL,
  payment_mode ENUM('Cash','Card','Insurance','UPI') NOT NULL,
  payment_status ENUM('Paid','Pending','Rejected') NOT NULL DEFAULT 'Pending',
  billing_date DATE NOT NULL,
  due_date DATE NOT NULL,
  insurance_claimed BOOLEAN NOT NULL DEFAULT FALSE,
  CONSTRAINT fk_bill_appt FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id),
  CONSTRAINT fk_bill_patient FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  CONSTRAINT fk_bill_doctor FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
) ENGINE=InnoDB;
CREATE INDEX ix_bills_patient ON bills(patient_id);
CREATE INDEX ix_bills_doctor ON bills(doctor_id);
CREATE INDEX ix_bills_status_date ON bills(payment_status, billing_date);

CREATE TABLE medications (
  medication_id INT PRIMARY KEY AUTO_INCREMENT,
  appointment_id INT NOT NULL,
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  generic_name VARCHAR(100) NOT NULL,
  brand_name   VARCHAR(100) NOT NULL,
  dosage VARCHAR(50) NOT NULL,
  frequency VARCHAR(50) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NULL,
  notes VARCHAR(255) NULL,
  status ENUM('Active','Completed') NOT NULL DEFAULT 'Active',
  prescribed_date DATE NOT NULL,
  CONSTRAINT fk_med_appt FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id),
  CONSTRAINT fk_med_patient FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  CONSTRAINT fk_med_doctor FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
) ENGINE=InnoDB;
CREATE INDEX ix_meds_patient ON medications(patient_id);
CREATE INDEX ix_meds_doctor ON medications(doctor_id);
CREATE INDEX ix_meds_appt ON medications(appointment_id);
CREATE INDEX ix_meds_names ON medications(generic_name, brand_name);