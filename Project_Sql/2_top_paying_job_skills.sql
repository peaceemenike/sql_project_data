/*
Question: What skills are required for the top-paying data scientist and data scientist jobs?
– Add the specific skills required for these roles
– Why? It provides a detailed look at which high-paying jobs demand certain skills,
   helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS(
    SELECT
    job_id, 
    job_title_short, 
    salary_year_avg, 
    job_work_from_home, 
    name AS company_name
    FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short IN ('Data Scientist') 
    AND salary_year_avg IS NOT NULL 
    AND job_work_from_home = 'True'
    
)
SELECT top_paying_jobs.*, skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC
LIMIT 100;



/**
🔍 Here's the breakdown of the most demanded skills for data scientists in 2023, based on top-paying job postings:
Python leads with a bold count of 14.
SQL follows with 10, showcasing its importance even in data science roles.
Spark (7) and Tableau (6) remain key tools.
AWS, PyTorch, and TensorFlow each appear 5 times, indicating strong demand for cloud and ML frameworks.
Skills like Hadoop, Java, R, and scikit-learn show moderate demand.

[
  {
    "job_id": 40145,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "550000.0",
    "job_work_from_home": true,
    "company_name": "Selby Jennings",
    "skills": "sql"
  },
  {
    "job_id": 40145,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "550000.0",
    "job_work_from_home": true,
    "company_name": "Selby Jennings",
    "skills": "python"
  },
  {
    "job_id": 1714768,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "525000.0",
    "job_work_from_home": true,
    "company_name": "Selby Jennings",
    "skills": "sql"
  },
  {
    "job_id": 1131472,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "375000.0",
    "job_work_from_home": true,
    "company_name": "Algo Capital Group",
    "skills": "sql"
  },
  {
    "job_id": 1131472,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "375000.0",
    "job_work_from_home": true,
    "company_name": "Algo Capital Group",
    "skills": "python"
  },
  {
    "job_id": 1131472,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "375000.0",
    "job_work_from_home": true,
    "company_name": "Algo Capital Group",
    "skills": "java"
  },
  {
    "job_id": 1131472,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "375000.0",
    "job_work_from_home": true,
    "company_name": "Algo Capital Group",
    "skills": "cassandra"
  },
  {
    "job_id": 1131472,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "375000.0",
    "job_work_from_home": true,
    "company_name": "Algo Capital Group",
    "skills": "spark"
  },
  {
    "job_id": 1131472,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "375000.0",
    "job_work_from_home": true,
    "company_name": "Algo Capital Group",
    "skills": "hadoop"
  },
  {
    "job_id": 1131472,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "375000.0",
    "job_work_from_home": true,
    "company_name": "Algo Capital Group",
    "skills": "tableau"
  },
  {
    "job_id": 126218,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "320000.0",
    "job_work_from_home": true,
    "company_name": "Teramind",
    "skills": "azure"
  },
  {
    "job_id": 126218,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "320000.0",
    "job_work_from_home": true,
    "company_name": "Teramind",
    "skills": "aws"
  },
  {
    "job_id": 126218,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "320000.0",
    "job_work_from_home": true,
    "company_name": "Teramind",
    "skills": "tensorflow"
  },
  {
    "job_id": 126218,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "320000.0",
    "job_work_from_home": true,
    "company_name": "Teramind",
    "skills": "keras"
  },
  {
    "job_id": 126218,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "320000.0",
    "job_work_from_home": true,
    "company_name": "Teramind",
    "skills": "pytorch"
  },
  {
    "job_id": 126218,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "320000.0",
    "job_work_from_home": true,
    "company_name": "Teramind",
    "skills": "scikit-learn"
  },
  {
    "job_id": 126218,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "320000.0",
    "job_work_from_home": true,
    "company_name": "Teramind",
    "skills": "datarobot"
  },
  {
    "job_id": 457991,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "job_work_from_home": true,
    "company_name": "Lawrence Harvey",
    "skills": "python"
  },
  {
    "job_id": 457991,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "job_work_from_home": true,
    "company_name": "Lawrence Harvey",
    "skills": "aws"
  },
  {
    "job_id": 457991,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "job_work_from_home": true,
    "company_name": "Lawrence Harvey",
    "skills": "gcp"
  },
  {
    "job_id": 38905,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "job_work_from_home": true,
    "company_name": "Storm5",
    "skills": "sql"
  },
  {
    "job_id": 38905,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "job_work_from_home": true,
    "company_name": "Storm5",
    "skills": "python"
  },
  {
    "job_id": 38905,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "job_work_from_home": true,
    "company_name": "Storm5",
    "skills": "java"
  },
  {
    "job_id": 38905,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "job_work_from_home": true,
    "company_name": "Storm5",
    "skills": "c"
  },
  {
    "job_id": 38905,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "job_work_from_home": true,
    "company_name": "Storm5",
    "skills": "aws"
  },
  {
    "job_id": 38905,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "job_work_from_home": true,
    "company_name": "Storm5",
    "skills": "gcp"
  },
  {
    "job_id": 129924,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "job_work_from_home": true,
    "company_name": "Storm4",
    "skills": "python"
  },
  {
    "job_id": 129924,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "job_work_from_home": true,
    "company_name": "Storm4",
    "skills": "pandas"
  },
  {
    "job_id": 129924,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "job_work_from_home": true,
    "company_name": "Storm4",
    "skills": "numpy"
  },
  {
    "job_id": 226011,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "job_work_from_home": true,
    "company_name": "Walmart",
    "skills": "scala"
  },
  {
    "job_id": 226011,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "job_work_from_home": true,
    "company_name": "Walmart",
    "skills": "java"
  },
  {
    "job_id": 226011,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "job_work_from_home": true,
    "company_name": "Walmart",
    "skills": "spark"
  },
  {
    "job_id": 226011,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "job_work_from_home": true,
    "company_name": "Walmart",
    "skills": "tensorflow"
  },
  {
    "job_id": 226011,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "job_work_from_home": true,
    "company_name": "Walmart",
    "skills": "pytorch"
  },
  {
    "job_id": 226011,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "300000.0",
    "job_work_from_home": true,
    "company_name": "Walmart",
    "skills": "kubernetes"
  },
  {
    "job_id": 178888,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "288000.0",
    "job_work_from_home": true,
    "company_name": "Teradata",
    "skills": "sql"
  },
  {
    "job_id": 178888,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "288000.0",
    "job_work_from_home": true,
    "company_name": "Teradata",
    "skills": "python"
  },
  {
    "job_id": 178888,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "288000.0",
    "job_work_from_home": true,
    "company_name": "Teradata",
    "skills": "nosql"
  },
  {
    "job_id": 178888,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "288000.0",
    "job_work_from_home": true,
    "company_name": "Teradata",
    "skills": "r"
  },
  {
    "job_id": 178888,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "288000.0",
    "job_work_from_home": true,
    "company_name": "Teradata",
    "skills": "sas"
  },
  {
    "job_id": 178888,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "288000.0",
    "job_work_from_home": true,
    "company_name": "Teradata",
    "skills": "matlab"
  },
  {
    "job_id": 178888,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "288000.0",
    "job_work_from_home": true,
    "company_name": "Teradata",
    "skills": "azure"
  },
  {
    "job_id": 178888,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "288000.0",
    "job_work_from_home": true,
    "company_name": "Teradata",
    "skills": "databricks"
  },
  {
    "job_id": 178888,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "288000.0",
    "job_work_from_home": true,
    "company_name": "Teradata",
    "skills": "aws"
  },
  {
    "job_id": 178888,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "288000.0",
    "job_work_from_home": true,
    "company_name": "Teradata",
    "skills": "redshift"
  },
  {
    "job_id": 178888,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "288000.0",
    "job_work_from_home": true,
    "company_name": "Teradata",
    "skills": "oracle"
  },
  {
    "job_id": 178888,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "288000.0",
    "job_work_from_home": true,
    "company_name": "Teradata",
    "skills": "snowflake"
  },
  {
    "job_id": 178888,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "288000.0",
    "job_work_from_home": true,
    "company_name": "Teradata",
    "skills": "spark"
  },
  {
    "job_id": 178888,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "288000.0",
    "job_work_from_home": true,
    "company_name": "Teradata",
    "skills": "tableau"
  },
  {
    "job_id": 178888,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "288000.0",
    "job_work_from_home": true,
    "company_name": "Teradata",
    "skills": "sas"
  },
  {
    "job_id": 178888,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "288000.0",
    "job_work_from_home": true,
    "company_name": "Teradata",
    "skills": "qlik"
  },
  {
    "job_id": 1177572,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "280000.0",
    "job_work_from_home": true,
    "company_name": "Home Depot / THD",
    "skills": "sql"
  },
  {
    "job_id": 1177572,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "280000.0",
    "job_work_from_home": true,
    "company_name": "Home Depot / THD",
    "skills": "bigquery"
  },
  {
    "job_id": 1177572,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "280000.0",
    "job_work_from_home": true,
    "company_name": "Home Depot / THD",
    "skills": "tableau"
  },
  {
    "job_id": 158782,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "275000.0",
    "job_work_from_home": true,
    "company_name": "Algo Capital Group",
    "skills": "sql"
  },
  {
    "job_id": 158782,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "275000.0",
    "job_work_from_home": true,
    "company_name": "Algo Capital Group",
    "skills": "python"
  },
  {
    "job_id": 158782,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "275000.0",
    "job_work_from_home": true,
    "company_name": "Algo Capital Group",
    "skills": "java"
  },
  {
    "job_id": 158782,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "275000.0",
    "job_work_from_home": true,
    "company_name": "Algo Capital Group",
    "skills": "cassandra"
  },
  {
    "job_id": 158782,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "275000.0",
    "job_work_from_home": true,
    "company_name": "Algo Capital Group",
    "skills": "aws"
  },
  {
    "job_id": 158782,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "275000.0",
    "job_work_from_home": true,
    "company_name": "Algo Capital Group",
    "skills": "spark"
  },
  {
    "job_id": 158782,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "275000.0",
    "job_work_from_home": true,
    "company_name": "Algo Capital Group",
    "skills": "airflow"
  },
  {
    "job_id": 158782,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "275000.0",
    "job_work_from_home": true,
    "company_name": "Algo Capital Group",
    "skills": "hadoop"
  },
  {
    "job_id": 158782,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "275000.0",
    "job_work_from_home": true,
    "company_name": "Algo Capital Group",
    "skills": "tableau"
  },
  {
    "job_id": 1325996,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "265000.0",
    "job_work_from_home": true,
    "company_name": "ZealoTech People",
    "skills": "sql"
  },
  {
    "job_id": 1325996,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "265000.0",
    "job_work_from_home": true,
    "company_name": "ZealoTech People",
    "skills": "python"
  },
  {
    "job_id": 1325996,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "265000.0",
    "job_work_from_home": true,
    "company_name": "ZealoTech People",
    "skills": "r"
  },
  {
    "job_id": 1325996,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "265000.0",
    "job_work_from_home": true,
    "company_name": "ZealoTech People",
    "skills": "spark"
  },
  {
    "job_id": 1325996,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "265000.0",
    "job_work_from_home": true,
    "company_name": "ZealoTech People",
    "skills": "numpy"
  },
  {
    "job_id": 1325996,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "265000.0",
    "job_work_from_home": true,
    "company_name": "ZealoTech People",
    "skills": "hadoop"
  },
  {
    "job_id": 1325996,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "265000.0",
    "job_work_from_home": true,
    "company_name": "ZealoTech People",
    "skills": "tensorflow"
  },
  {
    "job_id": 1325996,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "265000.0",
    "job_work_from_home": true,
    "company_name": "ZealoTech People",
    "skills": "pytorch"
  },
  {
    "job_id": 1325996,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "265000.0",
    "job_work_from_home": true,
    "company_name": "ZealoTech People",
    "skills": "gdpr"
  },
  {
    "job_id": 1325996,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "265000.0",
    "job_work_from_home": true,
    "company_name": "ZealoTech People",
    "skills": "scikit-learn"
  },
  {
    "job_id": 1325996,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "265000.0",
    "job_work_from_home": true,
    "company_name": "ZealoTech People",
    "skills": "tableau"
  },
  {
    "job_id": 1325996,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "265000.0",
    "job_work_from_home": true,
    "company_name": "ZealoTech People",
    "skills": "power bi"
  },
  {
    "job_id": 1325996,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "265000.0",
    "job_work_from_home": true,
    "company_name": "ZealoTech People",
    "skills": "qlik"
  },
  {
    "job_id": 1325996,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "265000.0",
    "job_work_from_home": true,
    "company_name": "ZealoTech People",
    "skills": "kubernetes"
  },
  {
    "job_id": 1325996,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "265000.0",
    "job_work_from_home": true,
    "company_name": "ZealoTech People",
    "skills": "docker"
  },
  {
    "job_id": 257651,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "265000.0",
    "job_work_from_home": true,
    "company_name": "Storm6",
    "skills": "python"
  },
  {
    "job_id": 257651,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "265000.0",
    "job_work_from_home": true,
    "company_name": "Storm6",
    "skills": "opencv"
  },
  {
    "job_id": 89798,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "265000.0",
    "job_work_from_home": true,
    "company_name": "Cnam - Auditeurs - Accueil",
    "skills": "python"
  },
  {
    "job_id": 89798,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "265000.0",
    "job_work_from_home": true,
    "company_name": "Cnam - Auditeurs - Accueil",
    "skills": "tensorflow"
  },
  {
    "job_id": 89798,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "265000.0",
    "job_work_from_home": true,
    "company_name": "Cnam - Auditeurs - Accueil",
    "skills": "pytorch"
  },
  {
    "job_id": 294863,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "262500.0",
    "job_work_from_home": true,
    "company_name": "Movable Ink",
    "skills": "sql"
  },
  {
    "job_id": 294863,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "262500.0",
    "job_work_from_home": true,
    "company_name": "Movable Ink",
    "skills": "python"
  },
  {
    "job_id": 294863,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "262500.0",
    "job_work_from_home": true,
    "company_name": "Movable Ink",
    "skills": "bigquery"
  },
  {
    "job_id": 294863,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "262500.0",
    "job_work_from_home": true,
    "company_name": "Movable Ink",
    "skills": "spark"
  },
  {
    "job_id": 294863,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "262500.0",
    "job_work_from_home": true,
    "company_name": "Movable Ink",
    "skills": "tensorflow"
  },
  {
    "job_id": 294863,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "262500.0",
    "job_work_from_home": true,
    "company_name": "Movable Ink",
    "skills": "pytorch"
  },
  {
    "job_id": 294863,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "262500.0",
    "job_work_from_home": true,
    "company_name": "Movable Ink",
    "skills": "scikit-learn"
  },
  {
    "job_id": 294863,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "262500.0",
    "job_work_from_home": true,
    "company_name": "Movable Ink",
    "skills": "tableau"
  },
  {
    "job_id": 294863,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "262500.0",
    "job_work_from_home": true,
    "company_name": "Movable Ink",
    "skills": "looker"
  },
  {
    "job_id": 245928,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "262500.0",
    "job_work_from_home": true,
    "company_name": "Stealth",
    "skills": "sql"
  },
  {
    "job_id": 245928,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "262500.0",
    "job_work_from_home": true,
    "company_name": "Stealth",
    "skills": "python"
  },
  {
    "job_id": 245928,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "262500.0",
    "job_work_from_home": true,
    "company_name": "Stealth",
    "skills": "scala"
  },
  {
    "job_id": 245928,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "262500.0",
    "job_work_from_home": true,
    "company_name": "Stealth",
    "skills": "r"
  },
  {
    "job_id": 245928,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "262500.0",
    "job_work_from_home": true,
    "company_name": "Stealth",
    "skills": "spark"
  },
  {
    "job_id": 245928,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "262500.0",
    "job_work_from_home": true,
    "company_name": "Stealth",
    "skills": "hadoop"
  },
  {
    "job_id": 199110,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "253500.0",
    "job_work_from_home": true,
    "company_name": "Stitch Fix",
    "skills": "python"
  },
  {
    "job_id": 1275762,
    "job_title_short": "Data Scientist",
    "salary_year_avg": "252500.0",
    "job_work_from_home": true,
    "company_name": "Strativ Group",
    "skills": "python"
  }
]
**/










