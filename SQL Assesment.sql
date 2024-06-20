create database assesment;
use assesment;

create table if not exists country (
	country_id int primary key,
    country_name varchar(100),
    country_name_english varchar(100),
    country_code varchar(50)
);

create table if not exists city (
    city_id int primary key,
    city_name varchar(100),
    latitude decimal (9,6),
    longitude decimal (9,6),
    country_id int,
    FOREIGN KEY (country_id) REFERENCES country (country_id)
);

create table if not exists customer (
	customer_id int primary key,
    customer_name varchar(255),
    city_id int,
    customer_add varchar(255),
    next_call_date date,
    ts_inserted timestamp,
    foreign key (city_id) references city (city_id)
);

insert into customer (customer_id, customer_name, city_id, customer_add, next_call_date, ts_inserted) values
(1, 'Jewelry Store', 4, 'Long Street 120', '2020-01-21', '2020-01-09 14:01:20'),
(2, 'Bakery', 1, 'Kurfürstendamm 25', '2020-02-21', '2020-01-09 17:52:15'),
(3, 'Café', 1, 'Tauentzienstraße 44', '2020-01-21', '2020-01-10 08:02:49'),
(4, 'Restaurant', 3, 'Ulica lipa 15', '2020-01-21', '2020-01-10 09:20:21');

insert into city (city_id, city_name, latitude, longitude, country_id) values
(1, 'Berlin', 52.520008, 13.404954, 1),
(2, 'Belgrade', 44.787197, 20.457273, 2),
(3, 'Zagreb', 45.815399, 15.966568, 3),
(4, 'New York', 40.730610, -73.935242, 4),
(5, 'Los Angeles', 34.052235, -118.243683, 4),
(6, 'Warsaw', 52.237049, 21.017532, 5);

insert into country (country_id, country_name, country_name_english, country_code) values
(1, 'Deutschland', 'Germany', 'DEU'),
(2, 'Srbija', 'Serbia', 'SRB'),
(3, 'Hrvatska', 'Croatia', 'HRV'),
(4, 'United States of America', 'United States of America', 'USA'),
(5, 'Polska', 'Poland', 'POL'),
(6, 'España', 'Spain', 'ESP'),
(7, 'Rossiya', 'Russia', 'RUS');

select * from country;
select * from city;
select * from customer;


-- Query for Task 1
select country.country_name_english as country_name,
city.city_name as city_name,
customer.customer_name as customer_name
from country
left join
    city on country.country_id = city.country_id
left join
    customer on city.city_id = customer.city_id;
    
-- Query for Task 2
select country.country_name_english as country_name,
city.city_name as city_name,
customer.customer_name as customer_name
from country
inner join
	city on country.country_id = city.country_id
left join
	customer on city.city_id = customer.city_id;