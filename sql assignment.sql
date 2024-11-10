create database assignment;
use assignment;


-- Ques 1
create table employees(
emp_id integer NOT NULL PRIMARY KEY,
emp_name text NOT NULL,
age integer check(age >=18),
email varchar(60) unique,
salary decimal(10,4) default 30000);


-- Ques 2
/*Constraints are the rules that are applied to the table which help in data accuracy and reliability. It ensures that the data in the Database doesn’t violate any accuracy.
Constraints help in data integrity as:
1.	It ensures the data entered doesn’t violate the rules, it prevents the data from wrong entry like negative age etc.
2.	It helps in building relationships between the tables.
Common types of constraints are:
1.	FOREIGN KEY
2.	PRIMARY KEY
3.	NOT NULL
4.	UNIQUE
5.	CHECK */

-- Ques 3
/*We would apply NOT NULL constraint to a column to set a rule that the column should not accept the NULL values that means in the column every row should contain a value.
NO, Primary Key cannot contain NULL values as the rules of the PRIMARY KEY constraint is that it should have UNIQUE and NOT NULL values. If PRIMARY KEY allows the NULL values then there will also be violation of UNIQUENESS in the values.
*/


-- Ques 4
create table student(
student_id varchar(10),
student_name varchar(20),
age integer 
);

-- adding constraint
alter table student
add constraint primary key (student_id);

-- removing constraint
alter table student
drop primary key;

insert into student values
(1,"Raj",18),
(1,"Sohan",22);

drop table student;

-- Ques 5
/*If we violates constraints in data while insert, update or delete of data then the DBMS will prevent the operation from being completed. This is done to maintain the data integrity. In this case DBMS will throw an error message explaining the violation of constraints.
Example:
If we try to insert any duplicate or null value in the column having PRIMARY KEY then it will throw an error and no new value will be added.
Code : insert into student values
(1,"Raj",18),
(1,"Sohan",22);
ERROR MESSAGE :
0	629	02:46:57	insert into student values (1,"Raj",18), (1,"Sohan",22)	Error Code: 1062. Duplicate entry '1' for key 'student.PRIMARY'	0.016 sec
*/


-- Ques 6
CREATE TABLE products (

    product_id INT,

    product_name VARCHAR(50),

    price DECIMAL(10, 2));
    
    -- To add Constraint
    alter table products
    add constraint primary key(product_id);
    
    -- To add default value
alter table products
modify price decimal(10,2) default 50.00;

drop table products;

-- Ques 7 
/*Write a query to fetch the student_name and class_name for each student using an INNER JOIN*/

create table students(
student_id int,
student_name varchar(20),
class_id int
);
create table classes(
class_id int,
class_name varchar(20)
);
insert into students values(
1,"Alice",101),
(2,"Bob",102),
(3,"Charlie",103);
insert into classes values
(101,"Maths"),
(102,"Science"),
(103,"History");

select 
	s.student_name,	
    c.class_name 
from 
	students s
join
	classes c 
    on c.class_id = s.class_id
;

-- Ques.8
/*Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are
listed even if they are not associated with an order */

create table Orders (
order_id int,
order_date date,
customer_id int
);

create table Customers(
customer_id int,
customer_name varchar(20)
);

create table Products(
product_id int,
product_name varchar(20),
order_id int);

insert into Orders values
(1,"2024-01-01",101),
(2,"2024-01-03",102);

insert into Customers values
(101,"Alice"),
(102,"Bob");

insert into Products values
(1,"Laptop",1),
(2,"Phone",NULL);

WITH OP AS (
select 
	o.order_id,
    p.product_id,
    o.customer_id,
    p.product_name 
from products p
left join orders o
on
p.order_id = o.order_id
UNION
select 
	o.order_id,
    o.customer_id,
    p.product_name,
    p.product_id
    from products p
RIGHT join orders o
on
o.order_id = p.order_id)
SELECT OP.order_id,
c.customer_name,
OP.product_name
from OP
left join customers c 
on
OP.customer_id = c.customer_id; 


