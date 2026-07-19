#KPIs
#KPI 1: Total Patients
#Business Meaning
#Total number of registered patients in the hospital.
SELECT COUNT(*) AS Total_Patients
FROM patients;


#KPI 2: Total Doctors
#Business Meaning
#Total number of doctors available.
SELECT COUNT(*) AS Total_Doctors
FROM doctors;


#KPI 3: Total Appointments
#Business Meaning
#Total appointments booked.
SELECT COUNT(*) AS Total_Appointments
FROM appointments;


#KPI 4: Appointment Completion Rate (%)
#Business Meaning
#Measures hospital efficiency.
#Completed Appointments / Total Appointments × 100
SELECT
ROUND(
COUNT(CASE WHEN status='Completed' THEN 1 END)
*100.0/COUNT(*),2) AS Completion_Rate
FROM appointments;



#KPI 5: Total Revenue
#Business Meaning
#Total revenue earned by the hospital.
SELECT
ROUND(SUM(net_amount),2) AS Total_Revenue
FROM bills;



#KPI 6: Average Bill Amount
#Business Meaning
#Average amount paid per bill.
SELECT
ROUND(AVG(net_amount),2) AS Average_Bill
FROM bills;



#KPI 7: Follow-up Appointments
#Business Meaning
#Patients requiring another hospital visit.
SELECT
COUNT(*) AS Follow_Up_Appointments
FROM appointments
WHERE follow_up_required=1;



#KPI 8: Active Medications
#Business Meaning
#Patients currently under medication.
SELECT
COUNT(*) AS Active_Medications
FROM medications
WHERE status='Active';