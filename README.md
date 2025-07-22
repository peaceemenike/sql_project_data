README.md
# **Introduction** 
📊 Dive into the data job market! Focusing on data science roles, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and ☑️ where high demand meets high salary in the world of data science.

SQL queries? Check them out here: [Project_sql Folder](/Project_Sql/).

# **Background** 
Driven by a quest to navigate the data science job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others’ work to find optimal jobs.

### **The questions I wanted to answer through my SQL queries were:**
1. What are the top-paying data science jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data science roles?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn



# **Tools I Used**
For my deep dive into the data science job market, I harnessed the power of several key tools:

* **SQL**: The backbone of my analysis, allowing me to query the database and unearth critical insights.
* **PostgreSQL**: The chosen database management system, ideal for handling the job posting data.
* **Visual Studio Code**: My go-to for database management and executing SQL queries.
* **Git & GitHub**: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# **The Analysis** 
Each query for this project aimed at investigating specific aspects of the data science job market. Here’s how I approached each question:

### **1 Top Paying Data Science Jobs**
To identify the highest-paying roles, I filtered data science positions by average yearly salary and location, focusing on remote jobs. This query highlights the high-paying opportunities in the field.
```sql
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
```
**📊 Here's the breakdown of the top data science jobs in 2023:**
* **📈 Wide Salary Range:**
Top 10 paying data science roles range from $300,000 to $550,000, showcasing significant salary potential even at the entry executive level in remote full-time roles.

* **🏢 Diverse Employers:**
Companies like Selby Jennings, Demandbase, Reddit, Walmart, and Algo Capital Group are offering high-paying remote positions, reflecting demand across finance, e-commerce, advertising, and tech sectors.

* **🎓 Job Title Consistency, Role Flexibility:**
Although all roles are titled “Data Scientist”, the variation in pay reflects differing expectations in experience, tech stack, or industry vertical, even within the same title across organizations.
![Top Paying Job Roles](/Project_Sql/assest/DatascienceRole.png)
*Bar graph visualizing the salary for the top 10 remote data science jobs; ChatGPT generated this graph from my SQL query results.*

### **2 Skills Required for Top Paying Jobs in Data Science**
To identify the highest-paying roles, I filtered remote data science positions by average yearly salary and company. Then, I extended the query to include associated skills, highlighting both financial potential and technical demand in the field.
```sql
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
LIMIT 10;
```

**📊 Here's the breakdown of the top remote data science jobs in 2023:**
* **🧾 Wide Salary Range:**
The top 3 companies (Selby Jennings and Algo Capital Group) offer salaries ranging from $375,000 to $550,000, underscoring the earning potential of high-performing data scientists in remote environments.

* **🏢 Diverse Employers:**
Top-paying remote roles are concentrated in Selby Jennings and Algo Capital Group, reflecting high investment in data talent within finance and capital markets.

* **🧠 In-Demand Skills Across Roles:**
The most frequently required skills among the highest-paid roles include:
  * SQL (appears across all job IDs)
  * Python (strong presence in multiple roles)
  * Java, Cassandra, Spark, Hadoop, Tableau (clustered within Algo Capital Group role at $375K)

This suggests a blend of data querying, scripting, big data, and visualization tools is valued at the highest salary tiers.

* **👩‍💻 Job Title Consistency, Skill Diversity:**
Although all roles are titled "Data Scientist", the range of required technical skills points to multi-disciplinary capabilities, with certain employers demanding big data architecture (Spark, Hadoop) alongside business intelligence tools (Tableau).

![Skills for top Paying Data Science Roles](/Project_Sql/assest/skillswithpay.png)
*Here is your black-background bar graph showing the top skills in remote data science jobs by average salary.*

**🧠 Insights:**
* **SQL and Python** top the list in both frequency and salary range.
* Big data tools like **Spark, Hadoop, and Cassandra** are clustered just below, emphasizing demand in distributed systems.
* **Tableau** shows value in roles requiring data visualization and storytelling.


### **🔍 3 Top Demanded Data Science Skills**
To uncover the most in-demand skills for remote data science roles, I used a query that joins job postings with their corresponding skills and filters for data scientists working remotely. The goal was to retrieve the top 25 most frequently requested technical skills, offering career-aligned insights for job seekers.

```sql
SELECT 
    skills,
    COUNT(*) demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Scientist' AND job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY
     demand_count DESC
LIMIT 25;
```

