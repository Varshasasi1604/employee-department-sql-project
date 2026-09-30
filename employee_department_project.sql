CREATE DATABASE company_db;
USE company_db;
CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);
INSERT INTO department
VALUES
(101, 'IT', 'Chennai'),
(102, 'HR', 'Bangalore'),
(103, 'Finance', 'Chennai'),
(104, 'Marketing', 'Hyderabad'),
(105, 'Sales', 'Bangalore');
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    gender VARCHAR(10),
    salary DECIMAL(10,2),
    hire_date DATE,
    department_id INT,

    FOREIGN KEY (department_id)
    REFERENCES department(department_id)
);
INSERT INTO employee
VALUES
(1001, 'Arun', 'Male', 55000, '2022-01-10', 101),
(1002, 'Priya', 'Female', 65000, '2021-05-15', 101),
(1003, 'Karthik', 'Male', 45000, '2023-03-20', 102),
(1004, 'Divya', 'Female', 75000, '2020-07-12', 103),
(1005, 'Rahul', 'Male', 50000, '2022-11-01', 104),
(1006, 'Anitha', 'Female', 60000, '2021-09-18', 105),
(1007, 'Vijay', 'Male', 90000, '2019-04-25', 101),
(1008, 'Sneha', 'Female', 48000, '2023-08-10', 103),
(1009, 'Ajay', 'Male', 70000, '2020-02-14', 105),
(1010, 'Meena', 'Female', 52000, '2022-06-30', 102);
SELECT * FROM employee;
SELECT employee_id, employee_name
FROM employee;
SELECT * FROM employee WHERE salary > 60000;
SELECT * FROM employee WHERE salary < 60000;
SELECT * FROM employee WHERE department_id = 102;
SELECT MAX(salary) AS average_salary FROM employee;
SELECT AVG(salary) AS average_salary FROM employee;
SELECT COUNT(*) AS total_employees FROM employee;
SELECT
    e.employee_id,
    e.employee_name,
    e.salary,
    e.department_id,
    d.department_name
FROM employee e
INNER JOIN department d
ON e.department_id = d.department_id;
SELECT
    e.employee_id,
    e.employee_name,
    d.department_name
FROM employee e
LEFT JOIN department d
ON e.department_id = d.department_id;
SELECT
    e.employee_id,
    e.employee_name,
    d.department_name
FROM employee e
RIGHT JOIN department d
ON e.department_id = d.department_id;
SELECT department_id,COUNT(employee_id) AS employee_count
FROM employee GROUP BY department_id;
SELECT
    d.department_id,
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM employee e
JOIN department d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;
SELECT department_id, MAX(salary) AS highest_salary FROM employee GROUP BY department_id;
SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    RANK() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS salary_rank FROM employee;
    CREATE VIEW employee_details AS
SELECT
    e.employee_id,
    e.employee_name,
    e.salary,
    e.hire_date,
    e.department_id,
    d.department_name,
    d.location
FROM employee e
JOIN department d
ON e.department_id = d.department_id;
SELECT * FROM employee_details;
SELECT department_id, COUNT(*) AS total_employees
FROM employee
GROUP BY department_id
HAVING COUNT(*) > 2;
SELECT * FROM employee_details;
