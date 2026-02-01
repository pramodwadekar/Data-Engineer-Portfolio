CREATE TABLE Student (
  StudentId INTEGER,
  FName VARCHAR(10),
  Gender CHAR(1) CHECK (Gender IN ('M', 'F'))
);
