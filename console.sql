#1 Combien de films dans lequel Nick WAHLBERG à joué ?
SELECT COUNT(fa.film_id) as "Nombre de films dans lequel Nick WAHLBERG à joué"
FROM film
         INNER JOIN sakila.film_actor fa on film.film_id = fa.film_id
         INNER JOIN actor a on fa.actor_id = a.actor_id
WHERE a.first_name = 'NICK'
  AND a.last_name = 'WAHLBERG';


#2 Combien y'a t'il de films ?
SELECT COUNT(film_id) as "Nombre de films"
FROM film;

# 3 Combien y'a t'il de films d'actions ?
SELECT COUNT(f.film_id) as "Nombre de films d'actions"
FROM film f
         INNER JOIN film_category fc on f.film_id = fc.film_id
         INNER JOIN category c on fc.category_id = c.category_id
WHERE c.name = 'Action';

#4 Combien y'a t'il de films d'horreur ?
SELECT COUNT(f.film_id) as "Nombre de films d'horreurs"
FROM film f
         INNER JOIN film_category fc on f.film_id = fc.film_id
         INNER JOIN category c on fc.category_id = c.category_id
WHERE c.name = 'Horror';

#5 Quelle est la ville avec l'identiant 30 ?
SELECT COUNT(city) as "Nombre de villes du Soudan"
FROM city
         INNER JOIN country c on city.country_id = c.country_id
WHERE c.country = 'Sudan';


#6 Quelle est la ville avec l'identiant 30 ?
SELECT city
FROM city
WHERE city_id = 30;

#7 Quelle est la catégorie du film TYCOON GATHERING ?
SELECT c.name as "Catégorie du film TYCOON GATHERING"
FROM film f
         INNER JOIN film_category fc on f.film_id = fc.film_id
         INNER JOIN category c on fc.category_id = c.category_id
WHERE f.title = 'TYCOON GATHERING';


#8 Où habite ROBERT BAUGHMAN ? (c'est une personne que l'on peut trouver dans la table customer)
SELECT city
FROM city
         INNER JOIN address a on city.city_id = a.city_id
         INNER JOIN customer c on a.address_id = c.address_id
WHERE c.first_name = 'ROBERT'
  AND c.last_name = 'BAUGHMAN';

#9 Combien d'adresses sont-elles liées à la ville d'Aurora ?
SELECT COUNT(a.address_id) as "Nombre d'adresses liées à la ville d'Aurora"
FROM address a
         INNER JOIN city c on a.city_id = c.city_id
WHERE c.city = 'Aurora';

# Combien d'argent a engrangé chaque magasin ?
SELECT s.store_id,
       SUM(p.amount) as "Argent engrangé"
FROM payment p
         INNER JOIN rental r on p.rental_id = r.rental_id
         INNER JOIN inventory i on r.inventory_id = i.inventory_id
         INNER JOIN store s on i.store_id = s.store_id
GROUP BY s.store_id;

# Requête de la view sales_by_store
SELECT CONCAT(c.city, ',', cy.country)        AS store,
       CONCAT(m.first_name, ' ', m.last_name) AS manager,
       SUM(p.amount)                          AS total_sales
FROM payment p
         INNER JOIN rental r ON p.rental_id = r.rental_id
         INNER JOIN inventory i ON r.inventory_id = i.inventory_id
         INNER JOIN store s ON i.store_id = s.store_id
         INNER JOIN address a ON s.address_id = a.address_id
         INNER JOIN city c ON a.city_id = c.city_id
         INNER JOIN country cy ON c.country_id = cy.country_id
         INNER JOIN staff m ON s.manager_staff_id = m.staff_id
GROUP BY s.store_id
ORDER BY cy.country, c.city;


# Mauvaise version de la requete de la view sales_by_store
SELECT s.store_id,
       SUM(p.amount) AS "Argent engrangé"
FROM payment p
         INNER JOIN staff st ON p.staff_id = st.staff_id
         INNER JOIN store s ON st.store_id = s.store_id
GROUP BY s.store_id;


SELECT st.staff_id, st.first_name, st.last_name, s.store_id, s.store_name
FROM staff st
         INNER JOIN store s ON st.store_id = s.store_id;

# Réaliser une jointure entre staff et store (attention à ne pas sélectionner toutes les colonnes)
SELECT st.staff_id, st.first_name, st.last_name, s.store_id
FROM staff st
         INNER JOIN store s ON st.store_id = s.store_id;

# Réaliser une jointure entre country et city
SELECT c.country, ci.city
FROM country c
         INNER JOIN city ci ON c.country_id = ci.country_id;

# Réaliser une jointure entre film, film_category et category
SELECT f.title, c.name
FROM film f
         INNER JOIN film_category fc ON f.film_id = fc.film_id
         INNER JOIN category c ON fc.category_id = c.category_id;

# Réaliser une jointure entre film, film_category et category
SELECT f.title, c.name
FROM film f
         INNER JOIN film_category fc ON f.film_id = fc.film_id
         INNER JOIN category c ON fc.category_id = c.category_id;

# Affichez dans une requête le titre, la langue et la catégorie du film de votre choix
SELECT f.title, l.name, c.name
FROM film f
         INNER JOIN language l ON f.language_id = l.language_id
         INNER JOIN film_category fc ON f.film_id = fc.film_id
         INNER JOIN category c ON fc.category_id = c.category_id
WHERE f.title = 'ACADEMY DINOSAUR';