/*Q1 | Marks: 3
List the first 10 patients from the city ‘Bengaluru’, showing patient_id, full name, city, and blood group.
*/
-- SOLUTION ...
SELECT
    patient_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    city,
    blood_group
FROM patients
WHERE city = 'Bengaluru'
LIMIT 10;



/*Q2  | Marks: 3
Display all doctors who are currently ‘Active’ and have more than 10 years of experience.
*/
-- SOLUTION ...
SELECT
    doctor_id,
    first_name,
    last_name,
    specialization,
    experience_years
FROM doctors
WHERE status = 'Active'
  AND experience_years > 10;



/*Q3 | Marks: 5
Find the total number of patients treated by each doctor.
Display doctor_id, doctor name, and patient_count.
*/
-- SOLUTION ...
SELECT
    d.doctor_id,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    COUNT(DISTINCT a.patient_id) AS patient_count
FROM doctors d
JOIN appointments a
    ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name;



/*Q4                                                                                                                                    Marks: 4
For each payment mode, find how many bills are ‘Paid’ and their total net_amount.
*/
-- SOLUTION ...
SELECT
    payment_mode,
    COUNT(*) AS paid_bill_count,
    SUM(net_amount) AS total_net_amount
FROM bills
WHERE payment_status = 'Paid'
GROUP BY payment_mode;


/*Q5                                                                                                                                     Marks: 5
Show top 5 departments with the highest total revenue generated from patient bills.
*/
-- SOLUTION ...
SELECT
    dep.department_id,
    dep.department_name,
    SUM(b.net_amount) AS total_revenue
FROM departments dep
JOIN doctors d
    ON dep.department_id = d.department_id
JOIN bills b
    ON d.doctor_id = b.doctor_id
WHERE b.payment_status = 'Paid'
GROUP BY dep.department_id, dep.department_name
ORDER BY total_revenue DESC
LIMIT 5;



/*Q6                                                                                                                                       Marks: 4
Create a view named “vw_doctor_revenue” that displays each doctor’s total revenue collected from paid bills.
The view should include:
●	Doctor ID
●	Doctor Full Name
●	Total Revenue (sum of net_amount from paid bills)
Then write a query to:
1.	Select all columns from vw_doctor_revenue.
2.	Display only those doctors whose total revenue exceeds ₹1000
*/
-- SOLUTION ...
CREATE VIEW vw_doctor_revenue AS
SELECT
    d.doctor_id,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_full_name,
    SUM(b.net_amount) AS total_revenue
FROM doctors d
JOIN bills b
    ON d.doctor_id = b.doctor_id
WHERE b.payment_status = 'Paid'
GROUP BY d.doctor_id, d.first_name, d.last_name;

SELECT * FROM vw_doctor_revenue;

SELECT *
FROM vw_doctor_revenue
WHERE total_revenue > 1000;



/*Q7                                                                                                                                                    Marks: 5
Identify the top 5 patients who have paid the highest total amount across all their bills.
Show patient name and total amount paid.
*/
-- SOLUTION ...
SELECT
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    SUM(b.net_amount) AS total_amount_paid
FROM patients p
JOIN bills b
    ON p.patient_id = b.patient_id
WHERE b.payment_status = 'Paid'
GROUP BY p.first_name, p.last_name
ORDER BY total_amount_paid DESC
LIMIT 5;



/*Q8                                                                                                                                                     Marks: 4
Show a list of medications prescribed by doctors belonging to departments whose name contains ‘ology’
 (like Cardiology, Neurology, etc.).
 */
-- SOLUTION ...
SELECT
    m.medication_id,
    m.generic_name,
    m.brand_name,
    m.dosage,
    m.frequency,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    dep.department_name
FROM medications m
JOIN doctors d
     ON m.doctor_id = d.doctor_id
JOIN departments dep
     ON d.department_id = dep.department_id
WHERE dep.department_name LIKE '%ology%';



/*Q9                                                                                                                                                     Marks: 5
Using a window function, list the top 3 earning patients per city based on total amount paid (net_amount from bills).
Output should include:
●	City
●	Patient Name
●	Total Paid
●	Rank within the city
Use RANK() or DENSE_RANK() with PARTITION BY city.
(Hint: Use a subquery to filter only rows where rank_in_city <= 3.)
*/
-- SOLUTION ...
SELECT
    city,
    patient_name,
    total_paid,
    city_rank
