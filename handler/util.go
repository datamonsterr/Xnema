package handler

import (
	"context"
	"fmt"
	"log"
	"os"
	"strconv"
	"time"

	"example.com/test/db"
	"example.com/test/models"
	"github.com/a-h/templ"
	"github.com/golang-jwt/jwt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/labstack/echo/v4"
)

func RenderTemplComponent(c echo.Context, component templ.Component) error {
	ctx := context.WithValue(context.Background(), models.UserDataCtxK, GetCtxData(c))
	return component.Render(ctx, c.Response().Writer)
}

func InitDB() (context.Context, *db.Queries) {
	ctx := context.Background()
	var (
		user     = os.Getenv("POSTGRES_USER")
		password = os.Getenv("POSTGRES_PASSWORD")
		database = os.Getenv("POSTGRES_DATABASE")
	)
	conn, err := pgx.Connect(ctx, fmt.Sprintf("postgresql://%s:%s@localhost:5432/%s?sslmode=disable", user, password, database))
	if err != nil {
		log.Println("Database: Cannot connect.")
		log.Fatal(err)
	}
	if err := conn.Ping(ctx); err != nil {
		log.Println("Database: Ping to DB and did not get anything in return.")
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
		log.Println("Time parse error with " + s)
	}

	pdate := pgtype.Date{Time: date, Valid: true}
	return pdate
}

func StoPGString(s string) pgtype.Text {
	return pgtype.Text{Valid: true, String: s}
}

func GetCtxData(c echo.Context) models.CtxData {
	cookie, err := c.Cookie("token")
	defaultData := models.CtxData{UserID: -1, UserRole: "guest"}
	if err != nil {
		return defaultData
	}

	token, err := jwt.ParseWithClaims(cookie.Value, &jwtCustomClaims{}, func(token *jwt.Token) (interface{}, error) {
		return []byte("secret"), nil
	})
	if err != nil {
		return defaultData
	}

	claims, ok := token.Claims.(*jwtCustomClaims)
	if !ok || !token.Valid {
		return defaultData
	}
	data := models.CtxData{UserID: claims.UserID, UserRole: claims.Role}
	log.Println("Authorized: " + claims.Role)
	return data
}
