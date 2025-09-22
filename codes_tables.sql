.header on
.mode column

-- CREATE TABLE IF NOT EXISTS Students (
--     id,
--     Name,
--     Gender,
--     DOB,
--     Contact_no,
--     Email,
--     Father_name, 
--     Father_occupation,
--     Father_nunmber,
--     Mother_name,
--     Mother_occupation,
--     Mother_number,
--     Address,
--     Country,
--     State,
--     City,
--     PRIMARY KEY(id)
--     );

-- CREATE TABLE IF NOT EXISTS Applications (
--     id ,
--     student_id,
--     selected_course,
--     application_date,
--     status,   -- e.g., applied, verified, shortlisted, admitted, rejected, waitlisted
--     rejection_reason,
--     PRIMARY KEY(id),
--     FOREIGN KEY (student_id) REFERENCES Students(id)
--     );

-- CREATE TABLE IF NOT EXISTS Documents (
--     id,
--     student_id, 
--     Application_Form,
--     Proff_of_identity,
--     Marksheet_10th,
--     Marksheet_12th,
--     Transfer_certificate,
--     Migration_certificate,
--     Caste_certificate,
--     Medical_certificate,
--     Proff_of_address,
--     anti_ragging_form,
--     Annual_income,
--     verification_status,
--     PRIMARY KEY(id),
--     FOREIGN KEY (student_id) REFERENCES Students(id)
--     );

-- CREATE TABLE IF NOT EXISTS Marks (
--     id,
--     student_id,
--     entrance_exam_score,
--     scholarship_exam_score,
--     interview_score,
--     sop_score,
--     PRIMARY KEY(id),
--     FOREIGN KEY (student_id) REFERENCES Students(id),
--     FOREIGN KEY (interview_score) REFERENCES Interview(score)
--     );

-- CREATE TABLE IF NOT EXISTS Fees (
--     id,
--     student_id,
--     registration_fee,
--     tuition_fee,
--     scholarships_applied,
--     installments,
--     payment_status,
--     PRIMARY KEY(id),
--     FOREIGN KEY (student_id) REFERENCES Students(id)
--     );


-- CREATE TABLE IF NOT EXISTS Degree_Allocation (
--     id INTEGER PRIMARY KEY,
--     student_id INTEGER,
--     course_id INTEGER,
--     course_name TEXT,
--     department TEXT,
--     seats_available INTEGER,
--     FOREIGN KEY (student_id) REFERENCES Students(id)
--  );


-- CREATE TABLE IF NOT EXISTS Call_Outreach (
--     id INTEGER PRIMARY KEY,
--     student_id INTEGER,
--     call_date DATE,
--     summary TEXT,   -- (interest, yes, no)
--     campus_visit_date DATE,
--     email_sent TEXT, -- (Yes, No)
--     FOREIGN KEY (student_id) REFERENCES Students(id)
--  );


-- CREATE TABLE IF NOT EXISTS Interview (
--     interview_id INTEGER PRIMARY KEY,
--     student_id INTEGER,
--     date_schedule DATE,
--     allocated_staff_id TEXT,
--     interview_score REAL,
--     FOREIGN KEY (student_id) REFERENCES Students(id) 
--     FOREIGN KEY (allocated_staff_id) REFERENCES Staff_Users(id) 
--  );


-- CREATE TABLE IF NOT EXISTS Staff (
--     id INTEGER PRIMARY KEY,
--     Name TEXT,
--     Email TEXT,
--     Role TEXT
-- );


