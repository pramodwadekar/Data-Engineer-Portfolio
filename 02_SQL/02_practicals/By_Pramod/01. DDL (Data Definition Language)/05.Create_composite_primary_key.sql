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

/*In this example:
    Student_ID alone can have duplicates (if a student enrolls in multiple courses).
    Course_ID alone can have duplicates (many students can take the same course).
    But the combination (Student_ID, Course_ID) must be unique. 

	| Student_ID | Course_ID | Student_Name |
    | ---------- | --------- | ------------ |
    | 101        | 1         | Pramod       |
    | 101        | 2         | Pramod       |
    | 102        | 1         | Rahul        |
	This is valid because each (Student_ID, Course_ID) combination is unique. */