**📊 Here's the breakdown of the top 25 most in-demand data science skills in 2023:**
* 🥇 Python : 10,390 mentions
The backbone of most data workflows; essential for modeling, scripting, and deployment.
* 🥈 SQL : 7,488 mentions
Still critical for data wrangling, extraction, and transformation.
* 🥉 R : 4,674 mentions
Popular in statistics-heavy environments and research.
* ☁️ Cloud Skills :
AWS (2,593), Azure (1,919), GCP (808) – Cloud proficiency is increasingly essential.
* 📊 Visualization Tools:
Tableau (2,458), Power BI (1,125), Excel (1,264)
* 🧠 Machine Learning Libraries:
TensorFlow (1,836), PyTorch (1,607), Scikit-learn (1,252), Keras (679)
* ⚙️ Data Engineering & Big Data:
Spark (2,008), Hadoop (1,214), Databricks (951), Snowflake (759)
* 🧮 Other Core Tools & Libraries:
Pandas (1,836), NumPy (1,195), Git (1,095), Java (1,073), Scala (741), PySpark (706), Docker (676)
### **📊 Top 5 In-Demand Data Science Skills**

| Skills   | Demand Count |
|----------|--------------|
| Python   | 10,390       |
| SQL      | 7,488        |
| R        | 4,674        |
| AWS      | 2,593        |
| Tableau  | 2,458        |
| Sas      | 2,214        |
| Spark    | 2,008        |
| Azure    | 1,919        |
|Tensorflow| 1,836        |
| Pandas   | 1,836        |


### **4 💰Top Paying Data Science Skills (Remote Roles)**
To identify the most financially rewarding skills for remote data scientist roles, we queried positions with specified average salaries. The goal was to find which skills command the highest pay across job postings, helping professionals focus on high-value tools worth mastering.
```sql
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
LIMIT 25;
```


**🧠 Here's the breakdown of the top 25 highest-paying data science skills in 2023:**
* 🥇 GDPR – $217,738
Huge demand for data privacy & compliance expertise.

* 🥈 Golang – $208,750
Modern, scalable backend language, especially in ML infra.

* 🥉 Atlassian – $189,700
High pay for tools like Jira, Confluence in data workflows.

* 🧪 Selenium – $180,000
Valuable for automated testing in AI/ML pipelines.

* 👁️ OpenCV – $172,500
Shows strong interest in computer vision projects.

* 🧠 Neo4j – $171,655
Graph DB skills for complex relationship modeling.

* 📊 MicroStrategy – $171,147
BI platform still drawing top salaries.

* 🛢️ DynamoDB – $169,670
Scalable NoSQL DB skills highly paid.

* 👨‍💻 PHP – $168,125
Legacy tech still in high-salary roles.

* 🧹 Tidyverse – $165,513
Popular R toolkit for data wrangling & viz.

* 💰 Solidity – $165,000
Blockchain smart contracts skill with big payouts.

* 💻 C – $164,865
Critical for low-level optimization & embedded ML.

* 🔁 Go – $164,691
Another modern language with infra efficiency.

* 🤖 DataRobot – $164,500
AutoML expertise in demand.

* 📈 Qlik – $164,485
BI and dashboarding skills with strong ROI.

* 🧠 Redis – $162,500
In-memory data store valued in real-time apps.

* 🧩 Watson – $161,710
IBM’s AI suite still commanding good pay.

* 🦀 Rust – $161,250
Memory-safe systems programming skill.

* 🧬 Elixir – $161,250
Concurrency and fault-tolerance for data pipelines.

* ☁️ Cassandra – $160,850
Distributed DB expertise is highly compensated.

* 👀 Looker – $158,715
Cloud-native BI tools trending upward.

* 💬 Slack – $158,333
Integration and automation in team comms.

* 💻 Terminal – $157,500
Power users of shell/bash scripting still earn big.

* 🌀 Airflow – $157,414
Workflow orchestration skill in production ML.

* 🔣 Julia – $157,244
Emerging language for numerical computing.


| Skill         | Avg Salary ($) |
|---------------|----------------|
| gdpr          | 217,738        |
| golang        | 208,750        |
| atlassian     | 189,700        |
| selenium      | 180,000        |
| opencv        | 172,500        |
| neo4j         | 171,655        |
| microstrategy | 171,147        |
| dynamodb      | 169,670        |
| php           | 168,125        |
| tidyverse     | 165,513        |
| solidity      | 165,000        |
| c             | 164,865        |
| go            | 164,691        |
| datarobot     | 164,500        |
| qlik          | 164,485        |
| redis         | 162,500        |
| watson        | 161,710        |
| rust          | 161,250        |
| elixir        | 161,250        |
| cassandra     | 160,850        |
| looker        | 158,715        |
| slack         | 158,333        |
| terminal      | 157,500        |
| airflow       | 157,414        |
| julia         | 157,244        |


### **5 💡 Optimal Skills to Learn: High Demand + High Pay**
To uncover the most optimal skills to pursue as a data scientist, I used a SQL query that merges job demand with salary insights. It filters remote jobs with disclosed salaries, giving a ranked list of the top 25 skills that are both in demand and offer high average salaries.

