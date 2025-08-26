
--use INFORMATION_SCHEMA
SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Bond_Lodgement';


--Change into currency and check the table 
ALTER TABLE Bond_Lodgement
ALTER COLUMN WEEKLY_RENT_AMOUNT DECIMAL(10,2)
select TOP 100* from Bond_Lodgement; 


/*
Add column based upon region
*/
ALTER TABLE Bond_Lodgement
ADD Region_Category VARCHAR(50);

UPDATE Bond_Lodgement
SET Region_Category = CASE 
           WHEN POSTCODE BETWEEN 6000 AND 6199 THEN 'Perth Region'
           WHEN POSTCODE = 6230 OR POSTCODE = 6231 
                OR (POSTCODE BETWEEN 6218 AND 6280) 
                OR POSTCODE IN (6330, 6332) 
                OR POSTCODE IN (6530, 6531) 
                OR POSTCODE IN (6725, 6726) 
                OR POSTCODE IN (6430, 6433) 
                OR POSTCODE = 6714 THEN 'Regional Central'
           ELSE 'Regional / Mining City'
       END;


DELETE from [project].[dbo].[Bond_Lodgement]
Where WEEKLY_RENT_AMOUNT= 0;

Select TOP 100 * project.[dbo].[Bond_Lodgement];