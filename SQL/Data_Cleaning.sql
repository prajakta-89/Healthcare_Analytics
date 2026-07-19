#Data cleaning
#Total records
SELECT COUNT(*) AS Total_Patients
FROM patients;


#Duplicate Patient IDs
SELECT patient_id, COUNT(*) AS Duplicate_Count
FROM patients
GROUP BY patient_id
HAVING COUNT(*) > 1;


#Missing First Name
SELECT *
FROM patients
WHERE first_name IS NULL
   OR TRIM(first_name) = '';
   
   
#Missing Last Name
SELECT *
FROM patients
WHERE last_name IS NULL
   OR TRIM(last_name) = '';
   
   
#Missing Phone Number
SELECT *
FROM patients
WHERE phone IS NULL
   OR TRIM(phone) = '';
   
   
   
#Missing Email
SELECT *
FROM patients
WHERE email IS NULL
   OR TRIM(email) = '';
   
   
   
#Invalid Gender
SELECT DISTINCT gender
FROM patients;



#Future Date of Birth
SELECT *
FROM patients
WHERE date_of_birth > CURDATE();



#Missing City
SELECT *
FROM patients
WHERE city IS NULL
   OR TRIM(city) = '';
   
   
   
#Invalid Blood Group
SELECT DISTINCT blood_group
FROM patients;



#Doctors Table
#Check Duplicate Doctor IDs
SELECT doctor_id, COUNT(*)
FROM doctors
GROUP BY doctor_id
HAVING COUNT(*)>1;



#Missing Department
SELECT *
FROM doctors
WHERE department_id IS NULL;



#Invalid Experience
SELECT *
FROM doctors
WHERE experience_years < 0;



#Invalid Consultation Fee
SELECT *
FROM doctors
WHERE consultation_fee <= 0;



#Future Joining Date
SELECT *
FROM doctors
WHERE joining_date > CURDATE();


#Invalid Gender
SELECT *
FROM doctors
WHERE gender NOT IN ('Male','Female','Other');


#Departments Table
#Duplicate Departments
SELECT department_id,COUNT(*)
FROM departments
GROUP BY department_id
HAVING COUNT(*)>1;


#Missing Department Name
SELECT *
FROM departments
WHERE department_name IS NULL
OR TRIM(department_name)='';


#Negative Budget
SELECT *
FROM departments
WHERE budget_allocation < 0;


#Invalid Staff Count
SELECT *
FROM departments
WHERE total_staff < 0;


#Future Established Year
SELECT *
FROM departments
WHERE established_year > YEAR(CURDATE());



#Appointments Table
#Duplicate Appointment
SELECT appointment_id,COUNT(*)
FROM appointments
GROUP BY appointment_id
HAVING COUNT(*)>1;



#Missing Patient
SELECT *
FROM appointments
WHERE patient_id IS NULL;


#Missing Doctor
SELECT *
FROM appointments
WHERE doctor_id IS NULL;


#Invalid Appointment Status
SELECT DISTINCT status
FROM appointments;


#Find invalid values:
SELECT *
FROM appointments
WHERE status NOT IN
('Completed','Scheduled','Cancelled');



#Invalid Follow-up Flag
SELECT *
FROM appointments
WHERE follow_up_required NOT IN (0,1);


#Future Created Date
SELECT *
FROM appointments
WHERE created_at > CURDATE();


#Bills Table
#Duplicate Bills
SELECT bill_id,COUNT(*)
FROM bills
GROUP BY bill_id
HAVING COUNT(*)>1;


#Negative Bill Amount
SELECT *
FROM bills
WHERE total_amount < 0;


#Negative Discount
SELECT *
FROM bills
WHERE discount < 0;


#Net Amount Validation
#Business Rule:
#Net Amount = Total Amount − Discount − Insurance Amount
SELECT *
FROM bills
WHERE net_amount <>
(total_amount-discount-insurance_amount);


#Invalid Payment Status
SELECT DISTINCT payment_status
FROM bills;


#Find invalid values:
SELECT *
FROM bills
WHERE payment_status NOT IN ('Paid','Pending','Rejected');


#Due Date Before Billing Date
SELECT *
FROM bills
WHERE due_date < billing_date;


#Medications Table
#Duplicate Medication
SELECT medication_id,COUNT(*)
FROM medications
GROUP BY medication_id
HAVING COUNT(*)>1;


#Missing Medicine Name
SELECT *
FROM medications
WHERE generic_name IS NULL
OR TRIM(generic_name)='';


#End Date Before Start Date
SELECT *
FROM medications
WHERE end_date < start_date;


#Invalid Status
SELECT DISTINCT status
FROM medications;


#Find invalid values:
SELECT *
FROM medications
WHERE status NOT IN ('Active','Completed');


#Missing Dosage
SELECT *
FROM medications
WHERE dosage IS NULL
OR TRIM(dosage)='';
