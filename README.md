# 🏥 Healthcare_Analytics
The Healthcare Analytics Dashboard is an end-to-end data analytics project developed using MySQL and Power BI to analyze hospital operations, patient care, doctor performance, appointments, billing, and medication data.

##  Project Overview

The **Healthcare Analytics Dashboard** is an end-to-end Business Intelligence project designed to analyze hospital operations, patient care, doctor performance, appointments, billing, and medication data using **MySQL** and **Power BI**.

This project transforms raw healthcare data into meaningful business insights through SQL-based data analysis and interactive dashboards. It enables hospital administrators to monitor operational efficiency, financial performance, patient demographics, and clinical activities for data-driven decision-making.

The project follows a complete analytics lifecycle, including data cleaning, exploratory data analysis (EDA), KPI development, SQL business analysis, Power BI data modeling, DAX measures, and dashboard visualization.

## 🎯 Business Problem

Hospitals generate large volumes of data through patient registrations, doctor consultations, appointments, billing transactions, and medication prescriptions. However, without centralized reporting, it becomes difficult to monitor operational performance, financial health, and patient care metrics.

This project addresses these challenges by building an interactive Healthcare Analytics Dashboard that provides actionable insights across hospital operations, financial performance, and clinical activities.


##  Project Objectives

- Analyze patient demographics and healthcare trends.
- Monitor doctor performance and appointment activities.
- Evaluate department-wise operational efficiency.
- Track hospital revenue and billing performance.
- Analyze payment methods and insurance claims.
- Identify medication prescription trends.
- Develop executive-level dashboards for decision-making.
- Support data-driven healthcare management.


##  Technologies Used

| Technology | Purpose |
|------------|----------|
| MySQL | Database Management |
| SQL | Data Cleaning & Business Analysis |
| Power BI | Dashboard Development |
| DAX | KPI Calculations |
| Microsoft Excel | Data Validation |


## 📁 Project Structure

```
Healthcare-Analytics/
│
├── Dataset/
│   └── healthcare_dataset.sql
│
├── SQL/
│   ├── 01_Data_Cleaning.sql
│   ├── 02_EDA.sql
│   ├── 03_KPI_Queries.sql
│   ├── 04_Dashboard_Queries.sql
│   └── 05_Advanced_SQL.sql
│
├── PowerBI/
│   └── Healthcare_Analytics_Dashboard.pbix
│
├── Dashboard Screenshots/
│   ├── Dashboard_1_Hospital_Overview.png
│   ├── Dashboard_2_Patient_Doctor_Analytics.png
│   └── Dashboard_3_Financial_Medication_Analytics.png
│
├── Images/
│   ├── ER_Diagram.png
│   └── Data_Model.png
│
└── README.md
```


##  Dataset
### 👤 Patients
Stores patient demographic information.

**Columns**

          - patient_id
          - first_name
          - last_name
          - gender
          - date_of_birth
          - phone
          - email
          - address
          - city
          - blood_group


### 👨‍⚕️ Doctors
Stores doctor information.

**Columns**

          - doctor_id
          - first_name
          - last_name
          - gender
          - specialization
          - department_id
          - city
          - experience_years
          - phone
          - email
          - joining_date
          - consultation_fee


### 🏥 Departments
Stores department information.

**Columns**

          - department_id
          - department_name
          - city
          - location_floor
          - phone_extension
          - total_staff
          - budget_allocation
          - established_year
          - shift_timing
          - head_doctor_id


### 📅 Appointments
Stores appointment records.

**Columns**

          - appointment_id
          - patient_id
          - doctor_id
          - department_id
          - appointment_date
          - appointment_time
          - purpose
          - diagnosis
          - status
          - follow_up_required
          - follow_up_date
          - created_at


### 💳 Bills
Stores billing information.

**Columns**

          - bill_id
          - appointment_id
          - patient_id
          - doctor_id
          - total_amount
          - discount
          - insurance_amount
          - net_amount
          - payment_mode
          - payment_status
          - billing_date
          - due_date
          - insurance_claim


### 💊 Medications
Stores medication details.

**Columns**

          - medication_id
          - appointment_id
          - patient_id
          - doctor_id
          - generic_name
          - brand_name
          - dosage
          - frequency
          - start_date
          - end_date
          - notes
          - status
          - prescribed_date
          

##  Data Cleaning
Performed comprehensive data quality checks using SQL:

- Removed duplicate records
- Identified missing values
- Validated patient demographics
- Validated blood groups
- Checked invalid genders
- Validated appointment status
- Verified billing calculations
- Checked payment status
- Validated medication status
- Performed date consistency checks


## 📊 Exploratory Data Analysis (EDA)
Performed SQL analysis to answer key business questions.

### Patient Analysis

- Total Patients
- Gender Distribution
- City-wise Patients
- Blood Group Analysis
- Age Group Analysis

### Doctor Analysis

- Doctors by Specialization
- Average Consultation Fee
- Experience Analysis
- Doctors by Department

### Appointment Analysis

- Appointment Status
- Monthly Appointments
- Department-wise Appointments
- Follow-up Analysis
- Top Diagnoses

### Financial Analysis

- Monthly Revenue
- Department Revenue
- Revenue by Doctor
- Payment Mode Analysis
- Payment Status Analysis

### Medication Analysis

- Top Prescribed Medicines
- Medication Status
- Doctor-wise Prescriptions

---

##  Key Performance Indicators (KPIs)
The dashboards monitor the following business KPIs:

