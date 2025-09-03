---Data Aggregation & Filtering
select * from airlines
--What is the average price of flights for each unique airline?
select distinct airline, avg(price) as avg_flight_price from airlines
group by airline

--Count the number of flights that depart in the Morning, Afternoon, and Evening.
select departure_time, count (*) as flights from airlines
where departure_time in ('morning','afternoon','evening')
group by departure_time

---Find the longest duration for flights originating from Delhi.
select source_city, max(duration) as longest_duration from airlines
where source_city = 'delhi'
group by source_city,duration

--Display the airline names that have more than 5 flights listed in the table.
select airline,count(*) as flightcount from airlines
group by airline
having count(*) > 5;

--For each destination_city, what is the cheapest flight price? Order the results from the cheapest to the most expensive city.
select destination_city,min(price) as flight_price from airlines
group by destination_city
order by flight_price asc

---Find the airline and source_city combinations that have a total price of all their flights greater than $100,000.
select airline, source_city, sum(price) as total_price from airlines
group by airline, source_city
having sum(price) > 100000;
