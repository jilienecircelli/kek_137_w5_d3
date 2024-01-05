-- Question 1
SELECT cu.first_name, cu.last_name
FROM customer cu
JOIN address a ON cu.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
WHERE a.district = 'Texas';



-- Question 2
SELECT c.first_name, c.last_name, p.amount 
FROM payment p 
JOIN customer c ON p.customer_id = c.customer_id 
WHERE p.amount > 7.00;


-- Question 3
SELECT c.first_name, c.last_name 
FROM customer c 
WHERE c.customer_id IN (
    SELECT p.customer_id 
    FROM payment p 
    GROUP BY p.customer_id 
    HAVING SUM(p.amount) > 175
);


-- Question 4
SELECT cu.first_name, cu.last_name
FROM customer cu
JOIN address a ON cu.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
WHERE co.country = 'Argentina';


-- Question 5
SELECT cat.name, COUNT(fc.film_id) as film_count 
FROM category cat 
JOIN film_category fc ON cat.category_id = fc.category_id 
GROUP BY cat.name 
ORDER BY film_count DESC;


-- Question 6
SELECT f.title, f.description, COUNT(fa.actor_id) as actor_count 
FROM film f 
JOIN film_actor fa ON f.film_id = fa.film_id 
GROUP BY f.film_id 
ORDER BY actor_count DESC 
LIMIT 1;




-- Question 7
SELECT a.first_name, a.last_name, COUNT(fa.film_id) as film_count 
FROM actor a 
JOIN film_actor fa ON a.actor_id = fa.actor_id 
GROUP BY a.actor_id 
ORDER BY film_count ASC 
LIMIT 1;




-- Question 8
SELECT co.country, COUNT(ci.city_id) as city_count 
FROM country co 
JOIN city ci ON co.country_id = ci.country_id 
GROUP BY co.country_id 
ORDER BY city_count DESC 
LIMIT 1;




-- Question 9
SELECT a.first_name, a.last_name, COUNT(fa.film_id) as film_count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(fa.film_id) BETWEEN 20 AND 25;


SELECT *
FROM address
