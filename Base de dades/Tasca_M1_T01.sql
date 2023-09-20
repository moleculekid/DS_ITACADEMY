#Exercici 1
El esquema titulado películas ('movies') está compuesto por 5 tablas: una para peliculas ('tb_movie'), una para el género de ellas ('tb_genre'), una para las personas implicada ('tb_person'), y una para el rol que tenian ('tb_role'). Cada una de estas dispone de un número de identificador (ID) respectivo. La 5a tabla es la de 'tb_movie_person' que dispone de 3 ids para pelicula, persona y rol, asi funcionando como vínculo entre dichas tablas. Existe otro vínculo a partir de peliculas ('tb_movies') hacia género ('movie_genre_id'), creando una relacion entre ellas.


#Exercici 2
USE movies;
SELECT person_name, person_country, person_dob, person_dod FROM movies.tb_person
WHERE person_dod IS NULL 
ORDER BY person_dob;

#Exercici 3
USE movies;
SELECT genre_name, COUNT(genre_id) AS total_movie  
FROM movies.tb_genre JOIN movies.tb_movie ON movies.tb_genre.genre_id = movies.tb_movie.movie_genre_id  
GROUP BY genre_name  ORDER BY total_movie DESC LIMIT 0, 1000

#Exercici 4
USE movies;
SELECT tb_person.person_name, tb_movie.movie_title, COUNT(tb_movie_person.role_id) AS max_role_per_movie
FROM tb_movie
JOIN tb_movie_person ON tb_movie.movie_id = tb_movie_person.movie_id
JOIN tb_person ON tb_movie_person.person_id = tb_person.person_id
GROUP BY tb_movie.movie_title, tb_person.person_name
HAVING COUNT(DISTINCT tb_movie_person.role_id) > 1
ORDER BY tb_person.person_name;

# mes rols per pelicula
SELECT tb_person.person_name, COUNT(tb_movie_person.role_id) AS total_role
FROM tb_person 
JOIN tb_movie_person
ON tb_person.person_id = tb_movie_person.person_id
GROUP BY 1 HAVING total_role > 1 ORDER BY total_role DESC;

#Exercici 5
USE movies;
INSERT INTO tb_genre (genre_id, genre_name, created_by_user, created_date, updated_date) 
VALUES ('69', 'Documental','Sole', '2023-01-02','2023-09-20')

#Exercici 6
USE movies;
DELETE FROM tb_movie
WHERE movie_id = 11;
SELECT * FROM movies.tb_movie;

#Exercici 7
USE movies;
UPDATE movies.tb_movie
SET movie_genre_id = 3
WHERE movie_id = 9;
SELECT * FROM movies.tb_movie;


