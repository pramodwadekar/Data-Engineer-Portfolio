-- ASSIGNEMENTS
-- 1: Assignment Subquery SubscribedJournals
select journalid, journalname, genre 
from journal j 
where exists (select subscriptionid from subscription s where j.journalid = s.journalid);


-- 2: Assignment Subquery JoinstoSubsquery
select journalname, genre 
from journal j 
where exists (select journalid from subscription s where j.journalid = s.journalid);


-- 3: Assignment Subquery RoundedAvgRating
select round(avg(rating)) as "RATING" 
from publisher p 
where exists (select journalid from journal j where p.publisherid = j.publisherid);

-- OR

select round(avg(rating)) as "RATING" 
FROM publisher 
where publisherid in (select publisherid from journal)
  

-- 4: Assignment Subquery SelectiveCustomers
select customerid, customername, state 
from customer 
where state = (select state from customer where customername = 'Robert') 
and customername != 'Robert';


-- 5: Assignment Subquery_CustomerWith>1Subscription
select customerid, customername 
from customer 
where customerid in (
    select customerid 
    from subscription 
    group by customerid 
    having count(customerid) > 1
);


-- 6: Assignment Subquery MinMonthlyCharges
select publisherid, publishername 
from publisher 
where publisherid = (
    select publisherid 
    from journal 
    where monthlycharges = (select min(monthlycharges) from journal)
);


-- 7: Assignment Subquery MinMonthlyChargesOfTradeGence
select publisherid, publishername 
from publisher 
where publisherid = (
    select publisherid 
    from journal 
    where monthlycharges = (
        select min(a1.mcharge) 
        from (
            select min(monthlycharges) mcharge, publisherid 
            from journal 
            where genre = 'Trade' 
            group by publisherid
        ) a1
    )
);

-- OR 

select publisherid, publishername 
from publisher 
where publisherid = (
    select publisherid 
    from journal 
    where genre = 'Trade' 
    group by publisherid 
    having min(monthlycharges) = (select min(monthlycharges) from journal where genre = 'Trade')
);

-- 8: Assignment Subquery MaxMonthlyChargesOfTradeGenre
select journalname, monthlycharges 
from journal 
where monthlycharges = (select max(monthlycharges) from journal where genre = 'Trade') 
  and genre = 'Trade';


-- 9: Assignment Subquery CustomerFromSameStateDiffCity
select state, city, customername 
from customer c1 
where exists (
    select customerid 
    from customer c2 
    where c1.state = c2.state and c1.city <> c2.city
) 
order by state;


-- 10: Assignment Subquery SelectiveSubscriptions
select subscriptionid, journalid 
from subscription s1 
where discountpercent <= (
    select avg(discountpercent) 
    from subscription s2 
    where s1.journalid = s2.journalid
);


-- 11: Assignment Subquery CustomerSubscriptions
select customerid, customername, startdate 
from customer c1 
inner join subscription s1 on c1.customerid = s1.customerid 
where discountpercent < (
    select max(discountpercent) 
    from subscription so 
    where s1.startdate = so.startdate
) 
group by customerid, customername, startdate;


-- 12: Assignment Subquery Subscriptions
select customername, state, durationinmonths 
from customer c1 
inner join subscription s1 on c1.customerid = s1.customerid 
where discountpercent > (
    select min(discountpercent) 
    from subscription so 
    where s1.customerid = so.customerid
);


-- 13: Assignment Subquery CustomerWithNoSubscription
select customerid, customername 
from customer c1 
where not exists (select subscriptionid from subscription s1 where c1.customerid = s1.customerid);

  
-- 14: Assignment Subquery UniqueDiscountPerCustomer
select distinct customername, discountpercent 
from customer c1 
inner join subscription s1 on c1.customerid = s1.customerid 
where discountpercent < (
    select max(discountpercent) 
    from subscription so 
    where s1.customerid != so.customerid 
      and s1.journalid = so.journalid
);


-- 15:Assignment Subquery_MaxMonthly Charges PerGenre
select journalid, journalname, genre, monthlycharges 
from journal 
where monthlycharges in (select max(monthlycharges) from journal group by genre);

  
-- 16: Assignment Subquery_NestedQuery (test case pass not submit)
select s.subscriptionid,
       j.journalname
from subscription s
join journal j on s.journalid = j.journalid
where j.genre = 'Trade'
  and j.publisherid in (
      select publisherid 
      from publisher 
      where rating > 3
  );

-- 17: Assignment_Subquery_UpdateMonthlyCharges
update journal j 
set monthlycharges = (
    select avg(monthlycharges) 
    from journal 
    where publisherid = j.publisherid
);
