Create database OlaProject;
Use OlaProject;

#Retreive all successful bookings
Create View Successful_Bookings As
Select * from Bookings where Booking_Status='Success';

#Retreive all successful bookings
Select * from Successful_Bookings;

#Find the average ride distance for every vehicle type 
#Means on an average how far does each vehicle travel per ride
Create View Average_ride_distance_for_every_Vehicle_type As
Select Vehicle_Type, AVG(Ride_Distance) as avg_distance from bookings
Group by Vehicle_Type;

#Find the average ride distance for every vehicle type 
Select * from Average_ride_distance_for_every_Vehicle_type;

#Get the total number of cancelled rides by customers 
Create View Total_number_of_cancelled_rides_by_customers As
Select Count(*) from Bookings where Booking_Status='Canceled by Customer';

#Get the total number of cancelled rides by customers 
Select * from Total_number_of_cancelled_rides_by_customers;

#List the top 5 customers who booked the highest number of rides 
Create View top_5_customers_who_booked_the_highest_number_of_rides As
Select Customer_ID, Count(Booking_ID) as Total_rides from Bookings 
Group by Customer_ID
Order by Total_Rides DESC
LIMIT 5;

#List the top 5 customers who booked the highest number of rides 
Select * from top_5_customers_who_booked_the_highest_number_of_rides;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues
Create View Cancelled_by_drivers_due_to_personal_and_car_related_issues As
Select Count(*) from Bookings where Canceled_Rides_by_Driver='Personal & Car related issue';

#5. Get the number of rides cancelled by drivers due to personal and car-related issues
Select * from Cancelled_by_drivers_due_to_personal_and_car_related_issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings
Create View Maximum_and_Minimum_driver_ratings_for_Prime_Sedan_bookings As
Select MAX(Driver_Ratings) as max_ratings, MIN(Driver_Ratings) as min_ratings from Bookings where Vehicle_Type='Prime Sedan';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings
Select * from Maximum_and_Minimum_driver_ratings_for_Prime_Sedan_bookings;

#7. Retreive all rides where payment was made using UPI:
Create View AllRides_where_payment_was_made_using_UPI As
Select * from Bookings where Payment_Method='UPI';

#7. Retreive all rides where payment was made using UPI:
Select * from AllRides_where_payment_was_made_using_UPI;

#8.Find the average customer rating per vehicle type:
Select Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating from Bookings
Group by Vehicle_Type; 

#9.Calculate the total booking value of rides completed successfully:
Create View Total_booking_value_of_rides_completed_successfully As
Select SUM(Booking_Value) as Total_Booking_Value from Bookings where Booking_Status='Success';

#9.Calculate the total booking value of rides completed successfully:
Select * from Total_booking_value_of_rides_completed_successfully;

#10.List all the incomplete rides along with their reason:
Create View Incomplete_rides_along_with_their_reason As
Select Booking_ID, Incomplete_Rides_Reason from Bookings where Incomplete_Rides='Yes';

#10.List all the incomplete rides along with their reason:
Select * from Incomplete_rides_along_with_their_reason;



