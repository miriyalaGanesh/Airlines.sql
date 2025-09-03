----dml

--Add a new flight to the airlines table with the following details: airline: 'NewFly', flight: 'NF-101', source_city: 
--'Bangalore', departure_time: 'Morning', stops: 'zero', arrival_time: 'Evening', destination_city: 'Hyderabad', 
--class: 'Economy',duration: 2.50, days_left: 5, price: 7500.00.
insert into airlines(airline, flight, source_city, departure_time, stops, arrival_time, destination_city, class, duration, days_left, price)
values('NewFly', 'NF-101', 'Bangalore', 'Morning', 'zero', 'Evening', 'Hyderabad', 'Economy', 2.50, 5, 7500.00);
select * from airlines
where airline = 'newfly'

--Increase the price of all flights from SpiceJet by 10%.
update airlines
set price = price+price*0.10
where airline = 'spicejet'


--Update the days_left to 0 for any flight that has a duration of more than 25 hours.
update airlines
set days_left = 0 
where duration > 25;
--to read
select * from airlines
where duration > 25

--Delete all flights from the airlines table that have a price less than $5,000.
delete from airlines
where price < 5000
--to read 
select * from airlines
where price < 5000

--Challenge: Add a new column called is domestic to the table with a default value of TRUE. Then, update this 
--column to FALSE for any flights that have a source_city or destination_city that is not on a specific list you create
--(e.g., 'London', 'Tokyo').
ALTER TABLE airlines
ADD domestic VARCHAR(5) DEFAULT 'true';
update airlines
set domestic = 'false'
where source_city not in ('Bangalore', 'Hyderabad', 'Delhi', 'Mumbai', 'Chennai')
OR destination_city NOT IN ('Bangalore', 'Hyderabad', 'Delhi', 'Mumbai', 'Chennai');