/*                    TASK 2- HOTEL RESERVATION ANALYSIS USING SQL                  */

/*1. What is the total number of reservations in the dataset?*/
SELECT COUNT(*) AS total_reservations
FROM hotelz;
/*2. Which meal plan is the most popular among guests?*/
SELECT type_of_meal_plan, COUNT(*) AS num_guests
FROM hotelz
GROUP BY type_of_meal_plan
ORDER BY num_guests DESC
LIMIT 1;
/*3. What is the average price per room for reservations involving children?*/
SELECT AVG(avg_price_per_room) AS average_price_per_room_with_children
FROM hotelz
WHERE no_of_children > 0;
/*4. How many reservations were made for the year 20XX (replace XX with the desired year)?
My desired year is 2002 & 2024*/
SELECT COUNT(*) AS reservations_for_year
FROM hotelz
WHERE SUBSTR(arrival_date, 1, 4) = '2002';
SELECT COUNT(*) AS reservations_for_year
FROM hotelz
WHERE SUBSTR(arrival_date, 1, 4) = '2024';
/*5. What is the most commonly booked room type?*/
SELECT room_type_reserved, COUNT(*) AS num_bookings
FROM hotelz
GROUP BY room_type_reserved
ORDER BY num_bookings DESC
LIMIT 1;
/*6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?*/
SELECT COUNT(*) AS weekend_reservations
FROM hotelz
WHERE no_of_weekend_nights > 0;
/*7. What is the highest and lowest lead time for reservations?*/
SELECT MAX(lead_time) AS highest_lead_time,
       MIN(lead_time) AS lowest_lead_time
FROM hotelz;
/*8. What is the most common market segment type for reservations?*/
SELECT market_segment_type, COUNT(*) AS num_reservations
FROM hotelz
GROUP BY market_segment_type
ORDER BY num_reservations DESC
LIMIT 1;
/*9. How many reservations have a booking status of "Confirmed"?*/
SELECT COUNT(*) AS num_confirmed_reservations
FROM hotelz
WHERE booking_status = 'Confirmed';
/*10. What is the total number of adults and children across all reservations?*/
SELECT SUM(no_of_adults) AS total_adults,
       SUM(no_of_children) AS total_children
FROM hotelz;
/*11. What is the average number of weekend nights for reservations involving children?
*/
SELECT AVG(no_of_weekend_nights) AS avg_weekend_nights_with_children
FROM hotelz
WHERE no_of_children > 0;
/*12. How many reservations were made in each month of the year?*/
SELECT 
    SUBSTR(arrival_date, 6, 2) AS month,
    COUNT(*) AS num_reservations
FROM 
    hotelz
GROUP BY 
    SUBSTR(arrival_date, 6, 2)
ORDER BY 
    month;
/*13. What is the average number of nights (both weekend and weekday) spent by guests for each room
type?*/
SELECT 
    room_type_reserved,
    AVG(no_of_weekend_nights + no_of_week_nights) AS avg_total_nights
FROM 
    hotelz
GROUP BY 
    room_type_reserved;
/*14. For reservations involving children, what is the most common room type, and what is the average
price for that room type?*/
SELECT 
    room_type_reserved,
    COUNT(*) AS num_reservations,
    AVG(avg_price_per_room) AS avg_price
FROM 
    hotelz
WHERE 
    no_of_children > 0
GROUP BY 
    room_type_reserved
ORDER BY 
    num_reservations DESC
LIMIT 1;
/*15. Find the market segment type that generates the highest average price per room.*/
SELECT 
    market_segment_type,
    AVG(avg_price_per_room) AS avg_price_per_room
FROM 
    hotelz
GROUP BY 
    market_segment_type
ORDER BY 
    avg_price_per_room DESC
LIMIT 1;


















