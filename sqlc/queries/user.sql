-- name: GetUserByEmail :one
SELECT * FROM users
WHERE email = $1 LIMIT 1;

-- name: CreateUser :one
INSERT INTO users (email, password, username, phone, birth_date)
VALUES ($1, $2, $3, $4, $5)
RETURNING user_id;