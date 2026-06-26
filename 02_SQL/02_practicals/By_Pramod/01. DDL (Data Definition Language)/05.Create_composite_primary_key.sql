/* Composite Primary Key: A composite primary key is a primary key made up of two or more columns. or A composite primary 
key is a combination of two or more columns used to uniquely identify each record in a table.*/
  
CREATE TABLE Result (
  StudentId INTEGER,
  CourseId INTEGER,
  Marks NUMERIC(3),
  CONSTRAINT result_pk PRIMARY KEY (StudentId, CourseId)
);

OR 

CREATE TABLE Student (
    Student_ID INT,
    Course_ID INT,
    Student_Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    PRIMARY KEY (Student_ID, Course_ID)
);
