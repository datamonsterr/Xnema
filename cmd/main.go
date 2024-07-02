package main

import (
	"log"

	"example.com/test/handler"
	echojwt "github.com/labstack/echo-jwt"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
	e := echo.New()
	r := e.Group("/restricted")

	e.Use(middleware.LoggerWithConfig(middleware.LoggerConfig{
		Format: "${time_rfc3339} ${method} ${status} ${uri} ${error}\n",
	}))
	e.Use(middleware.Recover())
	config := echojwt.Config{
		NewClaimsFunc: handler.GetClaims,
		SigningKey:    []byte("secret"),
	}
	r.Use(echojwt.WithConfig(config))

	e.GET("", handler.GetIndex)

	e.GET("/home", handler.GetHome)
	e.GET("/home/news", handler.GetNews)
	e.GET("/home/movies", handler.GetMovieSelection)
	e.GET("/movie/:id/info", handler.GetMovieInfo)
	r.POST("/movie/book", handler.PostMovieBook)

	r.GET("/movie/:id/booking", handler.GetBookingView)
	r.GET("", handler.GetIndex)

	r.GET("/movie/schedule/:id/:date", handler.GetScheduleTimeInDate)

	e.POST("/auth/login", handler.PostAuthLogin)
	e.POST("/auth/register", handler.PostCreateAccount)
	e.GET("/login", handler.GetLoginPage)
	e.GET("/register", handler.GetCreateAccountPage)
	r.GET("/logout", handler.GetLogout)

	e.Static("/static", "static")

	log.Fatal(e.Start(":8080"))
}
