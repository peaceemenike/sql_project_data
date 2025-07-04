SELECT 
    job_title_short AS job_title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(MONTH FROM job_posted_date) AS date_month,
    EXTRACT(YEAR FROM job_posted_date) AS date_year,
    EXTRACT(DAY FROM job_posted_date) AS date_day
FROM
    job_postings_fact;
