CREATE DATABASE Ai_jobs;
USE Ai_jobs;


CREATE TABLE ai_jobs_records (
    job_id INT,
    job_title VARCHAR(255),
    salary_usd DECIMAL(10,2),
    salary_currency VARCHAR(10),
    experience_level VARCHAR(50),
    employment_type VARCHAR(50),
    company_location VARCHAR(100),
    company_size VARCHAR(50),
    employee_residence VARCHAR(100),
    remote_ratio INT,
    required_skills TEXT,
    education_required VARCHAR(100),
    years_experience INT,
    industry VARCHAR(100),
    posting_date VARCHAR(50),
    application_deadline VARCHAR(50),
    job_description_length INT,
    benefits_score DECIMAL(5,2),
    company_name VARCHAR(255)
);
SHOW VARIABLES LIKE 'local_infile';


SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';

SHOW VARIABLES LIKE 'secure_file_priv';


ALTER TABLE ai_jobs_records MODIFY COLUMN job_id VARCHAR(20);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ai_job_dataset.csv'
INTO TABLE ai_jobs_records
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(job_id, job_title, salary_usd, salary_currency, experience_level, employment_type,
 company_location, company_size, employee_residence, remote_ratio, required_skills,
 education_required, years_experience, industry, posting_date, application_deadline,
 job_description_length, benefits_score, company_name);


SELECT COUNT(*) FROM ai_jobs_records;
