---joins --
CREATE TABLE airline_details 
(
    airline_id INT PRIMARY KEY IDENTITY(1,1),
    airline VARCHAR(50) UNIQUE,
    headquarters VARCHAR(100),
    country VARCHAR(50),
    founded_year INT
);
---inner join 
SELECT a.flight, a.airline, a.price, d.headquarters
FROM airlines a
INNER JOIN airline_details d
    ON a.airline = d.airline;

--left join
SELECT a.flight, a.airline, a.price, d.headquarters
FROM airlines a
LEFT JOIN airline_details d
    ON a.airline = d.airline;

--right join 
SELECT a.flight, a.airline, d.headquarters
FROM airlines a
RIGHT JOIN airline_details d
    ON a.airline = d.airline;

---full join 
SELECT a.flight, a.airline, d.headquarters
FROM airlines a
FULL OUTER JOIN airline_details d
    ON a.airline = d.airline;