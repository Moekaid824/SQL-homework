-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT first_name, last_name
From actor
WHERE last_name = 'Wahlberg';
-- Answer = 2

-- 2. How many payments were made between $3.99 and $5.99?
SELECT amount
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
-- Answer = 4794

-- 3. What film does the store have the most of? (search in inventory table)
SELECT film_id, COUNT(*) AS copies
FROM inventory
GROUP BY film_id
ORDER BY copies DESC
LIMIT 1;
-- Answer = film_id 350 with a total copies of 8

-- 4. How many customers have the last name ‘William’?
SELECT first_name, last_name
From customer
WHERE last_name = 'William';
-- Answer = None

-- 5. What store employee (get the id) sold the most rentals?
SELECT staff_id, SUM(rental_id)
FROM rental
GROUP BY staff_id
ORDER BY SUM(rental_id)
-- Answer = Staff ID 1 got 64772289

-- 6. How many different distinct names are there?
SELECT COUNT (distinct first_name)
FROM customer
-- Answer = 591 -I tried but unfortunately the question is too vague

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT (actor_id) AS actor
FROM film_actor
GROUP BY film_id
ORDER BY actor DESC
LIMIT 1;
-- Answer = film_id got 588 and the actors are 15

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(*) as customers
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';
-- Answer = 13

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT COUNT(payment.amount) as rentals
FROM payment
JOIN rental ON payment.rental_id = rental.rental_id
JOIN customer ON rental.customer_id = customer.customer_id
WHERE payment.amount IN (4.99, 5.99)
AND customer.customer_id BETWEEN 380 AND 430
GROUP BY payment.amount
HAVING COUNT(*) > 250;
-- Answer = the amount of payment amounts that had a number of rentals above 250 is 290.

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT COUNT(DISTINCT rating) as ratings
FROM film;

SELECT rating, COUNT(*) as movies
FROM film
GROUP BY rating
ORDER BY movies DESC
LIMIT 1;
-- Answer = PG-13 and there are 223 movies and there are 5 categories