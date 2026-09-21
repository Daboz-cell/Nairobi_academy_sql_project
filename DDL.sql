
-- Section A - Building the Database (DDL)
-- DDL commands: CREATE,ALTER,DROP,TRUNCATE,RENAME
-- Create the schema and switch to it so every statement below runs inside it.
CREATE SCHEMA nairobi_academy;
SET search_path = nairobi_academy;

-- Table: students
-- Stores information about each student enrolled at the school.
CREATE TABLE students (
    student_id    INT PRIMARY KEY,
    first_name    VARCHAR(50) NOT NULL,
    last_name     VARCHAR(50) NOT NULL,
    gender        VARCHAR(1),
    date_of_birth DATE,
    class         VARCHAR(10),
    city          VARCHAR(50)
);

-- Table: subjects
-- Stores information about each subject offered at the school.
CREATE TABLE subjects (
    subject_id   INT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL UNIQUE,
    department   VARCHAR(50),
    teacher_name VARCHAR(100),
    credits      INT
);

-- Table: exam_results
-- Records each student's exam result for each subject.
CREATE TABLE exam_results (
    result_id  INT PRIMARY KEY,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    marks      INT NOT NULL,
    exam_date  DATE,
    grade      VARCHAR(2)
);


-- The school realised they forgot a phone number column.
ALTER TABLE students
    ADD COLUMN phone_number VARCHAR(20);

-- "credits" was renamed to the clearer "credit_hours".
ALTER TABLE subjects
    RENAME COLUMN credits TO credit_hours;

-- The phone_number column turned out not to be needed after all.
ALTER TABLE students
    DROP COLUMN phone_number;



