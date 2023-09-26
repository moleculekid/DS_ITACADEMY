#Exercici 1 (vide file ex.1)
El esquema titulado películas ('movies') está compuesto por 5 tablas: una para peliculas ('tb_movie'), una para el género de ellas ('tb_genre'), una para las personas implicadas ('tb_person'), una para el rol que tenian ('tb_role') y una para detallar quien participo en dicha teplicula ('tb_movie_person'). 
  Las llaves primarias aparecen en dorado y son las siguientes role_id, person_id, movie_id y genre_id. Las llaves foraneas aparecen en rojo y son las siguientes : 
- movie_genre_id para tb_movie,
- person_parent_id para tb_person, 
- movie_id, person_id, role_id para tb_movie_person. 
  
#Exercici 2 (vide file ex.2)
USE movies;
SELECT person_name, person_country, person_dob, person_dod FROM movies.tb_person
WHERE person_dod IS NULL 
ORDER BY person_dob;

#Exercici 3 (vide file ex.3)
SELECT genre_name, COUNT(genre_id) AS total_movie  
FROM movies.tb_genre JOIN movies.tb_movie ON movies.tb_genre.genre_id = movies.tb_movie.movie_genre_id  
GROUP BY genre_name  ORDER BY total_movie DESC LIMIT 0, 1000;

#Exercici 4 (vide file ex.4a)
SELECT tb_person.person_name, tb_movie.movie_title, COUNT(tb_movie_person.role_id) AS max_role_per_movie
FROM tb_movie
JOIN tb_movie_person ON tb_movie.movie_id = tb_movie_person.movie_id
JOIN tb_person ON tb_movie_person.person_id = tb_person.person_id
GROUP BY tb_movie.movie_title, tb_person.person_name
HAVING COUNT(DISTINCT tb_movie_person.role_id) > 1
ORDER BY tb_person.person_name;

# mes rols per pelicula (vide file ex.4b)
SELECT tb_person.person_name, COUNT(tb_movie_person.role_id) AS total_role
FROM tb_person 
JOIN tb_movie_person
ON tb_person.person_id = tb_movie_person.person_id
GROUP BY 1 HAVING total_role > 1 ORDER BY total_role DESC;

#Exercici 5 (vide file ex.5)
INSERT INTO tb_genre (genre_id, genre_name, created_by_user, created_date, updated_date)
VALUES ('69', 'Documental','Sole', '2023-01-02','2023-09-20');

#Exercici 6 (vide file ex.6)
DELETE FROM tb_movie
WHERE movie_id = 11;
SELECT * FROM movies.tb_movie;

#Exercici 7 (vide file ex.7)
UPDATE movies.tb_movie
SET movie_genre_id = 3
WHERE movie_id = 9;
SELECT * FROM movies.tb_movie;
