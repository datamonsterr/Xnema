-- name: GetMovie :one
SELECT * FROM movie 
WHERE movie_id = $1 LIMIT 1;

-- name: GetMovies :many
SELECT * FROM movie LIMIT 20;