-- Ques 9

create table Sales(
sale_id varchar(10) ,
product_id varchar(5) ,
amount int
);

drop table products;
create table products(
product_id varchar(10),
product_name varchar(10)
);

insert into Sales values
(1,101,500),
(2,102,300),
(3,101,700);

insert into products values
(101,"Laptop"),
(102,"Phone");

select * from Sales;
select * from products;

select s.product_id , sum(s.amount) as total_amount from 
sales s inner join products p
on s.product_id = p.product_id
group by product_id;

-- Ques 10
drop table orders;
create table orders(
order_id varchar(10),
order_date date ,
customer_id varchar(10)
);

drop table customers;
create table customers(
customer_id varchar(10),
customer_name varchar(10)
);

create table order_details(
order_id varchar(4),
product_id varchar(4),
quantity integer 
);

insert into orders values
(1,'2024-01-02',1),
(2, '2024-01-05',2);

insert into order_details values
(1,101,2),
(1,102,1),
(2,101,3);

insert into customers values
(1,"Alice"),
(2,"Bob");

select o.order_id , c.customer_name , od.quantity from
order_details od inner join orders o 
on od.order_id = o.order_id
inner join customers c
on c.customer_id = o.customer_id;




/*SQL Commands*/


USE mavenmovies;
 
 -- Ques No 1
select TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME,
CASE
WHEN CONSTRAINt_NAME = "PRIMARY" THEN "PRIMARY KEY"
ELSE "FOREIGN KEY"
END AS CONSTRAINT_
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'mavenmovies';

-- Ques No. 2
select * from actor;

-- Ques No.3
select * from customer;

-- Ques No.4
select distinct(country) from country;

 -- Ques No.5
 select customer_id,first_name from customer
 where active = 1;
 
 -- Ques No.6 
 select rental_id from rental
 where customer_id = 1;
 
 -- Ques No.7
 select * from film
 where rental_duration >5;
 
 -- Ques No.8
 select count(*) from film
 where replacement_cost between 15 and 20;

-- Ques No.9
 select count(distinct(first_name)) from actor;
 
-- Ques. No.10
select * from customer
limit 10;

-- Ques.No.11
select * from customer
where first_name like "B%"
limit 3;

-- Ques.No.12
select title , rating from film
where rating = "G"
limit 5;

-- Ques.No.13
select * from customer
where first_name like "a%";

-- Ques.No.14
select * from customer
where first_name like "%a";

-- Ques.No.15
select * from city
where city like "a%a";

-- Ques.No.16
select * from customer
where first_name like "%NI%";

-- Ques.No.17
select * from customer
where first_name like "_r%";

-- Ques.No.18
select * from customer
where first_name like "a%" and length(first_name)>=5;

-- Ques.No.19
select * from customer
where first_name like "a%o";

-- Ques.No.20
select title,rating from film
where rating in ('PG' ,'PG-13') ;

-- Ques.No.21
select * from film
where length(title) between 50 and 100;

-- Ques.No.22
select * from actor 
limit 50;

-- Ques.No.23
select distinct(film_id) from inventory;


/*Functions
Basic Aggregate Functions*/


use sakila;

-- -- Ques.No.1
select count(rental_id) from rental;

-- Ques.No.2
select avg(datediff(return_date,rental_date)) as avg_duration from rental;

-- Ques.No.3
select upper(first_name) as FIRST_Name , upper(last_name) as LAST_Name from customer;

-- Ques.No.4
select month(rental_date) as rental_month,rental_id from rental;

-- Ques.No.5
select count(rental_id) as rental_count,customer_id from rental
group by customer_id;

-- Ques.No.6
select s.store_id,sum(p.amount) as total_revenue from
payment p join customer c
on p.customer_id=c.customer_id
join store s
on c.store_id=s.store_id
group by s.store_id;

