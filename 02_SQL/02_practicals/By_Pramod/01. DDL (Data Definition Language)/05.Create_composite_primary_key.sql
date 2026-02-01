CREATE TABLE Result (
  StudentId INTEGER,
  CourseId INTEGER,
  Marks NUMERIC(3),
  CONSTRAINT result_pk PRIMARY KEY (StudentId, CourseId)
);
