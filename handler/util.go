package handler

import (
	"context"

	"example.com/test/db"
	"github.com/a-h/templ"
	"github.com/jackc/pgx/v5"
	"github.com/labstack/echo/v4"
)

func RenderTemplComponent(c echo.Context, component templ.Component) error {
	return component.Render(context.Background(), c.Response().Writer)
}

func InitDB() (context.Context, *db.Queries) {
	ctx := context.Background()
	conn, err := pgx.Connect(ctx, "postgresql://root:1234@localhost:5432/postgres?sslmode=disable")
	if err != nil {
		panic(err)
	}
	if err := conn.Ping(ctx); err != nil {
		panic(err)
	}
	queries := db.New(conn)

	return ctx, queries
}
