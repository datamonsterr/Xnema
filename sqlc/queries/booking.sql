-- name: GetScheduleDate :many
SELECT DISTINCT schedule_movie_date FROM schedule
WHERE movie_id = $1;

-- name: GetScheduleCinema :many
SELECT DISTINCT schedule.cinema_id, name 
FROM schedule 
INNER JOIN cinema ON schedule.cinema_id = cinema.cinema_id
WHERE movie_id = $1 AND schedule_movie_date = $2;

-- name: GetScheduleTime :many
SELECT schedule_id ,schedule_movie_start, schedule.room_id, room.type 
FROM schedule INNER JOIN room ON schedule.room_id = room.room_id
WHERE movie_id = $1 AND schedule_movie_date = $2 AND schedule.cinema_id = $3;

-- name: GetSeat :many
SELECT * 
FROM seat INNER JOIN schedule ON seat.room_id = schedule.room_id
WHERE schedule_id = $1
ORDER BY rowss;

-- name: GetSelectedSeat :many
SELECT seat_id FROM ticket
WHERE schedule_id = $1;

-- name: GetPrice :one
SELECT price FROM price WHERE type = $1;

-- name: BookTicket :one
INSERT INTO ticket (user_id, schedule_id, seat_id, totalprice, coupon)
VALUES ($1, $2, $3, $4, $5)
RETURNING ticket.id;

-- name: GetTicket :one
SELECT schedule_movie_date, schedule_movie_start, seat.rowss, seat.columnss, movie.title, cinema.name, room.room_id, room.type, ticket.totalprice, movie.url 
FROM ticket 
INNER JOIN schedule ON ticket.schedule_id = schedule.schedule_id
INNER JOIN movie ON schedule.movie_id = movie.movie_id
INNER JOIN cinema ON schedule.cinema_id = cinema.cinema_id
INNER JOIN room ON schedule.room_id = room.room_id
INNER JOIN seat ON ticket.seat_id = seat.seat_id
WHERE ticket.id = $1;