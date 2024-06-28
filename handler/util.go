package handler

import (
	"context"
	"strconv"
	"time"

	"example.com/test/db"
	"github.com/a-h/templ"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
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

func ItoPGInt4(i int) pgtype.Int4 {
	return pgtype.Int4{Int32: int32(i), Valid: true}
}
func StoPGInt4(i string) pgtype.Int4 {
	x, err := strconv.Atoi(i)
	if err != nil {
		panic(err)
	}
	return pgtype.Int4{Int32: int32(x), Valid: true}
}

func StoPGdate(s string) pgtype.Date {
	date, err := time.Parse("2006-Jan-02", s)
	if err != nil {
		panic(err)
	}

	pdate := pgtype.Date{Time: date, Valid: true}
	return pdate
}
