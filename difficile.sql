# 37 - Pour quelle catégorie de film les DVD sont-ils le moins rendus (donc le plus volés) ?
SELECT c.name AS category, COUNT(*) AS `Nombre de DVD non rendus`
FROM rental r
         INNER JOIN inventory i ON r.inventory_id = i.inventory_id
         INNER JOIN film f ON i.film_id = f.film_id
         INNER JOIN film_category fc ON f.film_id = fc.film_id
         INNER JOIN category c ON fc.category_id = c.category_id
WHERE r.return_date IS NULL
GROUP BY c.category_id
ORDER BY `Nombre de DVD non rendus` DESC
LIMIT 1;


# 34 - Quel est le film le plus loué en Ukraine ?
SELECT f.title AS `Film le plus loué en Ukraine`, COUNT(*) AS "Nombre de locations"
FROM rental r
         INNER JOIN inventory i ON r.inventory_id = i.inventory_id
         INNER JOIN film f ON i.film_id = f.film_id
         INNER JOIN customer ct ON r.customer_id = ct.customer_id
         INNER JOIN address a ON ct.address_id = a.address_id
         INNER JOIN city c ON a.city_id = c.city_id
         INNER JOIN country cy ON c.country_id = cy.country_id
WHERE cy.country = 'Ukraine'
GROUP BY f.title
ORDER BY `Nombre de locations` DESC
LIMIT 1;



