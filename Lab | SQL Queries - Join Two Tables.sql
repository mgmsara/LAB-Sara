use sakila;


#1. Which actor has appeared in the most films?
#Hint: group by actor_id

select actor_id, count(*) as count, first_name, last_name from sakila.film_actor as a
join sakila.actor using (actor_id)
group by actor_id
order by count desc
limit 1; 

# 2. Most active customer (the customer that has rented the most number of films)
select count(*) as count, first_name, last_name from sakila.rental as a
join sakila.customer using (customer_id)
group by customer_id
order by count desc
limit 1;

# 3. List number of films per category.
select count(*) as count, category_id from sakila.film_category as a
join sakila.film_category using (film_id)
group by category_id;


#select * from sakila.film_category order by category_id
#Total number
#select count(category_id) from sakila.film_category;

select c.name, count(film_id) as number_films from sakila.film_category as f
join sakila.category as c using (category_id)
group by name
order by number_films;

# 4. Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, address_id from sakila.staff as s
join sakila.address as a using (address_id);


# 5. get films titles where the film language is either English or italian, and whose titles starts with letter "M" , sorted by title descending.
use sakila;
select name, title from film as t 
join language using (language_id)
where name in ('English', 'Italian') and title regexp '^M';

# 6. Display the total amount rung up by each staff member in August of 2005.
use sakila;
select first_name, last_name, sum(amount) from sakila.payment
join staff using (staff_id)
where payment_date regexp '^2005-08'
group by staff_id;

# 7. List each film and the number of actors who are listed for that film.
use sakila;
select title, count(actor_id) from sakila.film
join film_actor using (film_id)
group by title;

# 8 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
use sakila;
select last_name, first_name, sum(amount) from customer
join payment using (customer_id)
group by (customer_id)
order by last_name;

# 9. Write sql statement to check if you can find any actor who never particiapted in any film.
use sakila;
select first_name, last_name, title from actor
left join film_actor using (actor_id)
right join film using (film_id)
where title is null;


#10  get the addresses that has NO customers, and ends with the letter "e"
use sakila;
select adress from adress
left join customer using (address_id)
where adress is null or regexp 'e$;