-- Ques.No.7
select count(r.rental_id)as total_rentals,c.name ,fc.category_id from rental r
join inventory i on r.inventory_id=i.inventory_id
join film_category fc on i.film_id = fc.film_id
join category c on fc.category_id=c.category_id
group by c.name,fc.category_id;

-- Ques.No.8
select avg(f.rental_rate) as average_rate , l.name from language l
join film f on f.language_id=l.language_id
group by l.name;

/*Joins

Questions 9 
Display the title of the movie, customer s first name, and last name who rented it.*/

select f.title , c.first_name,c.last_name from film f
join inventory i  on i.film_id=f.film_id
join rental r on i.inventory_id=r.inventory_id
join customer c on c.customer_id= r.customer_id;

/*Question 10:

Retrieve the names of all actors who have appeared in the film "Gone with the Wind."*/

select a.first_name as name,f.title as title from film_actor fa
join film f on f.film_id=fa.film_id
join actor a on fa.actor_id=a.actor_id
where f.title = "Gone with the Wind.";	

/*Question 11:
Retrieve the customer names along with the total amount they've spent on rentals.*/

select concat(c.first_name," ",c.last_name) as Customer_name ,sum(p.amount) as total_amount from customer c
join payment p on c.customer_id=p.customer_id
join rental r on r.rental_id=p.rental_id
group by concat(c.first_name," ",c.last_name);

/*Question 12:
List the titles of movies rented by each customer in a particular city (e.g., 'London').*/

select f.title , concat(c.first_name," ",c.last_name) as customer_name,ci.city from city ci
join address a on a.city_id = ci.city_id
join customer c on c.address_id=a.address_id
join rental r on r.customer_id=c.customer_id
join inventory i on i.inventory_id=r.inventory_id
join film f on f.film_id=i.film_id;

/*Advanced Joins and GROUP BY:*/

/*Question 13:
Display the top 5 rented movies along with the number of times they've been rented.*/

select f.title,count(r.rental_id) as time_rented from rental r
join inventory i on i.inventory_id=r.inventory_id
join film f on f.film_id=i.film_id
group by f.title
order by time_rented desc
limit 5;

/*Question 14:
Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).*/

select concat(c.first_name," ",c.last_name) as customer_name ,count(distinct i.store_id) as store_count from  rental r 
join inventory i on r.inventory_id=i.inventory_id
join customer c on c.customer_id = r.customer_id
/*where i.store_id in (1,2)*/
group by customer_name
having store_count = (select count(distinct store_id) from store) ;


/*Windows Function:*/

/*QUES.NO.1
 Rank the customers based on the total amount they've spent on rentals */
 
 use sakila;
 
	 select c.customer_id,r.rental_id,concat(c.first_name ," ",c.last_name) as cust_name , sum(p.amount) as total_amount, 
	 rank() over(order by sum(p.amount) desc) as rank_by_amount  from payment p 
	 join customer c on p.customer_id=c.customer_id
     join rental r on p.rental_id=r.rental_id
	 group by c.customer_id,cust_name, r.rental_id;
	 ; 
	 
/*Ques.No.2
. Calculate the cumulative revenue generated by each film over time.*/

select f.title,f.film_id,p.payment_date,sum(p.amount) over (partition by f.film_id order by payment_date desc) as cumulative_revenue from  payment p
join rental r on p.customer_id = r.customer_id  
join inventory i on r.inventory_id=i.inventory_id
join film f on i.film_id=f.film_id 
order by f.title,f.film_id  ;


/*Ques.No.3
Determine the average rental duration for each film, considering films with similar lengths.*/

select title, length , avg(rental_duration) over (partition by length order by title desc) as avg_rental_dusration from film;

/*Ques.No. 4
Identify the top 3 films in each category based on their rental counts.*/

