Select *
from film;

--Get the first and last names as well as the emails of all customers:
Select first_name, last_name, email
from customer;

-- Get the title, description, release_year and lenght from table:
Select title, description, release_year, length 
from film;

--Now, let us try to return a unique value. For this, we use the command 'distinct': 
Select Distinct rating
from film;

--Get the distinct rental_rate:
Select distinct rental_rate
from film;

--Set conditions/filters for the code, using the 'where' function:
Select title, description, release_year, rating
from film
where rating = 'PG13';

--Get a specific customer with first_name (Jamie)
Select *
From customer
where first_name = 'Jamie';

--The issue here is that there are actually two Jamies on the list but I specifically
--want Jamie Rice. Therefore I will apply some extra criteria's to the where function:

--Using the 'where' statment with 'AND/OR':
Select first_name, last_name, email
From customer
Where first_name = 'Jamie' and last_name = 'Rice';

--Using  the 'OR' condition:
--Return (title, description, release_year and rental_rate) where the rate is <1 or >8:
Select title, description, release_year, rental_rate
from film
where rental_rate < 1 or rental_rate > 8;

--Using the "count" function
--Count all 'R' rated films:
Select Count (*)
from film
where rating = 'R';

--count all the films where rental_duration < 3 days
Select count (*)
from film
where rental_duration < 3;

--Return (title, description, release_year, rental_rate) for films with rental_rate less
-- than 1.00USD or greater than 8.00USD:

Select title, description, release_year, rental_rate
from film
where rental_rate < 1 or rental_rate > 8;

--Count all R rated films:
Select count (*)
from film
where rating = 'R';

--Count all films where rental_duration < 3 days:
Select count (*)
from film
where rental_duration < 3;

--Using the function 'Count Distinct'. Count all distinct ratings:
Select count (distinct (rating))
from film;

--Count distinct rental_rate:
Select count (distinct(rental_rate))
from film;

--LIMIT (this function is used to return a selected few of all the records, depending on what 
--number you set it to):
Select *
from film
limit 10;

--Order By (allows your query to appear in ascending (asc) or descending (desc) order):
select first_name, last_name, email
from customer
order by first_name;

--Get the customer ID numbers and Amount for the top 10 highest amounts (payments):
Select customer_id, amount
from payment
order by amount desc
limit 10;

--Get the titles of the movies with film ID 1-5:
Select film_id, title
from film
order by film_id
limit 5;

--Since we want to use the film Id to order, it should also be selected.

--BETWEEN STATEMENT (used when working with a range of different values)
--Return payment_id, customer_id and amount between 8 and 9:

Select payment_id, customer_id, amount
from payment
where amount between 8 and 9
order by amount desc;

--show the payments that occurred between february/1/2007 and March/1/2007. Return payment_id, customer_id,
--amount:
Select payment_id, customer_id, amount, payment date
from payment
where payment_date between '2007-02-01' and '2007-03-01';

--NOT BETWEEN:
Select payment_id, customer_id, amount
from payment
where amount not between 8 and 9;

--IN STATEMENT(Allows you filter based on a list).
--Return the first_name, last_name, email of customers with id (100, 12, 37, 50, 77, 29):
select customer_id, first_name, last_name, email
from customer
where customer_id in (100, 12 ,37, 50, 77, 29);


--LIKE STATEMENT 
--Look for records of a customer whose first name starts with 'Jen':
select first_name, last_name, email
from customer
where first_name like 'Jen%';

--NOTE: The like statement is case sensitive and so you need to know how the values are written. 
--When in doubt, just use the 'ilike sattement' as this removes the case sensitivity. 

--ILIKE STATEMENT:
--Return the titel, description and rating of movies with description that has dog:;
Select title, description, rating
from film
where description ilike '%dog%';

--NOT LIKE STATEMENT
--Look for records of a customer whose first name does not start with 'Jen':
select first_name, last_name, email
from customer
where first_name not like 'Jen%';

--Aggregate Function (sum, average, minimum, maximum, count):
Select sum(amount)
from payment;

Select round(avg(amount), 0)
from payment;

Select round(sum(amount), 2)
from payment;

--GROUP BY STATEMENT (Helps to collate aggregated statement):
Select staff_id, sum(amount)
from payment
group by staff_id;

--How many films of each rating type do we have>
Select rating, count(title)
from film
group by rating
order by count(title) desc;

--Corporate headquarters is audting our store. They want to know the average replaceemn cost of movies by
--rating:
Select rating, avg(replacement_cost)
from film
group by rating;

--HAVING STATEMENT:
--Return customer with the highest transaction amount:
Select customer_id, sum(amount)
from payment
group by customer_id
having sum(amount) > 150
order by sum(amount) desc;

--When grouped by rating, what movie ratings have an average rental duration of more than 5 days?
Select rating, avg(rental_duration)
from film
group by rating
having rental_duration > 5;

--AS STATEMENT (Alias):
Select rating as film_rating, avg(rental_duration) as film_rentdur
from film
group by rating
having avg(rental_duration) > 5;


--JOIN FUNCTION
Select first_name, last_name, email, customer.address_id, address, district
from customer
join address on customer.address_id = address.address_id;

--EXAMPLE:
Select title, description, release_year, name, film.language_id
from film
join language on film.language_id = language.language_id;
