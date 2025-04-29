-- Tasks to be performed:
select * from Jomato1
--1. Create a stored procedure to display the restaurant name, type and cuisine where the table booking is not zero.
CREATE PROCEDURE RestaurantWithBooking
    @tablebooking bit
AS
BEGIN
    SELECT restaurantname, CuisinesType, RestaurantType
    FROM Jomato1
    WHERE tablebooking !=0;
END;

exec RestaurantWithBookings @tablebooking = 1;


--2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result and rollback it.
-- Start the transaction
BEGIN TRANSACTION;

-- Update the cuisine type from 'Cafe' to 'Cafeteria'
UPDATE Jomato1
SET CuisinesType = 'Cafeteria'
WHERE CuisinesType = 'cafe';

-- Check the result
SELECT * FROM jomato1 WHERE CuisinesType = 'Cafeteria';

-- Rollback the transaction
ROLLBACK;

-- Verify the rollback
SELECT * FROM Jomato1

-- 3. Generate a row number column and find the top 5 areas with the highest rating of restaurants.

WITH RankedRestaurants AS (
    SELECT restaurantname, rating,   
           ROW_NUMBER() OVER (ORDER BY rating DESC) as row_num
    FROM Jomato1
)

SELECT restaurantname, rating
FROM RankedRestaurants
WHERE row_num <= 5;

-- 4. Use the while loop to display the 1 to 50.

DECLARE @counter INT = 1;

WHILE @counter <= 50
BEGIN
    PRINT @counter;
    SET @counter = @counter + 1;
END;


--5. Write a query to Create a Top rating view to store the generated top 5 highest rating of restaurants.
CREATE VIEW TopRatingRestaurants AS
SELECT restaurantname, rating
FROM (
    SELECT restaurantname, rating,
           ROW_NUMBER() OVER (ORDER BY rating DESC) as row_num
    FROM Jomato1
) subquery
WHERE row_num <= 5;

select * from dbo.TopRatingRestaurants

-- 6. Create a trigger that give an message whenever a new record is inserted.

CREATE TRIGGER NewRestaurantInserted
ON jomato1
AFTER INSERT 
As
BEGIN
DECLARE @Message NVARCHAR(100);
SET @Message = 'A new record has been inserted into the jomato1 table.';
    
-- Raise an error with the message
RAISERROR (@Message, 10, 1);
END;



