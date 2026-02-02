-- Exercise_DML_Update2Columns
update CUSTOMER SET CustName = 'James', Custlocation = 'Berlin' where CustId = 'C103';

-- Exercise DML UpdateBrand
update Product set Brand = 'Adidas' where Color = 'White' and review = 'Good';

-- Exercise DMI UndateReview
update Product set review = 'Excellent' where Color = 'White'
