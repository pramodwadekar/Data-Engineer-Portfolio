-- Exercise DDL Alter Rename
Alter table Product Alter column ProductId rename to PId;


-- Exercise DDL Alter Modify DataType
alter table Product alter column price Integer;


-- Exercise DDL Alter Add Column
alter table Product add Color varchar(10);

-- Exercise DDL Alter Add Column Constraint
alter table Product add Review varchar(10) check (Review in ('Bad', 'Good', 'Excellent'));

