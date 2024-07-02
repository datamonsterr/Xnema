package handler

import (
	"log"
	"net/http"
	"time"

	"example.com/test/view/components"
	"github.com/golang-jwt/jwt/v4"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/labstack/echo/v4"
)

func GetLoginPage(c echo.Context) error {
	return RenderTemplComponent(c, components.Login())
}

type LoginRequest struct {
	Username string `json:"username"`
	Password string `json:"password"`
}

type jwtCustomClaims struct {
	UserID int    `json:"user_id"`
	Role   string `json:"role"`
	jwt.RegisteredClaims
}

type RequestData struct {
	Username string `json:"username" form:"username"`
	Password string `json:"password" form:"password"`
}

func GetClaims(c echo.Context) jwt.Claims {
	return new(jwtCustomClaims)
}
func PostAuthLogin(c echo.Context) error {
	data := new(RequestData)
	if err := c.Bind(data); err != nil {
		return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid request data"})
	}

	var req LoginRequest
	if err := c.Bind(&req); err != nil {
		log.Fatal(err)
	}

	ctx, queries := InitDB()
	email := pgtype.Text{Valid: true, String: data.Username}
	user, err := queries.GetUserByEmail(ctx, email)
	if err != nil {
		return RenderTemplComponent(c, components.ErrorPage("Invalid username or password"))
	}
	password := user.Password.String
	if password != data.Password {
		return RenderTemplComponent(c, components.ErrorPage("Invalid username or password"))
	}

	claims := &jwtCustomClaims{
		int(user.UserID),
		"user",
		jwt.RegisteredClaims{
			ExpiresAt: jwt.NewNumericDate(time.Now().Add(time.Hour * 72)),
		},
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	t, err := token.SignedString([]byte("secret"))
	if err != nil {
		return err
	}

	cookie := new(http.Cookie)
	cookie.Name = "token"
	cookie.Value = t
	cookie.Expires = time.Now().Add(72 * time.Hour)
	cookie.Path = "/"
	c.SetCookie(cookie)

	return GetIndex(c)
}

func GetLogout(c echo.Context) error {
	cookie := new(http.Cookie)
	cookie.Name = "token"
	cookie.Value = ""
	cookie.Path = "/"
	c.SetCookie(cookie)

	return GetIndex(c)
}

func GetCreateAccountPage(c echo.Context) error {
	return RenderTemplComponent(c, components.CreateAccount())
}
