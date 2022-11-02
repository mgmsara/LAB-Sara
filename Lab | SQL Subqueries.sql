

use sakila;

#1. List all films whose length is longer than the average of all the films.

select title from film
where length > (
	select avg(length) from film)
	order by title;
    
    
#2. How many copies of the film Hunchback Impossible exist in the inventory system?

select count(film_id) from film
join inventory using (film_id)
where title in ('Hunchback Impossible')
group by film_id;


# 3. Use subqueries to display all actors who appear in the film Alone Trip.
select first_name, last_name from actor  
join film_actor using (actor_id)
where film_id = (
	select film_id from film where title in ('Alone Trip'));
    

#4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
#Identify all movies categorized as family films.

select name from category;

select title from film
where film_id in (
	select film_id from film_category where category_id in (
    select category_id from category where name='Family'));


# 5. Get name and email from customers from Canada using subqueries. 
#Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, 
#that will help you get the relevant information.

select first_name, last_name, email from customer
where address_id in (
	select address_id from address where city_id in (
    select city_id from city where country_id in (
    select country_id from country where country in ('Canada'))));
    

select first_name, last_name, email from customer
join address using (address_id)
join city using (city_id)
join country using (country_id)