with ranked_film as (
select f.title , c.name,count(r.rental_id) as rental_count,dense_rank() over (partition by c.name order by count(r.rental_id) desc) as rank_ from rental r
join inventory i on i.inventory_id= r.inventory_id
join film_category fc on fc.film_id=i.film_id
join category c on c.category_id=fc.category_id
join film f on fc.film_id=f.film_id
group by f.title, c.name)
select title,name , rank_,rental_count from ranked_film
where rank_<=3
order by rank_ desc;

/*Ques.No.5
 Calculate the difference in rental counts between each customer's total rentals and the average rentals
across all customers.*/

with customer_rentals as (
select customer_id, count(rental_id) as rental_count from rental
group by customer_id)
select customer_id,rental_count,avg(rental_count) over () as avg_count,
rental_count-avg(rental_count) over () as diff_rental
from customer_rentals;

/*Ques.No.6
Find the monthly revenue trend for the entire rental store over time*/

select date_format(payment_date,' %Y-%m') as month_,
sum(amount)	as total_revenue
from payment
group by month_
order by month_;  


/*Ques.No.7
 Identify the customers whose total spending on rentals falls within the top 20% of all customers.*/
 
 with customer_spending as (
 select customer_id ,sum(amount) as total_spending,
 ntile(5) over (order by sum(amount)) as spending_rank
 from payment 
 group by customer_id)
 select customer_id,total_spending
 from customer_spending
 where spending_rank =1;

/*Ques.No.8
 Calculate the running total of rentals per category, ordered by rental count.*/
 
 with customer_rentals as (
 select c.name as category_name ,
 count(r.rental_id) as rental_count from category c
 join film_category fc on c.category_id=fc.category_id
 join film f on f.film_id=fc.film_id
 join inventory i on i.film_id=f.film_id
 join rental r on r.inventory_id=i.inventory_id
 group by c.name)
 select category_name,rental_count,
 sum(rental_count) over (order by rental_count desc) as running_sum from
 customer_rentals
 order by rental_count desc;


/*Ques.No.9
 Find the films that have been rented less than the average rental count for their respective categories.*/
 

with film_rental_count as (
select 
	f.film_id,
	f.title , 
    fc.category_id ,
    count(r.rental_id) as rental_count
from film f
join film_category fc on f.film_id = fc.film_id
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
group by f.title,fc.category_id,f.film_id),

avg_cat_rental as (
select category_id , avg(rental_count) as avg_cat_rental_count from film_rental_count
group by category_id)

select 
	frc.film_id,
    frc.title,
    frc.category_id,
    frc.rental_count,
    acr.avg_cat_rental_count 
from film_rental_count  frc
join avg_cat_rental acr on frc.category_id = acr.category_id
where frc.rental_count < acr.avg_cat_rental_count
order by frc.category_id,frc.rental_count desc;
    


/*Ques.No.10
Identify the top 5 months with the highest revenue and display the revenue generated in each month*/
use sakila;
select sum(amount) as total_revenue,date_format(payment_date,'%M')as month_
from payment
group by month_
order by total_revenue desc
limit 5;



/*Normalisation & CT*/

-- Q1. Identify a table in the sakila database that violates 1NF. Explain how you would normalize it to achieve 1NF.
Select * from film;
-- In film table there is a two values given in the same row of special_features which violates the 1NF. 
-- so, we need to create another table 
-- to normalize the film table to represent the relationship between film and special features.

CREATE TABLE film_special_features (
    film_id smallint unsigned,
    special_feature set('Trailers','Commentaries','Deleted Scenes','Behind the Scenes'),
    PRIMARY KEY (film_id, special_feature),
    FOREIGN KEY (film_id) REFERENCES film(film_id)
);
-- Now we can insert values in different rows to achieve 1NF. 
INSERT INTO film_special_features (film_id, special_feature) VALUES
(1, 'Commentaries'),
(1, 'Trailers'),
(1, 'Deleted Scenes');

-- Ques.No.2
/*
Second Normal Form (2NF):
 a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. 
 If it violates 2NF, explain the steps to normalize it.
 */

