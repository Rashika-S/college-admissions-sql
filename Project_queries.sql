.headers on
.mode column 

-- Varshann
    --Create the detailed view with all student details
    --   CREATE VIEW 'Student_Details_By_Name' AS
    --   SELECT 
    --      Students.*,
    --      Applications.*,
    --      Call_Outreach.*,
    --      Degree_Allocation.*,
    --      Documents.*,
    --      Fees.*,
    --      Interview.*,
    --      Marks.*
    --   FROM Students
    --   LEFT JOIN Applications ON Students.id = Applications.student_id
    --   LEFT JOIN Call_Outreach ON Students.id = Call_Outreach.student_id
    --   LEFT JOIN Degree_Allocation ON Students.id = Degree_Allocation.student_id
    --   LEFT JOIN Documents ON Students.id = Documents.student_id
    --   LEFT JOIN Fees ON Students.id = Fees.student_id
    --   LEFT JOIN Interview ON Students.id = Interview.student_id
    --   LEFT JOIN Marks ON Students.id = Marks.student_id
    --   WHERE Students.Name = 'Emily Carter';


    -- Drop the view of Student Names Only as it already exists
    --  DROP VIEW IF EXISTS Student_Names_Only; 

    --  -- Create a slim view with just student id and Name
    --  CREATE VIEW Student_Names_Only AS
    --  SELECT 
    --     id,
    --     Name
    --  FROM Students;


    -- Get all details of the student Rohit Sharma
    --  SELECT *
    --  FROM Student_Details_By_Name
    --  WHERE Name = 'Rohit Sharma';


-- Rashika
    -- -- EVERY DETAIL OF STUDENT
    -- SELECT s.,a.,d.,m.,f.,de.,c.,i. 
    -- FROM Students s
    -- LEFT JOIN Applications a ON s.id = a.student_id
    -- LEFT JOIN Documents d ON s.id = d.student_id
    -- LEFT JOIN Marks m ON s.id = m.student_id
    -- LEFT JOIN Fees f ON s.id = f.student_id
    -- LEFT JOIN Degree_Allocation de ON s.id = de.student_id
    -- LEFT JOIN Call_Outreach c ON s.id = c.student_id
    -- LEFT JOIN Interview i ON s.id = i.student_id
    -- WHERE s.Name = 'Riya Patel';

    -- -- DETAIL OF STAFF
    -- SELECT * 
    -- FROM Staff st
    -- WHERE st.Name = 'Arjun Reddy';

    -- -- TO ADD NEW STUDENT DETAILS
    -- INSERT INTO Students 
    -- (id,Name, Gender, DOB, Contact_no, Email, Father_name, Father_occupation, Father_number, 
    --  Mother_name, Mother_occupation, Mother_number, Address, Country, State, City)
    -- VALUES 
    -- ('501','Rahul Verma', 'Male', '2005-08-14', '+91-9812345678', 'rahul.verma05@gmail.com',
    --  'Rajesh Verma', 'Engineer', '+91-9823456789',
    --  'Sunita Verma', 'Teacher', '+91-9876543210',
    --  '22 Residency Rd, Delhi', 'India', 'Delhi', 'New Delhi');

    -- --  To add NEW STAFF
    -- INSERT INTO Staff (Name, Email, Role)
    -- VALUES ('Neha Gupta', 'neha.gupta@university.org', 'Counselor');

    -- -- Track the admission team depending on the roles 
    -- SELECT * FROM Staff:

    -- -- To add new data
    -- UPDATE Applications
    -- SET rejection_reason = 'Fake documents'
    -- WHERE id = 161;

-- Mohith--

 -- Mohith's Query:
 -- This query calculates each student's pass percentage and pass/fail status 
 -- based on their exam and interview scores from the Marks table.
 -- Instead of creating a new table, it should be a view so the results get's updated.


 --  CREATE TABLE "selection" AS
 --   SELECT
 --     *,
 --     (
 --         (
 --             "entrance_exam_score (MAX.100)"
 --             + "scholarship_exam_score(MAX.100)"
 --             + "interview_score(MAX.100)"
 --             + ("sop_score(MAX.10)" * 10)
 --         ) * 100.0 / 400
 --     ) AS pass_percentage,
 --     CASE
 --         WHEN (
 --             (
 --                 "entrance_exam_score (MAX.100)"
 --                 + "scholarship_exam_score(MAX.100)"
 --                 + "interview_score(MAX.100)"
 --                 + ("sop_score(MAX.10)" * 10)
 --             ) * 100.0 / 400
 --         ) >= 60 THEN 'Pass'
 --         ELSE 'Fail'
 --     END AS pass_fail
 --  FROM "Marks";

 -- SELECT * FROM selection;


-- Mayur--
 -- Mayur's Query:
 -- Purpose: Identify students who were rejected (by the university or by the student),
 -- along with the reason, by analyzing Applications and Call_Outreach table.

--  SELECT DISTINCT
--      s.id AS student_id,
--      s.Name AS student_name,
--      a.selected_course,
--      CASE 
--          WHEN LOWER(a.status) = 'rejected' THEN 'Rejected by University'
--          WHEN LOWER(a.status) IN ('admitted','shortlisted')
--               AND LOWER(COALESCE(co.summary, '')) GLOB '*declin*'
--               OR LOWER(COALESCE(co.summary, '')) GLOB '*reject*'
--          THEN 'Rejected by Student'
--      END AS rejection_side,
--      COALESCE(a.rejection_reason, co.summary) AS reason
--  FROM Applications a
--  JOIN Students s ON s.id = a.student_id
--  LEFT JOIN Call_Outreach co ON co.student_id = s.id
--  WHERE LOWER(a.status) = 'rejected'
--     OR (
--          LOWER(a.status) IN ('admitted','shortlisted')
--          AND (
--              LOWER(COALESCE(co.summary,'')) LIKE '%declin%'
--              OR LOWER(COALESCE(co.summary,'')) LIKE '%reject%'
--          )
--     );


-- Demographics
    -- Get all student details for a given city (e.g., Bangalore)
    --  SELECT 
    --      s.id AS student_id,
    --      s.name,
    --      s.gender,
    --      s.DOB,              
    --      s.Contact_no,  
    --      s.email,
    --      s.father_name,
    --      s.Father_occupation,
    --      s.Father_number,
    --      s.mother_name,
    --      s.Mother_occupation,
    --      s.Mother_number,
    --      s.address,
    --      s.country,
    --      s.state,
    --      s.city
    --  FROM Students s
    --  WHERE LOWER(s.city) = LOWER('Bangalore');


    -- -- Count of students applied from each state ( Demographic )
    --  SELECT 
    --      s.state AS region,
    --      COUNT(a.id) AS total_applications
    --  FROM Students s
    --  JOIN Applications a ON s.id = a.student_id
    --  GROUP BY s.state

    --  UNION ALL

    --  SELECT 
    --      'TOTAL' AS region,
    --      COUNT(a.id) AS total_applications
    --  FROM Students s
    --  JOIN Applications a ON s.id = a.student_id

    --  ORDER BY total_applications DESC;


    -- --Reject Reason
    --  SELECT 
    --      a.rejection_reason,
    --      COUNT(*) AS rejection_count
    --  FROM Applications a
    --  WHERE LOWER(a.status) = 'rejected'
    --  GROUP BY a.rejection_reason
    --  ORDER BY rejection_count DESC;



    -- -- Count staff per role (Only Current Staff)
    --  SELECT 
    --     Role,
    --     COUNT(*) AS total_staff
    --  FROM Staff
    --  GROUP BY Role
    --  ORDER BY total_staff DESC;





 