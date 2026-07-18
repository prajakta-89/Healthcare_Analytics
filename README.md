# 🏥 Healthcare_Analytics
The Healthcare Analytics Dashboard is an end-to-end data analytics project developed using MySQL and Power BI to analyze hospital operations, patient care, doctor performance, appointments, billing, and medication data.

### Project Overview
Healthcare organizations generate massive volumes of operational and financial data every day through patient registrations, doctor consultations, appointments, billing transactions, and medication prescriptions. Without centralized reporting, it becomes difficult for hospital administrators to monitor performance, optimize resources, and make timely business decisions.

This project presents a comprehensive Healthcare Analytics Dashboard built using MySQL and Power BI. The solution transforms raw healthcare data into meaningful business insights through SQL analysis, interactive dashboards, and KPI reporting.

The project follows a complete analytics lifecycle—from data cleaning and exploratory data analysis (EDA) to KPI development, SQL-based business analysis, data modeling, DAX calculations, and dashboard visualization—providing hospital management with a unified view of operational, financial, and clinical performance.

### Business Problem
Hospital management requires a centralized reporting system to answer critical business questions such as:

How many patients are being treated?
Which departments generate the highest revenue?
Which doctors handle the highest patient volume?
What is the appointment completion rate?
Which payment methods are most commonly used?
Which medications are prescribed most frequently?
How much revenue is generated through insurance claims?
Which departments require operational improvements?


### Project Objectives
Build an end-to-end healthcare analytics solution.
Clean and validate healthcare data using SQL.
Perform exploratory data analysis (EDA) to uncover trends.
Develop business KPIs for hospital performance monitoring.
Analyze patient demographics and healthcare utilization.
Evaluate doctor and department performance.
Monitor appointment status and operational efficiency.
Analyze hospital revenue, billing, and insurance claims.
Track medication prescription patterns.
Design interactive Power BI dashboards for executive reporting.

### Technologies Used
MySQL - Database Management
SQL -	Data Cleaning, EDA, Business Analysis
Power BI - Dashboard Development & Visualization
DAX	KPI - Calculations & Measures
Microsoft - Excel	Data Validation & Quality Checks


### 📁 Project Structure
Healthcare-Analytics/
│
├── Dataset/
│   └── healthcare_dataset.sql
│
├── SQL/
│   ├── 01_Data_Cleaning.sql
│   ├── 02_Exploratory_Data_Analysis.sql
│   ├── 03_KPI_Queries.sql
│   ├── 04_Dashboard_Queries.sql
│   └── 05_Advanced_SQL_Analysis.sql
│
├── PowerBI/
│   └── Healthcare_Analytics_Dashboard.pbix
│
├── Dashboard_Screenshots/
│   ├── Dashboard_1_Hospital_Overview.png
│   ├── Dashboard_2_Patient_Doctor_Analytics.png
│   └── Dashboard_3_Financial_Medication_Analytics.png
│
├── Images/
│   ├── ER_Diagram.png
│   └── Data_Model.png
│
└── README.md


### Database Schema
The project is built using six relational tables:

### 👤 Patients
Stores patient demographic information.
Columns : patient_id
          first_name
          last_name
          gender
          date_of_birth
          phone
          email
          address
          city
          blood_group

### 👨‍⚕️ Doctors
Contains doctor profiles and professional details.
Columns:  doctor_id
          first_name
          last_name
          gender
          specialization
          department_id
          city
          experience_years
          phone
          email
          joining_date
          consultation_fee

### 🏥 Departments
Stores hospital department information.
Columns : department_id
          department_name
          city
          location_floor
          phone_extension
          total_staff
          budget_allocation
          established_year
          shift_timing
          head_doctor_id

          
### 📅 Appointments
Maintains appointment scheduling and consultation details.
Columns : appointment_id
          patient_id
          doctor_id
          department_id
          appointment_date
          appointment_time
          purpose
          diagnosis
          status
          follow_up_required
          follow_up_date
          created_at