select * from film;
describe film;
 -- 1. Identify Issue: Check if there are attributes (like language_id and original_language_id) in the table that depend on only part
 -- of the primary key (film_id).

-- 2.  Create New Table: If found, create a new table (e.g., film_language) with the partially dependent attributes 
-- (language_id and original_language_id) along with the part of the primary key they depend on (film_id).

-- 3. Maintain Relationship: In the new table, use foreign keys to maintain a relationship with the original table (film) based on the 
-- common key (film_id).

-- 4. Normalization Complete: This separation ensures that non-prime attributes are fully dependent on the entire primary key
-- in the original table, adhering to Second Normal Form (2NF).

CREATE TABLE film_language (
    film_id smallint unsigned PRIMARY KEY,
    language_id tinyint unsigned,
    original_language_id tinyint unsigned,
    FOREIGN KEY (film_id) REFERENCES film(film_id),
    FOREIGN KEY (language_id) REFERENCES language(language_id),
    FOREIGN KEY (original_language_id) REFERENCES language(language_id)
);

-- 5. Move Attributes: Move language_id and original_language_id to a new table (film_language).
-- 6. Include Key: Include film_id in the new table to maintain the relationship.
-- 7. Ensure Dependency: This normalization ensures that attributes depend fully on the entire primary key in the original film table,
--    meeting 2NF.

-- Third normal form (3NF) 
/* Ques.No.3.  
Identify a table in the sakila database that violates 3NF. Describe the transitive dependencies present and outline the steps
    to normalize the tables to 3NF.  
*/

-- Let's consider the film table in the Sakila database and check if it violates the Third Normal Form (3NF). 
describe film;
-- Now, let's assume that replacement_cost depends on length (film duration), and both length and replacement_cost depend on the film_id.
--  This would represent a transitive dependency.

-- 1. Identify Transitive Dependency: replacement_cost depends on length.
-- #  length and replacement_cost both depend on film_id
 -- # This creates a transitive dependency: film_id -> length -> replacement_cost.
 
 -- 2. Normalize to 3NF: Create a new table (film_details) with columns related to the transitive dependency.
 -- #  Move the dependent columns (length, replacement_cost) to the new table.
 -- # Include the determinant (film_id) in both the original and new tables.


-- New table for transitive dependency
CREATE TABLE film_details (
    film_id smallint unsigned PRIMARY KEY,
    length smallint unsigned,
    replacement_cost DECIMAL(5,2),
    FOREIGN KEY (film_id) REFERENCES film(film_id)
);
-- By creating the film_details table and moving the columns with the transitive dependency, we ensure that the replacement_cost is now
-- directly dependent on the primary key (film_id), meeting the requirements of the Third Normal Form (3NF).



--  Normalization Process 

-- Ques.No.4.

/*Take a specific table in sakila and guide through the process of normalizing it fromn the initial unnormalized from up to at least 2NF. */

-- Initial Unnormalized Form:
-- Consider the provided film table with potential redundancy.

-- First Normal Form (1NF):
-- The table is already in 1NF as each column contains atomic values.

-- Second Normal Form (2NF):
-- Identify potential partial dependencies, e.g., rental_rate depends only on film_id.

-- Steps to Normalize to 2NF:
-- 1. Create a new table (film_detail) for attributes partially dependent on the primary key:
CREATE TABLE film_detail (
    film_id smallint unsigned PRIMARY KEY,
    rental_rate DECIMAL(4,2),
    FOREIGN KEY (film_id) REFERENCES film(film_id)
);

-- 2. Modify the original table by removing the attributes moved to the new table:
ALTER TABLE film
DROP COLUMN rental_rate;

-- Resulting Normalized Tables:

-- Original Table (film):
describe film;

-- New Table (film_detail):
CREATE TABLE film_detail (
    film_id smallint unsigned PRIMARY KEY,
    rental_rate DECIMAL(4,2),
    FOREIGN KEY (film_id) REFERENCES film(film_id)
);
-- Ques. No.5
/* CTE Basics:

 a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they 

 have acted in from the actor and film_actor tables.*/
 

