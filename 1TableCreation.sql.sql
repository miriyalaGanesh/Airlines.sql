create table airlines (
[index] int ,
airline varchar (50) not null,
flight varchar (30) not null,
source_city varchar (50) not null,
departure_time varchar(50) not null,
stops varchar (50) not null,
arrival_time varchar(50) not null,
destination_city varchar (50) not null,
class varchar (50) not null,
duration decimal(5,2) not null,
days_left int not null,
price decimal (10,2) not null );
select * from airlines