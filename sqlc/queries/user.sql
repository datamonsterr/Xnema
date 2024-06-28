-- name: GetUserPassword :one
SELECT password FROM users
WHERE email = $1 LIMIT 1;