FROM (
    SELECT
        p.city,
        CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
        SUM(b.net_amount) AS total_paid,
        DENSE_RANK() OVER (
            PARTITION BY p.city
            ORDER BY SUM(b.net_amount) DESC
        ) AS city_rank
    FROM patients p
    JOIN bills b
        ON p.patient_id = b.patient_id
    WHERE b.payment_status = 'Paid'
    GROUP BY p.city, p.first_name, p.last_name
) ranked_patients
WHERE city_rank <= 3
ORDER BY city, city_rank;



/*Q10                                                                                                                                              Marks: 4
Increase the discount by 5% for all bills where payment_status = ‘Pending’.
Before updating:
1.	Check how many such records exist.
2.	Preview a few rows.
After update:
3.	Verify that discounts are correctly applied.
*/
-- SOLUTION ...
SELECT COUNT(*) AS pending_bill_count
FROM bills
WHERE payment_status = 'Pending';

SELECT bill_id, discount, net_amount
FROM bills
WHERE payment_status = 'Pending'
LIMIT 5;

UPDATE bills
SET discount = discount * 1.05
WHERE payment_status = 'Pending';

SELECT bill_id, discount
FROM bills
WHERE payment_status = 'Pending'
LIMIT 5;



/*Q11                                                                                                                                                  Marks: 5
Part A – CTE:
Write a CTE (Common Table Expression) to find doctors who have handled more than 8 appointments.
Display doctor_id, doctor_name, and appointment_count.
Part B – Trigger:
Create a trigger named trg_update_discount that automatically updates the discount field in the bills table
to 10% of net_amount whenever a new bill is inserted with a NULL discount
*/
-- SOLUTION ...
WITH doctor_appointments AS (
    SELECT
        d.doctor_id,
        CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
        COUNT(a.appointment_id) AS appointment_count
    FROM doctors d
    JOIN appointments a
        ON d.doctor_id = a.doctor_id
    GROUP BY d.doctor_id, d.first_name, d.last_name
)
SELECT
    doctor_id,
    doctor_name,
    appointment_count
FROM doctor_appointments
WHERE appointment_count > 8;

DELIMITER $$

CREATE TRIGGER trg_update_discount
BEFORE INSERT ON bills
FOR EACH ROW
BEGIN
    IF NEW.discount IS NULL THEN
        SET NEW.discount = NEW.net_amount * 0.10;
    END IF;
END$$

DELIMITER ;




/*Q12 (DDL Task)                                                                                                                         Marks: 3
Create a new database named ‘Hospital_Training_DB’ and inside it create two tables:
test_doctors and test_patients.
Requirements:
1.	test_doctors table:
o	doctor_id (INT, Primary Key, Auto Increment)
o	first_name (VARCHAR(50), Not Null)
o	last_name (VARCHAR(50), Not Null)
o	specialization (VARCHAR(100))
o	experience_years (INT)
2.	test_patients table:
o	patient_id (INT, Primary Key, Auto Increment)
o	first_name (VARCHAR(50), Not Null)
o	last_name (VARCHAR(50), Not Null)
o	doctor_id (INT, Foreign Key references test_doctors(doctor_id))
o	city (VARCHAR(100))
Once created, insert two records in each table and verify the relationship using a JOIN query.
*/
-- SOLUTION ...
CREATE DATABASE Hospital_Training_DB;
USE Hospital_Training_DB;

CREATE TABLE test_doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100),
    experience_years INT
);

CREATE TABLE test_patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    doctor_id INT,
    city VARCHAR(100),
    FOREIGN KEY (doctor_id)
        REFERENCES test_doctors(doctor_id)
);

INSERT INTO test_doctors (first_name, last_name, specialization, experience_years)
VALUES
('Amit', 'Sharma', 'Cardiology', 12),
('Neha', 'Patil', 'Neurology', 8);

INSERT INTO test_patients (first_name, last_name, doctor_id, city)
VALUES
('Rahul', 'Mehta', 1, 'Mumbai'),
('Sneha', 'Kulkarni', 2, 'Pune');

SELECT
    p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    p.city,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    d.specialization
FROM test_patients p
JOIN test_doctors d
    ON p.doctor_id = d.doctor_id;

