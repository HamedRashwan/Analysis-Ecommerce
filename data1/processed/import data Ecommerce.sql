use dab;
select * from customer;
/*Selects the "Customer Name" and "City" columns from the "Customers" table*/
select cust_name , cust_city
from customer;
/*What is the number of different (distinct) customer countries*/
select count(distinct cust_country) as num_of_country
from customer;
/*Selects all the customers from the country "London" in the "Customers" table:
(Note: Assuming you meant "Selects all the customers in the city 'London'")*/
select * from customer
where cust_city='London';
/*Show the Customer information with code C00015*/
select * from customer
where cust_code='C00015';
/*Selects all fields from "Customers" where country is "USA" or "India"*/
select * from customer
where cust_country in ('USA','India'); 
/*Selects all fields from "Customers" where city is NOT "Bangalore"*/
select * from customer
where cust_city !='Bangalore';
/*Selects all customers from the "Customers" table, sorted DESCENDING by the "city" column*/
select * from customer
order by cust_city desc;

select * from orders;
/*Finds the biggest amount of order:
(Assuming "biggest amount" refers to the maximum order amount)*/
select max(ord_amount) as biggest_ord_amount
from orders;
/*Finds the number of orders*/
select count(*)as num_of_orders
from orders;
/*Finds the average amount of all orders*/
select avg(ord_amount) as avg_ord_amount
from orders;
/*Selects all customers with a Customer Name starting with "m"*/
select * from customer
where cust_name
like'M%';
/*Selects all customers with a Customer Name starting with "s"*/
select * from customer
where cust_name
like's%';
/*Selects all customers that are in "Australia", "USA" or "UK"*/
select * from customer
where cust_country in ('Australia', 'USA', 'UK'); 
/*Selects orders in January*/
select * from orders
where month(ord_date)=1;
/*Selects the customers with amount payment between 1000 and 4000*/
select * from customer
where PAYMENT_AMT
between 1000 and 4000;
/*Selects all orders with customer information*/
select * from orders o inner join customer c
on o.CUST_CODE = c.CUST_CODE;
/*Select all customers, and any orders information they might have*/
select * from customer c left join orders o
on c.CUST_CODE = o.CUST_CODE;
/*Lists the number of customers in each country*/
select  cust_country,count(*) as num_of_coustmers 
from customer 
group by cust_country;
/*Lists the number of orders sent by each agent*/
select agent_code , count(*) as num_of_orders
from orders
group by agent_code;
/*Lists the number of customers in each country. Only include countries with more than 5 customers*/
select cust_country , count(*) as num_of_coustmers
from customer
group by CUST_COUNTRY
having count(*)>5;