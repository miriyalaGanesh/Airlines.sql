--inserting airlines data from csv

bulk insert airlines
from 'C:\Users\dell\Downloads\archive\airlines_flights_data.csv'
with ( 
FIRSTROW = 2, 
fieldterminator = ',',
rowterminator = '\n',
tablock );
