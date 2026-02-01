-- Change datatype of a column:
ALTER TABLE Employee ALTER COLUMN Address VARCHAR(30);

-- Increase or decrease column size:
ALTER TABLE Employee ALTER COLUMN Address VARCHAR(40);

-- Rename a column:
ALTER TABLE Employee ALTER COLUMN Address RENAME TO ResidentialAddress;

-- Delete (drop) a column:
ALTER TABLE Employee DROP COLUMN ResidentialAddress;

-- Add a constraint (Primary Key example):
ALTER TABLE Employee ADD CONSTRAINT emp_eid_pk PRIMARY KEY (EmployeeId);

-- Drop (delete) a constraint:
ALTER TABLE Employee DROP CONSTRAINT emp_eid_pk;

