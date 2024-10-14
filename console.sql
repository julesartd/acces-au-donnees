#1 Combien de films dans lequel Nick WAHLBERG à joué ?
SELECT COUNT(fa.film_id) as "Nombre de films dans lequel Nick WAHLBERG à joué" FROM film
    INNER JOIN sakila.film_actor fa on film.film_id = fa.film_id
    INNER JOIN actor a on fa.actor_id = a.actor_id
    WHERE a.first_name = 'NICK' AND a.last_name = 'WAHLBERG';


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
SELECT city FROM city WHERE city_id = 30;

#7 Quelle est la catégorie du film TYCOON GATHERING ?
SELECT c.name as "Catégorie du film TYCOON GATHERING"
FROM film f
    INNER JOIN film_category fc on f.film_id = fc.film_id
    INNER JOIN category c on fc.category_id = c.category_id
    WHERE f.title = 'TYCOON GATHERING';


#8 Où habite ROBERT BAUGHMAN ? (c'est une personne que l'on peut trouver dans la table customer)
SELECT city FROM city
    INNER JOIN address a on city.city_id = a.city_id
    INNER JOIN customer c on a.address_id = c.address_id
    WHERE c.first_name = 'ROBERT' AND c.last_name = 'BAUGHMAN';

#9 Combien d'adresses sont-elles liées à la ville d'Aurora ?
SELECT COUNT(a.address_id) as "Nombre d'adresses liées à la ville d'Aurora"
FROM address a
    INNER JOIN city c on a.city_id = c.city_id
    WHERE c.city = 'Aurora';