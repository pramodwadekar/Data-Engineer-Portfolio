-- 1: Exercise Functions Ceiling Floor
SELECT VendorId,
       CEILING(Price) AS Higher_Round,
       FLOOR(Price)   AS Lower_Round
FROM VendorOffering;


-- 2: Exercise Functions Absolute
SELECT ABS(Price - 500) AS After_Discount
FROM VendorOffering;

