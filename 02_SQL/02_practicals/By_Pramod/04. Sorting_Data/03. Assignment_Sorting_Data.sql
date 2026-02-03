-- Assignments

-- 1: Assignment Sorting Rating Name
SELECT publisherid, publishername, rating 
FROM publisher 
ORDER BY rating, publishername;


-- 2: Assignment Sorting Duration StartDate
SELECT subscriptionid, durationinmonths, discountpercent, startdate
FROM subscription 
WHERE durationinmonths > 6 
ORDER BY durationinmonths ASC, startdate DESC;