```sql
WITH high_demand AS(
    SELECT
        skills_dim.skill_id, 
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Scientist' 
    AND job_work_from_home = TRUE
    AND salary_year_avg IS NOT NULL 
    GROUP BY 
        skills_dim.skill_id
    
 ), average_salary AS (
    SELECT
        skills_job_dim.skill_id, 
        ROUND(AVG(salary_year_avg),0) avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Scientist' 
        AND salary_year_avg IS NOT NULL 
        AND job_work_from_home = TRUE
    GROUP BY 
        skills_job_dim.skill_id
   
 )


SELECT
    high_demand.skill_id, 
    high_demand.skills,
    demand_count,
    avg_salary
FROM high_demand
INNER JOIN average_salary ON high_demand.skill_id = average_salary.skill_id
WHERE demand_count > 10
ORDER BY avg_salary DESC,
    demand_count DESC
LIMIT 25



/*
Precise method of solving the question
*/

SELECT
  skills_dim.skill_id,
  skills_dim.skills,
  COUNT(skills_job_dim.job_id) AS demand_count,
  ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
  job_title_short = 'Data Scientist'
  AND salary_year_avg IS NOT NULL
  AND job_work_from_home = True
GROUP BY
  skills_dim.skill_id
HAVING
  COUNT(skills_job_dim.job_id) > 10
ORDER BY
  avg_salary DESC,
  demand_count DESC
LIMIT 25;

763
```
**🔍 Key Insights from the Data**
* Power Skills that Pay: Languages like C, Go, Scala, and tools like Qlik, Airflow, and BigQuery top the list—combining low-to-medium demand with high financial reward.
* Cloud & Infra Demand: Skills in GCP, AWS, Snowflake, Redshift, and Kubernetes signal demand for cloud-native, scalable infrastructure expertise.
* ML & AI Proficiency: Tools like PyTorch, TensorFlow, Spark, and Scikit-learn dominate—showing that AI/ML expertise pays off.
* Well-Rounded Tech Stack: While Python, Pandas, and SQL may not have the highest pay, their massive demand ensures broad job security.

| Skill          | Avg Salary ($) | Demand Count |
|----------------|----------------|---------------|
| c              | 164,865        | 48            |
| go             | 164,691        | 57            |
| qlik           | 164,485        | 15            |
| looker         | 158,715        | 57            |
| airflow        | 157,414        | 23            |
| bigquery       | 157,142        | 36            |
| scala          | 156,702        | 56            |
| gcp            | 155,811        | 59            |
| snowflake      | 152,687        | 72            |
| pytorch        | 152,603        | 115           |
| redshift       | 151,708        | 36            |
| tensorflow     | 151,536        | 126           |
| jira           | 151,165        | 22            |
| spark          | 150,188        | 149           |
| aws            | 149,630        | 217           |
| numpy          | 149,089        | 73            |
| scikit-learn   | 148,964        | 81            |
| pyspark        | 147,544        | 34            |
| tableau        | 146,970        | 219           |
| nosql          | 146,110        | 31            |
| java           | 145,706        | 64            |
| powerpoint     | 145,139        | 23            |
| pandas         | 144,816        | 113           |
| kubernetes     | 144,498        | 25            |
| python         | 143,828        | 763           |



# **What I Learned** 
Throughout this project, I’ve leveled up my SQL and data analysis skills by digging deep into demand trends and salary insights:

* ✨ Demand-Driven Skill Discovery: Learned how to extract the most frequently mentioned skills in job postings, helping identify what the market truly values for Data Scientist roles.

* 💰 Salary Insights with Joins: Mastered combining multiple tables using INNER JOIN to calculate average salaries by skill, revealing which tools pay the most.

* 📊 Strategic Aggregation: Got comfortable using COUNT() and AVG() together, layered with GROUP BY and HAVING to pull meaningful metrics out of big data.

* 🧠 Career-Optimized Querying: Developed the skill of writing queries with filters like job_work_from_home = TRUE and job_title_short = 'Data Scientist' to target highly relevant remote jobs.

* 🛠️ Data-Backed Recommendations: Used SQL to make data-driven decisions about which tools to learn next, combining both demand and salary metrics in one optimized query.

# **Conclusions**
### **🔍 Insight**
* 🚀 Go, C, and Qlik top the salary chart—making them high-reward skills for those looking to boost income, even if demand is niche.

* 🧱 Python, SQL, AWS, and Tableau remain unbeatable in terms of combined demand and pay, offering both job stability and financial reward.

* 🔍 SQL stands out as a core must-have, appearing in nearly every data stack—crucial for querying, aggregating, and transforming data effectively.

* 🧩 Mastering tools like Pandas, Spark, and Snowflake provides a balanced advantage—skills that show up often and pay competitively.

* 📌 SQL isn’t just for querying—it's a career-planning weapon when used to analyze job market trends and uncover actionable insights.

### **💬 Closing Thoughts**

This project enhanced my SQL skills and provided valuable insights into the remote data science job market. The findings from the analysis serve as a strategic guide for prioritizing skill development and targeting high-value career paths. Aspiring data scientists can position themselves more competitively by focusing on in-demand tools and technologies that also offer high salaries. This exploration underscores the importance of continuous learning and adaptation to rapidly evolving trends in the field of data science.
