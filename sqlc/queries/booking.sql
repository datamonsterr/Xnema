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

-- name: GetRoomPrice :one
SELECT price FROM schedule 
INNER JOIN room ON room.room_id = schedule.room_id
INNER JOIN price ON room.type = price.type
WHERE schedule_id = $1 LIMIT 1;

-- name: BookTicket :one
INSERT INTO ticket (user_id, schedule_id, seat_id, cost)
VALUES ($1, $2, $3, $4)
RETURNING ticket.id;

-- name: GetTicketSeat :one
SELECT  seat.rowss, seat.columnss, ticket.cost
FROM ticket 
INNER JOIN seat ON ticket.seat_id = seat.seat_id
WHERE ticket.id = $1;

-- name: GetSchedule :one
SELECT * FROM schedule WHERE schedule_id = $1;

-- name: GetMovieBySchedule :one
SELECT movie_id FROM schedule 
WHERE schedule_id = $1;

-- name: GetBookedSeat :many
SELECT seat_id
FROM ticket
WHERE schedule_id = $1;
