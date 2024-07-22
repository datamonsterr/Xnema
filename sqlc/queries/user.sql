-- name: GetUserByEmail :one
SELECT * FROM users
WHERE email = $1 LIMIT 1;

-- name: CreateUser :one
INSERT INTO users (email, password, username, phone, birth_date)
VALUES ($1, $2, $3, $4, $5)
RETURNING user_id;

-- name: GetBookedTicketsByUser :many
SELECT * FROM ticket
INNER JOIN schedule ON ticket.schedule_id = schedule.schedule_id
INNER JOIN movie ON schedule.movie_id = movie.movie_id
INNER JOIN room ON schedule.room_id = room.room_id
INNER JOIN cinema ON cinema.cinema_id = schedule.cinema_id
INNER JOIN seat ON ticket.seat_id = seat.seat_id
WHERE user_id = $1;