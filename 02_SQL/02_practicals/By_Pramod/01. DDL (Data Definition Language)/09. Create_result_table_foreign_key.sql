CREATE TABLE Result (
  StudentId INTEGER CONSTRAINT result_sid_fk REFERENCES Student(StudentId),
  CourseId INTEGER,
  Marks NUMERIC(3)
);

OR

CREATE TABLE Result (
  StudentId INTEGER REFERENCES Student(StudentId),
  CourseId INTEGER,
  Marks NUMERIC(3)
);