use sakila;

 with film_count as(
 select count(fa.film_id) as films_count,
 a.first_name as actor_name
 from
 actor a
 join film_actor fa on
 a.actor_id = fa.actor_id
 group by a.first_name
 )
 select 
	actor_name,
    films_count 
    actor_name 
    from film_count ;
    
-- Ques.No.6
/*CTE with Joins:

 a. Create a CTE that combines information from the film and language tables to display the film title, 

 language name, and rental rate.*/
 
with cte as (
select 
f.title,
f.rental_rate,
l.name as language_name
from film f
join language l
on
f.language_id=l.language_id
)
select * from cte;


-- Ques.No.7
/*c\ CTE for Aggregation:

 a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) 

 from the customer and payment tables.*/
 
 with cte as (
 select 
 c.customer_id,
 c.first_name,
 sum(p.amount) as total_revenue
 from customer c
 join
 payment p
 on 
 c.customer_id=p.customer_id
 group by c.customer_id , 
 c.first_name
 )
 select * from cte;
 
 
 -- Ques.No.8
 /*CTE with Window Functions:

 a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.*/
 
 with ranked_film as (
 select 
 film_id ,
 title,
 rental_duration,
 rank() over (order by rental_duration desc) as rank_by_duration
 from film
 )
 select * from ranked_film;
 
 
 -- Ques.No.9
 /*CTE and Filtering:

 a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the 

 customer table to retrieve additional customer details.*/
 
 with cte as (
 select
 c.customer_id as customer_id,
 count(r.rental_id) as rental_count
 from 
 rental r
 join
 customer c 
 on
 r.customer_id = c.customer_id
  group by 
  c.customer_id
  having count(r.rental_id) >2
  )
select c.first_name , 
c.last_name,
cte.customer_id ,
cte.rental_count
from cte 
join customer c 
on 
cte.customer_id = c.customer_id
order by rental_count;

-- Ques.No.10
/*' CTE for Date Calculations:

 a. Write a query using a CTE to find the total number of rentals made each month, considering the 

 rental_date from the rental table.*/
 
 WITH CTE AS (
 SELECT 
 rental_date,
 count(rental_id) as rental_count
 from rental
 group by rental_date
 )
 select rental_count,
 date_format(rental_date,'%M-%y') AS rental_month,
 rental_date
 from CTE;
 
 
-- Ques.No.11
/*CTE and Self-Join:

 a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film 

 together, using the film_actor table.*/
 
 WITH ActorPairs AS (
    SELECT 
        fa1.actor_id AS actor_id_1,
        fa2.actor_id AS actor_id_2,
        fa1.film_id
    FROM film_actor fa1
    JOIN film_actor fa2 
        ON fa1.film_id = fa2.film_id
        AND fa1.actor_id > fa2.actor_id
)
SELECT 
   ActorPairs.film_id,
   a1.first_name AS actor_1_first_name,
    a1.last_name AS actor_1_last_name,
    a2.first_name AS actor_2_first_name,
    a2.last_name AS actor_2_last_name
    
FROM ActorPairs
JOIN actor a1 ON ActorPairs.actor_id_1 = a1.actor_id
JOIN actor a2 ON ActorPairs.actor_id_2 = a2.actor_id;
 
 -- Ques.No.12
 /*. CTE for Recursive Search:

 a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, 

 considering the reports_to column*/
 use sakila;
WITH RECURSIVE EmployeesHierarchy AS (
Select store_id, manager_staff_id
From store where manager_staff_id is not null
UNION 
Select s.store_id, s.manager_staff_id
From EmployeesHierarchy H
inner join store s on H.manager_staff_id = s.manager_staff_id
)
select * From EmployeesHierarchy H2
inner join staff st2 on st2.store_id = H2.manager_staff_id;