-- A Handful of Sample SQL Scripts to Demonstrate Data Analysis --

-- Retrieve All Records for a Specific Year
SELECT * FROM ucla_ccc_count WHERE year = 2020;

-- Join Tables to Gather Comprehensive Information
SELECT a.*, b.lat, b.long
FROM ucla_ccc_count a
INNER JOIN college_geocodes b ON a.school = b.school
WHERE year = 2020;

-- Aggregate Data
SELECT year, school, SUM(Adm) as Total_Admissions, SUM(App) as Total_Applications, SUM(Enr) as Total_Enrollments
FROM ucla_ccc_count
GROUP BY year, school;

-- Find the total number of applications, admissions, and enrollments per year
SELECT year, SUM(App) as total_applications, SUM(Adm) as total_admissions, SUM(Enr) as total_enrollments
FROM ucla_ccc_count
GROUP BY year;

-- Identify the schools with the highest and lowest average admitted GPA each year.
SELECT year, 
       MAX(avg_admit_gpa) as highest_avg_admit_gpa,
       MIN(avg_admit_gpa) as lowest_avg_admit_gpa
FROM ucla_avg_combined
GROUP BY year;


-- Calculate the Admission Rate for Each School and Year
SELECT year, school, 
       CAST(SUM(Adm) as FLOAT) / NULLIF(SUM(App),0) as admission_rate
FROM ucla_ccc_count
GROUP BY year, school;

-- Window Function to Rank Schools by Admission Rate for Each Year
SELECT year, school, 
       admission_rate,
       RANK() OVER(PARTITION BY year ORDER BY admission_rate DESC) as rank
FROM (
    SELECT year, school, 
           CAST(SUM(Adm) as FLOAT) / NULLIF(SUM(App),0) as admission_rate
    FROM ucla_ccc_count
    GROUP BY year, school
) as AdmissionRate;

-- Find the correlation between the average admitted GPA and the admission rate per school each year
WITH AdmissionRate AS (
    SELECT year, school, 
           CAST(SUM(Adm) as FLOAT) / NULLIF(SUM(App),0) as admission_rate
    FROM ucla_ccc_count
    GROUP BY year, school
)
SELECT a.year, a.school, a.admission_rate, b.avg_admit_gpa
FROM AdmissionRate a
JOIN ucla_avg_combined b ON a.year = b.year AND a.school = b.school;



