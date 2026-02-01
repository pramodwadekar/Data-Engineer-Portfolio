-- Drop table
Drop table Student;

-- Cascade clause added to the drop table statement drops the parents table as well as all the referntial integrity or 
-- foreign key constraints from child tables that refer to the parent table if any.

Drop table if exists student cascade
