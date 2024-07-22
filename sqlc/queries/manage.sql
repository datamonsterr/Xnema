-- name: GetAllCinemas :many
SELECT * FROM cinema;

-- name: GetAllRooms :many
SELECT * FROM room;

-- name: AddMovie :one
INSERT INTO movie(title, overview, original_language, release_date, length, url, tagline)
VALUES ($1, $2, $3, $4, $5, $6, $7)
RETURNING movie.movie_id;

-- name: AddSchedule :one
INSERT INTO schedule(movie_id, cinema_id, room_id, schedule_movie_date, schedule_movie_start)
VALUES ($1, $2, $3, $4, $5)
RETURNING schedule.schedule_id;