/*Check: Helps to achive domain integrity by limiting the acceptable data formats and ranges.
      Check constraint act like a rule to restrict invalid information. */
/* IN Format */
CREATE TABLE Student (
  StudentId INTEGER,
  FName VARCHAR(10),
  Gender CHAR(1) CHECK (Gender IN ('M', 'F'))
);

/* Like, Start, End, Anywhere, secondword, secondlast Format */
CREATE TABLE STUDENT (
    STUDENTID INTEGER,
    FNAME VARCHAR(10) CHECK (FNAME LIKE 'A%'),      /* Starts with A */
    LNAME VARCHAR(10) CHECK (LNAME LIKE '%E'),      /* Ends with E */
    SNAME VARCHAR(10) CHECK (SNAME LIKE '%E%'),     /* Contains E anywhere */
    CITY VARCHAR(10) CHECK (CITY LIKE '_A%'),       /* Second character is A */
    STATE VARCHAR(10) CHECK (STATE LIKE '%A_'),     /* Second last character is A */
    COUNTRY VARCHAR(10) CHECK (COUNTRY LIKE 'A_E%') /* Starts with A, second character any, third character E */
);

/* Range Between Format*/
CREATE TABLE STUDENT(
	STUDENTID INTEGER, 
	FNAME VARCHAR(10) CHECK (FNAME LIKE 'A%')
	FEES VARCHAR(10) CHECK (FEES BETWEEN 2500 AND 60000)
);

