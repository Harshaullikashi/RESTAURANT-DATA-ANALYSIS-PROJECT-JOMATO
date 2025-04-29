
select * from Jomato1
CREATE PROCEDURE RestaurantWithBooking
    @tablebooking bit
AS
BEGIN
    SELECT restaurantname, CuisinesType, RestaurantType
    FROM Jomato1
    WHERE tablebooking !=0;
END;

exec RestaurantWithBookings @tablebooking = 1;


BEGIN TRANSACTION;

UPDATE Jomato1
SET CuisinesType = 'Cafeteria'
WHERE CuisinesType = 'cafe';


SELECT * FROM jomato1 WHERE CuisinesType = 'Cafeteria';
ROLLBACK;


SELECT * FROM Jomato1
WITH RankedRestaurants AS (
    SELECT restaurantname, rating,   
           ROW_NUMBER() OVER (ORDER BY rating DESC) as row_num
    FROM Jomato1
)

SELECT restaurantname, rating
FROM RankedRestaurants
WHERE row_num <= 5;


DECLARE @counter INT = 1;

WHILE @counter <= 50
BEGIN
    PRINT @counter;
    SET @counter = @counter + 1;
END;


CREATE VIEW TopRatingRestaurants AS
SELECT restaurantname, rating
FROM (
    SELECT restaurantname, rating,
           ROW_NUMBER() OVER (ORDER BY rating DESC) as row_num
    FROM Jomato1
) subquery
WHERE row_num <= 5;

select * from dbo.TopRatingRestaurants

CREATE TRIGGER NewRestaurantInserted
ON jomato1
AFTER INSERT 
As
BEGIN
DECLARE @Message NVARCHAR(100);
SET @Message = 'A new record has been inserted into the jomato1 table.';
    

RAISERROR (@Message, 10, 1);
END;



