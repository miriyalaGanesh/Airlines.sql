---COMMON TABLE EXPRESSION (CTE)

--Find the average price of flights by airline
with avgprice as 
(select airline,avg(price) as avg_price from airlines 
group by airline )
select * from avgprice
order by avg_price desc 

--Get all flights longer than the average duration
with avgduration as
( select avg(duration) as avg_duration from airlines )
select airline, flight from airlines,avgduration 
where airlines.duration > avg_duration
--or by using sub query
select airline,flight from airlines
where duration > ( select avg(duration) as avgduration from airlines)

-- Find the top 3 most expensive flights
with expensive as 
( select airline,flight,price ,row_number() over(order by price desc ) as rn from airlines)
select airline,flight,price from expensive
where rn <= 3;
----or 
select top(3)* from airlines
order by price desc

--Update using a CTE (set international flights as domestic = false)
with international as 
( select flight from airlines
where source_city not in ('Bangalore', 'Hyderabad', 'Delhi', 'Mumbai', 'Chennai')
)
update airlines
set domestic = 'false'
where flight in (select flight from international)

