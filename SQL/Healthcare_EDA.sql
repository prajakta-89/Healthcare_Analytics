#Exploratory Data Analysis (EDA)
#Patient Analysis
#1. Total Patients
SELECT COUNT(*) AS Total_Patients
FROM patients;

#Patients by Gender
SELECT gender,
       COUNT(*) AS Total_Patients
FROM patients
GROUP BY gender;


#Patients by City
SELECT city,
       COUNT(*) AS Total_Patients
FROM patients
GROUP BY city
ORDER BY Total_Patients DESC;


#Blood Group Distribution
SELECT blood_group,
       COUNT(*) AS Total_Patients
FROM patients
GROUP BY blood_group
ORDER BY Total_Patients DESC;


#Age Group Distribution
SELECT
CASE
WHEN TIMESTAMPDIFF(YEAR,date_of_birth,CURDATE()) <18 THEN 'Children'
WHEN TIMESTAMPDIFF(YEAR,date_of_birth,CURDATE()) BETWEEN 18 AND 35 THEN 'Young Adults'
WHEN TIMESTAMPDIFF(YEAR,date_of_birth,CURDATE()) BETWEEN 36 AND 60 THEN 'Adults'
ELSE 'Senior Citizens'
END AS Age_Group,
COUNT(*) AS Total_Patients
FROM patients
GROUP BY Age_Group;


#Doctor Analysis
#6. Doctors by Specialization
SELECT specialization,
       COUNT(*) AS Total_Doctors
FROM doctors
GROUP BY specialization
ORDER BY Total_Doctors DESC;


#Average Consultation Fee by Specialization
SELECT specialization,
       ROUND(AVG(consultation_fee),2) AS Avg_Fee
FROM doctors
GROUP BY specialization
ORDER BY Avg_Fee DESC;


#Top 10 Experienced Doctors
SELECT doctor_id,
       CONCAT(first_name,' ',last_name) AS Doctor_Name,
       specialization,
       experience_years
FROM doctors
ORDER BY experience_years DESC
LIMIT 10;


#Doctors by Department
SELECT d.department_name,
       COUNT(doc.doctor_id) AS Total_Doctors
FROM departments d
JOIN doctors doc
ON d.department_id=doc.department_id
GROUP BY d.department_name
ORDER BY Total_Doctors DESC;


#Appointment Analysis
#10. Appointment Status
SELECT status,
       COUNT(*) AS Total_Appointments
FROM appointments
GROUP BY status;


#Monthly Appointments
SELECT
DATE_FORMAT(appointment_date,'%Y-%m') AS Month,
COUNT(*) AS Total_Appointments
FROM appointments
GROUP BY Month
ORDER BY Month;


#Monthly Appointments
SELECT
DATE_FORMAT(appointment_date,'%Y-%m') AS Month,
COUNT(*) AS Total_Appointments
FROM appointments
GROUP BY Month
ORDER BY Month;


#Department-wise Appointments
SELECT d.department_name,
       COUNT(*) AS Total_Appointments
FROM appointments a
JOIN departments d
ON a.department_id=d.department_id
GROUP BY d.department_name
ORDER BY Total_Appointments DESC;


#Top Diagnoses
SELECT diagnosis,
       COUNT(*) AS Total_Cases
FROM appointments
GROUP BY diagnosis
ORDER BY Total_Cases DESC
LIMIT 10;


#Follow-up Required
SELECT
CASE
WHEN follow_up_required=1 THEN 'Yes'
ELSE 'No'
END AS Follow_Up,
COUNT(*) AS Patients
FROM appointments
GROUP BY Follow_Up;


#Revenue Analysis
#15. Total Revenue
SELECT ROUND(SUM(net_amount),2) AS Total_Revenue
FROM bills;


#Monthly Revenue
SELECT
DATE_FORMAT(billing_date,'%Y-%m') AS Month,
ROUND(SUM(net_amount),2) AS Revenue
FROM bills
GROUP BY Month
ORDER BY Month;


#Revenue by Department
SELECT d.department_name,
ROUND(SUM(b.net_amount),2) AS Revenue
FROM bills b
JOIN doctors doc
ON b.doctor_id=doc.doctor_id
JOIN departments d
ON doc.department_id=d.department_id
GROUP BY d.department_name
ORDER BY Revenue DESC;


#Revenue by Doctor
SELECT
CONCAT(doc.first_name,' ',doc.last_name) AS Doctor_Name,
ROUND(SUM(b.net_amount),2) AS Revenue
FROM bills b
JOIN doctors doc
ON b.doctor_id=doc.doctor_id
GROUP BY Doctor_Name
ORDER BY Revenue DESC
LIMIT 10;


#Payment Mode Distribution
SELECT payment_mode,
COUNT(*) AS Total_Bills,
ROUND(SUM(net_amount),2) AS Revenue
FROM bills
GROUP BY payment_mode;


#Payment Status
SELECT payment_status,
COUNT(*) AS Bills
FROM bills
GROUP BY payment_status;


#Medication Analysis
#21. Most Prescribed Medicines
SELECT generic_name,
COUNT(*) AS Prescription_Count
FROM medications
GROUP BY generic_name
ORDER BY Prescription_Count DESC
LIMIT 10;


#Medication Status
SELECT status,
COUNT(*) AS Total
FROM medications
GROUP BY status;


#Doctor-wise Prescriptions
SELECT
CONCAT(d.first_name,' ',d.last_name) AS Doctor_Name,
COUNT(*) AS Total_Prescriptions
FROM medications m
JOIN doctors d
ON m.doctor_id=d.doctor_id
GROUP BY Doctor_Name
ORDER BY Total_Prescriptions DESC
LIMIT 10;


#Average Medication Duration
SELECT
ROUND(AVG(DATEDIFF(end_date,start_date)),2) AS Avg_Days
FROM medications;


#Department Analysis
#25. Department Budget
SELECT department_name,
budget_allocation
FROM departments
ORDER BY budget_allocation DESC;


#Staff Distribution
SELECT department_name,
total_staff
FROM departments
ORDER BY total_staff DESC;


#Head Doctor of Each Department
SELECT
dep.department_name,
CONCAT(doc.first_name,' ',doc.last_name) AS Head_Doctor
FROM departments dep
JOIN doctors doc
ON dep.head_doctor_id=doc.doctor_id;
