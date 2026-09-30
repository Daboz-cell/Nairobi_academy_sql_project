--Section C: Querrying the data (DQL)
--DQL commands:SELECT

SET search_path = nairobi_academy;

--Query to find all form 4 students
SELECT * FROM students
WHERE class = 'Form 4';

--Query to find all subjects in the Sciences department.
SELECT * FROM subjects
WHERE department = 'Sciences';

--Query to find all exam results where marks are 70 or above.
SELECT * FROM exam_results
WHERE marks >= 70;

--Query to find all female students.
SELECT * FROM students
WHERE gender = 'F';

--Query to find all students who are in Form 3 AND from Nairobi.
SELECT * FROM students
WHERE class = 'Form 3' AND city = 'Nairobi';

--Query to find all students who are in Form 2 OR Form 4.
SELECT * FROM students
WHERE class = 'Form 2' OR class = 'Form 4';

--Query to find all exam results where marks are between 50 and 80 (inclusive).
SELECT * FROM exam_results
WHERE marks BETWEEN 50 AND 80;

--Query to find all exams that took place between 15th March 2024 and 18th March 2024.
SELECT * FROM exam_results
WHERE exam_date BETWEEN '2024-03-15' AND '2024-03-18';

--Query to find all students who live in Nairobi, Mombasa, or Kisumu.
SELECT * FROM students
WHERE city IN ('Nairobi', 'Mombasa', 'Kisumu');

--Query to find all students who are NOT in Form 2 or Form 3.
SELECT * FROM students
WHERE class NOT IN ('Form 2', 'Form 3');

--Query to find all students whose first name starts with 'A' or 'E'.
SELECT * FROM students
WHERE first_name LIKE 'A%' OR first_name LIKE 'E%';

--Query to find all subjects whose name contains the word 'Studies'.
SELECT * FROM subjects
WHERE subject_name LIKE '%Studies%';

--Query to find how many students are currently in Form 3.
SELECT COUNT(*) AS total_form3_students
FROM students
WHERE class = 'Form 3';

--Query to find how many exam results have a mark of 70 or above.
SELECT COUNT(*) AS total_marks
FROM exam_results
WHERE marks >= 70;

--Query to  Label each exam result with a grade description:
--   'Distinction' if marks >= 80
--   'Merit'       if marks >= 60
--   'Pass'        if marks >= 40
--   'Fail'        if marks below 40
SELECT
    result_id,
    marks,
    CASE
        WHEN marks >= 80 THEN 'Distinction'
        WHEN marks >= 60 THEN 'Merit'
        WHEN marks >= 40 THEN 'Pass'
        ELSE 'Fail'
    END AS performance
FROM exam_results;

--Query to  Label each student as:
--   'Senior' if they are in Form 3 or Form 4
--   'Junior' if they are in Form 2 or Form 1
SELECT
    first_name,
    last_name,
    class,
    CASE
        WHEN class IN ('Form 3', 'Form 4') THEN 'Senior'
        WHEN class IN ('Form 1', 'Form 2') THEN 'Junior'
    END AS student_level
FROM students;
