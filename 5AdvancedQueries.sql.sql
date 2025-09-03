-------Advanced Queries & Joins

--Find all flights that are more expensive than the most expensive flight operated by Air_India.
SELECT *FROM airlines
WHERE price > ( SELECT MAX(price) FROM airlines
WHERE airline = 'Air_India')

--For each airline, identify the flight with the highest price. (Hint: Use a window function like ROW_NUMBER() or a subquery).
select airline,flight,price from
( select airline,flight,price, ROW_NUMBER() over(partition by airline order by price desc) as rn from airlines ) as ranked_flight 
where rn = 1;

--Find the flights that are less expensive than the average price of all flights with one stop.
select * from airlines
where price < (select avg(price) from airlines
where stops ='one');

--Use a CASE statement to create a new column called Price_Category. The column should be:
--'Low' if the price is less than $7,000
--'Medium' if the price is between $7,000 and $13,000
--'High' if the price is greater than $13,000
select flight, airline,price ,case
when price < 7000 then 'low'
when price between 7000 and 13000  then 'medium'
else 'high'
end as price_catogery 
from airlines 



--Find the flight with the shortest duration for each unique class

SELECT class,flight,duration FROM 
(SELECT class,flight,duration,ROW_NUMBER() OVER(PARTITION BY class ORDER BY duration ASC) AS rn
 FROM airlines) AS ranked_flights
WHERE rn = 1;