### 💳 Bills
Contains hospital billing and payment information.
Columns : bill_id
          appointment_id
          patient_id
          doctor_id
          total_amount
          discount
          insurance_amount
          net_amount
          payment_mode
          payment_status
          billing_date
          due_date
          insurance_claim


### 💊 Medications
Stores prescription and medication details.
Columns : medication_id
          appointment_id
          patient_id
          doctor_id
          generic_name
          brand_name
          dosage
          frequency
          start_date
          end_date
          notes
          status
          prescribed_date

### Data Cleaning
- Data quality checks performed using SQL:
- Duplicate record detection
- Missing value identification
- Invalid gender validation
- Future date validation
- Blood group validation
- Invalid appointment status detection
- Bill amount validation
- Payment status verification
- Medication status validation
- Data consistency checks

### Exploratory Data Analysis (EDA)
Performed extensive SQL analysis to answer business questions:
- Patient demographics
- Gender distribution
- Age group analysis
- Blood group analysis
- City-wise patient distribution
- Doctor specialization analysis
- Department-wise appointments
- Appointment status trends
- Revenue analysis
- Insurance claim analysis
- Payment mode analysis
- Medication prescription analysis
- Department budget utilization

### Key Performance Indicators (KPIs)
The dashboards monitor eight business-critical KPIs:
👤 Total Patients
👨‍⚕️ Total Doctors
📅 Total Appointments
✅ Appointment Completion Rate
💰 Total Revenue
💳 Average Bill Amount
🔄 Follow-up Appointments
💊 Active Medications


### Dashboard Overview
🏥 Dashboard 1 – Hospital Overview
Provides an executive summary of hospital operations.

Visualizations
Monthly Revenue Trend
Appointment Status Distribution
Revenue by Department
Department-wise Appointments
Patients by City
Revenue by Payment Mode
Business Value
Monitor overall hospital performance.
Identify high-performing departments.
Track revenue trends.
Understand appointment completion rates.
Traditional spreadsheet-based reporting makes it difficult to answer these questions quickly and accurately.


### 👨‍⚕️ Dashboard 2 – Patient & Doctor Analytics
Focuses on patient demographics and doctor performance.

Visualizations
Gender Distribution
Age Group Distribution
Blood Group Distribution
Top Doctors by Appointments
Top Doctors by Revenue
Doctor Specialization Analysis
Average Experience by Specialization
Business Value
Analyze patient demographics.
Monitor doctor workload.
Evaluate specialization demand.
Identify top-performing doctors.
This dashboard addresses these challenges by delivering real-time, interactive insights that support strategic and operational decision-making.

### 💰 Dashboard 3 – Financial & Medication Analytics
Provides financial and prescription insights.

Visualizations
Monthly Revenue Trend
Payment Status Analysis
Insurance Claim Distribution
Revenue by Doctor
Top Prescribed Medicines
Medication Status
Top Diagnoses
Revenue by Payment Mode
Business Value
Track hospital revenue.
Monitor payment collections.
Analyze insurance claims.
Understand medication usage trends.


### Key Business Insights
Identified departments contributing the highest hospital revenue.
Evaluated appointment completion and follow-up rates.
Analyzed patient demographics across multiple cities.
Measured doctor performance based on patient volume and revenue.
Monitored payment methods and insurance contributions.
Identified the most frequently prescribed medications.
Enabled interactive filtering for better operational analysis.



### Future Enhancements
Predict patient readmission risk using Machine Learning.
Build real-time dashboards with automated data refresh.
Add physician performance scorecards.
Integrate patient satisfaction survey analytics.
Develop hospital resource utilization dashboards.
Add forecasting for revenue and patient visits.

### Author
Prajakta Bhondave
Aspiring Data Analyst | SQL | Power BI | Python | Excel | Data Visualization
🔗 LinkedIn: 
