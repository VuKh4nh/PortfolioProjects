SELECT * FROM hr


SELECT *
FROM hr
WHERE DATEDIFF(YEAR, birthdate, GETDATE()) < 18

-- What is the gender breakdown of employees in the company?
SELECT hr.gender, COUNT(*) AS count 
FROM hr 
WHERE DATEDIFF(YEAR, birthdate, GETDATE()) >= 18 
GROUP BY gender 

-- What is the race/ethnicity breakdown of employees in the company?
SELECT  race
from hr
group BY race 
-- What is the age distribution of employees in the company?
SELECT 
	min(DATEDIFF(YEAR, birthdate, GETDATE())) AS youngest,
    max(DATEDIFF(YEAR, birthdate, GETDATE())) AS oldest
FROM hr

-- How many employees work at headquarters versus remote locations?
SELECT location, COUNT(location)
FROM hr
GROUP BY location
-- What is the average length of employment for employees who have been terminated?
SELECT AVG(DATEDIFF(DAY,termdate, hire_date)) AS avg_length_employment
FROM hr
WHERE termdate is NOT null

-- How does the gender distribution vary across departments and job titles?
SELECT department, gender, COUNT(*) AS count 
FROM hr 
WHERE DATEDIFF(YEAR, birthdate, GETDATE()) >= 18 
GROUP BY department, gender 
ORDER BY department

--  What is the distribution of job titles across the company?
SELECT jobtitle, COUNT(*) AS count
FROM hr 
WHERE DATEDIFF(YEAR, birthdate, GETDATE()) >= 18 
GROUP BY jobtitle
ORDER BY count 
-- 8. What is the distribution of employees across locations by city and state?

SELECT location_state, COUNT(*) AS count 
FROM hr 
WHERE DATEDIFF(YEAR, birthdate, GETDATE()) >= 18 
GROUP BY location_state
ORDER BY count DESC