- 👤 Total Patients
- 👨‍⚕️ Total Doctors
- 📅 Total Appointments
- ✅ Appointment Completion Rate
- 💰 Total Revenue
- 💳 Average Bill Amount
- 🔄 Follow-up Appointments
- 💊 Active Medications


##  Dashboard Overview
## 🏥 Hospital Overview
Provides a high-level overview of hospital performance.

### Visuals

- Monthly Revenue Trend
- Appointment Status
- Revenue by Department
- Department-wise Appointments
- Patients by City
- Revenue by Payment Mode


## 👨‍⚕️ Patient & Doctor Analytics
Provides patient demographics and doctor performance analysis.

### Visuals

- Gender Distribution
- Age Group Distribution
- Blood Group Distribution
- Top Doctors by Appointments
- Top Doctors by Revenue
- Doctor Specialization
- Average Experience by Specialization


##  Financial & Medication Analytics
Provides financial and medication insights.

### Visuals

- Monthly Revenue
- Payment Status
- Insurance Claims
- Revenue by Doctor
- Top Prescribed Medicines
- Medication Status
- Top Diagnoses
- Revenue by Payment Mode


##  Business Insights

- Identified departments generating the highest revenue.
- Analyzed patient demographics across cities.
- Evaluated doctor performance and workload.
- Monitored appointment completion rates.
- Tracked payment methods and insurance claims.
- Identified frequently prescribed medications.
- Enabled interactive filtering for management reporting.

## KPI 1: Total Patients
### Business Question
How many patients are registered in the hospital?

```sql
SELECT COUNT(*) AS Total_Patients
FROM patients;
```

### Output

*(Insert Screenshot: Total_Patients.png)*

### Business Insight

- Displays the total number of registered patients.
- Helps hospital management understand patient volume.
- Useful for monitoring hospital growth and planning healthcare resources.


## KPI 2: Total Doctors
### Business Question
How many doctors are currently working in the hospital?

```sql
SELECT COUNT(*) AS Total_Doctors
FROM doctors;
```

### Output

*(Insert Screenshot: Total_Doctors.png)*

### Business Insight

- Shows the total number of doctors available.
- Helps evaluate doctor availability across departments.
- Supports workforce planning and recruitment decisions.


## KPI 3: Total Appointments
### Business Question
How many appointments have been scheduled?


```sql
SELECT COUNT(*) AS Total_Appointments
FROM appointments;
```

### Output

*(Insert Screenshot: Total_Appointments.png)*

### Business Insight

- Represents the total number of patient appointments.
- Helps measure hospital workload.
- Useful for analyzing patient demand and operational capacity.


## KPI 4: Appointment Completion Rate
### Business Question
What percentage of appointments were successfully completed?


```sql
SELECT
ROUND(
COUNT(CASE WHEN status='Completed' THEN 1 END)
*100.0/COUNT(*),2
) AS Appointment_Completion_Rate
FROM appointments;
```

### Output

*(Insert Screenshot: Appointment_Completion_Rate.png)*

### Business Insight

- Measures hospital operational efficiency.
- Higher completion rates indicate better appointment management.
- Helps identify issues such as cancellations or no-shows.


## KPI 5: Total Revenue
### Business Question
How much total revenue has the hospital generated?

```sql
SELECT
ROUND(SUM(net_amount),2) AS Total_Revenue
FROM bills;
```

### Output

*(Insert Screenshot: Total_Revenue.png)*

### Business Insight

- Displays total hospital revenue after discounts and insurance adjustments.
- Helps monitor financial performance.
- Supports revenue planning and budgeting.


## KPI 6: Average Bill Amount
### Business Question
What is the average billing amount per patient visit?

```sql
SELECT
ROUND(AVG(net_amount),2) AS Average_Bill_Amount
FROM bills;
```

### Output

*(Insert Screenshot: Average_Bill_Amount.png)*

### Business Insight

- Represents the average revenue earned per patient visit.
- Helps analyze billing trends.
- Useful for evaluating pricing strategies and service utilization.


## KPI 7: Follow-up Appointments
### Business Question
How many appointments require follow-up consultations?

```sql
SELECT
COUNT(*) AS Follow_Up_Appointments
FROM appointments
WHERE follow_up_required = 1;
```

### Output

*(Insert Screenshot: Follow_Up_Appointments.png)*

### Business Insight

- Indicates patients requiring additional medical attention.
- Helps hospitals monitor continuity of care.
- Supports effective follow-up scheduling and patient management.

---

## KPI 8: Active Medications
### Business Question
How many active medication prescriptions are currently in progress?


```sql
SELECT
COUNT(*) AS Active_Medications
FROM medications
WHERE status = 'Active';
```

### Output

*(Insert Screenshot: Active_Medications.png)*

### Business Insight

- Displays the number of active medication prescriptions.
- Helps monitor ongoing treatments.
- Supports pharmacy inventory management and patient care planning.

##  Future Enhancements

- Patient readmission prediction using Machine Learning.
- Real-time dashboard with scheduled refresh.
- Doctor performance scorecards.
- Patient satisfaction analytics.
- Hospital resource utilization dashboard.
- Revenue forecasting.


##  Author

**Prajakta Bhondave**

**Aspiring Data Analyst | SQL | Power BI | Python | Excel | Data Visualization**
- 💼 LinkedIn: https://www.linkedin.com/in/prajakta-bhondave-773b092a6
- 💻 GitHub: https://github.com/prajakta-89
