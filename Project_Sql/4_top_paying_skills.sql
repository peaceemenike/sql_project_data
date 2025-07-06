/*
Answer: What are the top skills based on salary?
– Look at the average salary associated with each skill for Data Scientist positions
– Focuses on roles with specified salaries, regardless of location
– Why? It reveals how different skills impact salary levels for Data Scientist and
  helps identify the most financially rewarding skills to acquire or improve
*/



SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Scientist' 
    AND salary_year_avg IS NOT NULL 
    AND job_work_from_home = TRUE
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25




/*
Here are top paying skills for data Scientist, the 
top 25, can you provide some quick insights into 
some trends into the top paying jobs

Emerging Tech & Automation Dominate: Top-paying roles favor skills in Golang, Rust, Solidity, 
Elixir, OpenCV, and DataRobot, reflecting demand for cutting-edge programming, automation, and AI-driven solutions.

High-Value Infrastructure & Compliance: Tools like GDPR, Neo4j, Cassandra, DynamoDB, and Watson 
highlight the premium placed on data governance, privacy compliance, and scalable data infrastructure.

BI, Workflow, and Legacy Tech Still Pay: Skills in Tidyverse, Qlik, MicroStrategy, Airflow, Slack, and even C, 
PHP, Julia show that data storytelling, task orchestration, and legacy system integration remain financially rewarding.


[
  {
    "skills": "gdpr",
    "avg_salary": "217738"
  },
  {
    "skills": "golang",
    "avg_salary": "208750"
  },
  {
    "skills": "atlassian",
    "avg_salary": "189700"
  },
  {
    "skills": "selenium",
    "avg_salary": "180000"
  },
  {
    "skills": "opencv",
    "avg_salary": "172500"
  },
  {
    "skills": "neo4j",
    "avg_salary": "171655"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "171147"
  },
  {
    "skills": "dynamodb",
    "avg_salary": "169670"
  },
  {
    "skills": "php",
    "avg_salary": "168125"
  },
  {
    "skills": "tidyverse",
    "avg_salary": "165513"
  },
  {
    "skills": "solidity",
    "avg_salary": "165000"
  },
  {
    "skills": "c",
    "avg_salary": "164865"
  },
  {
    "skills": "go",
    "avg_salary": "164691"
  },
  {
    "skills": "datarobot",
    "avg_salary": "164500"
  },
  {
    "skills": "qlik",
    "avg_salary": "164485"
  },
  {
    "skills": "redis",
    "avg_salary": "162500"
  },
  {
    "skills": "watson",
    "avg_salary": "161710"
  },
  {
    "skills": "rust",
    "avg_salary": "161250"
  },
  {
    "skills": "elixir",
    "avg_salary": "161250"
  },
  {
    "skills": "cassandra",
    "avg_salary": "160850"
  },
  {
    "skills": "looker",
    "avg_salary": "158715"
  },
  {
    "skills": "slack",
    "avg_salary": "158333"
  },
  {
    "skills": "terminal",
    "avg_salary": "157500"
  },
  {
    "skills": "airflow",
    "avg_salary": "157414"
  },
  {
    "skills": "julia",
    "avg_salary": "157244"
  }
]