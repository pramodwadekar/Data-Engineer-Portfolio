-- ✅ 1: Exercise_Subquery_RatedVendor
select vendorname 
from vendor v1
where EXISTS (
    select vendorid 
    from invoice i
    where v1.vendorid = i.vendorid
) 
and rating is not null;

-- Alternative JOIN version (your second query):

select vendorname
from vendor v
inner join invoice i on v.vendorid = i.vendorid
where rating is not null
group by vendorname;


-- ✅ 2: Exercise_Subquery_UnSoldProducts
select productid, pcategory, brand 
from product p 
where not exists (
    select productid 
    from invoice i 
    where p.productid = i.productid
);


-- ✅ 3: Exercise_Subquery_VendorWhoSoldProductsBefore1July
select vendorname 
from vendor v 
where exists (
    select vendorid 
    from invoice i 
    where v.vendorid = i.vendorid 
      and i.purchasedate < '2023-07-01'
);

