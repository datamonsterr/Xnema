-- name: GetMovie :one
SELECT * FROM movie 
WHERE movie_id = $1 LIMIT 1;

-- name: GetMovies :many
SELECT * FROM movie LIMIT 20;

-- name: GetScheduleDate :many
SELECT DISTINCT schedule_movie_date FROM schedule
WHERE movie_id = $1;

-- name: GetScheduleTime :many
SELECT schedule_movie_start FROM schedule
WHERE movie_id = $1 AND schedule_movie_date = $2;

-- name: BookTicket :one
INSERT INTO ticket (user_id, movie_id, cinema_id, schedule_id, seat_id)
VALUES ($1, $2, $3, $4, $5);