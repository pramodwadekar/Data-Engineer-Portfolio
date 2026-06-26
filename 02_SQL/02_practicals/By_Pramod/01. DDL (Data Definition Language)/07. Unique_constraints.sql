/* Unique: Prevents/not allows dubicate entries and ensures data entegrity. allows null value.*/

CREATE TABLE Student (
  StudentId INTEGER,
  FName VARCHAR(10),
  ContactNo NUMERIC(10) UNIQUE
);
