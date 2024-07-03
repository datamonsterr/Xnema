-- name: GetScheduleDate :many
SELECT DISTINCT schedule_movie_date FROM schedule
WHERE movie_id = $1;

-- name: GetScheduleCinema :one
SELECT DISTINCT cinema_id FROM schedule
WHERE movie_id = $1 AND schedule_movie_date = $2;

-- name: GetScheduleTime :many
SELECT schedule_id ,schedule_movie_start, room_id FROM schedule
WHERE movie_id = $1 AND schedule_movie_date = $2;

-- name: GetSeat :many
SELECT * FROM seat
WHERE room_id = $1;

-- name: GetSelectedSeat :many
SELECT seat_id FROM ticket
WHERE schedule_id = $1;

-- name: BookTicket :one
INSERT INTO ticket (user_id, movie_id, cinema_id, schedule_id, seat_id)
VALUES ($1, $2, $3, $4, $5)
RETURNING ticket.id;