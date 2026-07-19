#SQL Dashboard Queries
#Dashboard 1: Hospital Overview
#Visual 1: Monthly Revenue Trend (Line Chart)
SELECT
DATE_FORMAT(billing_date,'%Y-%m') AS Month,
SUM(net_amount) AS Revenue
FROM bills
GROUP BY Month
ORDER BY Month;


#Visual 2: Appointment Status (Donut Chart)
SELECT
status,
COUNT(*) AS Total_Appointments
FROM appointments
GROUP BY status;


#Visual 3: Revenue by Department (Bar Chart)
SELECT
d.department_name,
SUM(b.net_amount) AS Revenue
FROM bills b
JOIN doctors doc
ON b.doctor_id = doc.doctor_id
JOIN departments d
ON doc.department_id = d.department_id
GROUP BY d.department_name
ORDER BY Revenue DESC;


#Visual 4: Department-wise Appointments (Column Chart)
SELECT
d.department_name,
COUNT(*) AS Total_Appointments
FROM appointments a
JOIN departments d
ON a.department_id = d.department_id
GROUP BY d.department_name
ORDER BY Total_Appointments DESC;


#Visual 5: Patients by City (Bar Chart)
SELECT
city,
COUNT(*) AS Total_Patients
FROM patients
GROUP BY city
ORDER BY Total_Patients DESC;


#Visual 6: Payment Mode Distribution (Donut Chart)
SELECT
payment_mode,
SUM(net_amount) AS Revenue
FROM bills
GROUP BY payment_mode;


#Dashboard 2: Patient & Doctor Analytics
#Visual 1: Gender Distribution
SELECT
gender,
COUNT(*) AS Total_Patients
FROM patients
GROUP BY gender;


#Visual 2: Age Group Distribution
SELECT
CASE
WHEN TIMESTAMPDIFF(YEAR,date_of_birth,CURDATE()) <18 THEN 'Children'
WHEN TIMESTAMPDIFF(YEAR,date_of_birth,CURDATE()) BETWEEN 18 AND 35 THEN 'Young Adults'
WHEN TIMESTAMPDIFF(YEAR,date_of_birth,CURDATE()) BETWEEN 36 AND 60 THEN 'Adults'
ELSE 'Senior Citizens'
END AS Age_Group,
COUNT(*) AS Patients
FROM patients
GROUP BY Age_Group;


#Visual 3: Blood Group Distribution
SELECT
blood_group,
COUNT(*) AS Patients
FROM patients
GROUP BY blood_group
ORDER BY Patients DESC;


#Visual 4: Top 10 Doctors by Appointments
SELECT
CONCAT(d.first_name,' ',d.last_name) AS Doctor_Name,
COUNT(a.appointment_id) AS Total_Appointments
FROM doctors d
JOIN appointments a
ON d.doctor_id=a.doctor_id
GROUP BY Doctor_Name
ORDER BY Total_Appointments DESC
LIMIT 10;


#Visual 5: Top 10 Doctors by Revenue
SELECT
CONCAT(d.first_name,' ',d.last_name) AS Doctor_Name,
SUM(b.net_amount) AS Revenue
FROM doctors d
JOIN bills b
ON d.doctor_id=b.doctor_id
GROUP BY Doctor_Name
ORDER BY Revenue DESC
LIMIT 10;


#Visual 6: Doctor Specialization
SELECT
specialization,
COUNT(*) AS Doctors
FROM doctors
GROUP BY specialization
ORDER BY Doctors DESC;


#Visual 7: Experience Analysis
SELECT
specialization,
AVG(experience_years) AS Avg_Experience
FROM doctors
GROUP BY specialization;


#Dashboard 3: Financial & Medication Analytics
#Visual 1: Monthly Revenue
SELECT
DATE_FORMAT(billing_date,'%Y-%m') AS Month,
SUM(net_amount) AS Revenue
FROM bills
GROUP BY Month
ORDER BY Month;


#Visual 2: Payment Status
SELECT
payment_status,
COUNT(*) AS Bills
FROM bills
GROUP BY payment_status;


#Visual 4: Revenue by Doctor
SELECT
CONCAT(d.first_name,' ',d.last_name) AS Doctor_Name,
SUM(b.net_amount) AS Revenue
FROM doctors d
JOIN bills b
ON d.doctor_id=b.doctor_id
GROUP BY Doctor_Name
ORDER BY Revenue DESC;


#Visual 5: Top 10 Medicines
SELECT
generic_name,
COUNT(*) AS Prescriptions
FROM medications
GROUP BY generic_name
ORDER BY Prescriptions DESC
LIMIT 10;


#Visual 6: Medication Status
SELECT
status,
COUNT(*) AS Medicines
FROM medications
GROUP BY status;


#Visual 7: Top 10 Diagnoses
SELECT
diagnosis,
COUNT(*) AS Total_Cases
FROM appointments
GROUP BY diagnosis
ORDER BY Total_Cases DESC
LIMIT 10;


#Visual 8: Revenue by Payment Mode
SELECT
payment_mode,
SUM(net_amount) AS Revenue
FROM bills
GROUP BY payment_mode
ORDER BY Revenue DESC;
