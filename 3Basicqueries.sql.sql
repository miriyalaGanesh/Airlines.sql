---Basic level sql queries based on airlines

--How would you show all the data for flights that have a price less than 6000?
select * from airlines
where price < 6000 

-- Write a query to find all flights departing from 'Delhi'.
select * from airlines
where source_city = 'delhi';
 
 --COUNT: How many flights have stops equal to 'zero'?
 select count(*) as stops_eql_zero from airlines
 where stops = 'zero';
  
--ORDER BY: List all the flights from the airline 'Vistara', ordered by duration from the longest to the shortest.
select * from airlines
where airline = 'vistara'
order by duration desc

--DISTINCT: Find all the unique airline names available in the table?
select distinct airline from airlines