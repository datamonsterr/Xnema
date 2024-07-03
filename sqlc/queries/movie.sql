-- name: GetMovie :one
SELECT * FROM movie 
WHERE movie_id = $1 LIMIT 1;

-- name: GetMovies :many
SELECT DISTINCT m.*
FROM movie m
INNER JOIN schedule s ON m.movie_id = s.movie_id
ORDER BY m.release_date
LIMIT 10;