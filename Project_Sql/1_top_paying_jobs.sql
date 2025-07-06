/*
Question: What are the top-paying data scientist jobs?
– Identify the top 100 highest-paying Data Analyst roles that are available remotely
– Focuses on job postings with specified salaries (remove nulls)
– BONUS: Include company names of top 100 roles
– Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options
*/

SELECT job_title_short,
    salary_year_avg,
    name company_name, 
    job_work_from_home, 
    job_location,
    job_schedule_type
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short IN ('Data Scientist') 
    AND salary_year_avg IS NOT NULL 
    AND job_work_from_home = 'True'
ORDER BY salary_year_avg DESC
LIMIT 100;