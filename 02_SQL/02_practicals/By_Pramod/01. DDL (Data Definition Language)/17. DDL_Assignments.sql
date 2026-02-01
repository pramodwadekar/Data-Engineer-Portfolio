-- Assignment DDL Create Publisher
Create table Publisher (PublisherId varchar (4) primary key 
CHECK(PublisherId LIKE 'P%'),
PublisherName varchar(20) not null unique,
Rating Numeric(3,1) not null check(rating between 1 and 5),
ContactNo Numeric)

-- Assignment DDL Create Subscription
create table Subscription(
SubscriptionId varchar(4) primary key CHECK(SubscriptionId LIKE 'S%'), 
JournalId varchar (4) references Journal (JournalId), 
CustomerId varchar(4) references Customer (CustomerId),
StartDate DATE DEFAULT SYSDATE,
Discount numeric
DurationInMonths Integer default 3 NOT NULL CHECK(DurationInMonths>0));


-- Assignment DDL Create Journal
create table Journal(
Journalld varchar(4) primary key check(JournalId like 'J%'),
JournalName varchar (25) NOT NULL,
Genre varchar(20) NOT NULL check(genre in ('Academics', 'Scientific', 'Politics', 'Trade)), 
MonthlyCharges Integer NOT NULL check(MonthlyCharges>0), 
PublisherId varchar (4) references publisher (PublisherId), Check(Journalname <> genre),
);


-- Assignment DDL Alter AddColumn
alter table Customer add column ContactNo numeric(10);

-- Assignment DDL Alter Size 
alter table Customer alter column state varchar(20);

-- Assignment DDL Alter Rename 
alter table Customer alter column City rename to CustomerCity;

-- Assignment DDL Alter Modify DataType
alter table Publisher alter ContactNo numeric(10);

-- Assignment DDL DropColumn
drop table if exists Customer;
