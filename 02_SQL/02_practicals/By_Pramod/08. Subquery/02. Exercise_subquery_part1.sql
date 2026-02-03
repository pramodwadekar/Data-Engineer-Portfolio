-- 1. Exercise_Subquery_MaxAvgDiscount
select max(a1.avgdisc) "MAX_DISCOUNT"
from (
    select avg(discount) avgdisc
    from invoice
    group by productid
) a1;


-- 2. Exercise_Subquery_MaxCount

select max(c1.qp) "MAX_PURCHASES"
from (
    select count(quantitypurchased) qp
    from invoice
    group by custid
) c1;
