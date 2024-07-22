package main

import (
	"log"

	"example.com/test/handler"
	"github.com/joho/godotenv"
	echojwt "github.com/labstack/echo-jwt"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatalf("Godotenv cannot load, err: %v", err)
	}

	e := echo.New()
	r := e.Group("/restricted")
	a := e.Group("/admin")

	e.Use(middleware.LoggerWithConfig(middleware.LoggerConfig{
		Format: "${time_rfc3339} ${method} ${status} ${uri} ${error}\n",
	}))
	e.Use(middleware.Recover())
	config := echojwt.Config{
		NewClaimsFunc: handler.GetClaims,
		SigningKey:    []byte("secret"),
		ErrorHandler:  handler.AuthErrorHandler,
	}
	r.Use(echojwt.WithConfig(config))
	// a.Use(echojwt.WithConfig(
	// 	echojwt.Config{
	// 		NewClaimsFunc: handler.GetClaims,
	// 		SigningKey:    []byte("secret"),
	// 	},
	// ))

	// Admin
	a.GET("", handler.AdminGetHome)
	a.GET("/movie", handler.AdminGetMovie)
	a.GET("/cinema", handler.AdminGetCinema)
	a.GET("/add-movie", handler.AdminGetAddMovie)
	a.GET("/add-schedule", handler.AdminAddSchedule)

	e.GET("", handler.GetIndex)
	r.GET("", handler.GetIndex)

	e.GET("/home", handler.GetHome)
	e.GET("/home/news", handler.GetNews)
	e.GET("/home/movies", handler.GetMovieSelection)
	e.GET("/movie/:id/info", handler.GetMovieInfo)

	// r.GET("/movie/:id/schedule", handler.GetScheduleView)
	// r.GET("/movie/schedule/:id/:date", handler.GetScheduleTimeInDate)
	r.GET("/booking/:id", handler.GetBookingView)
	r.GET("/booking/cinema", handler.GetScheduleCinema)
	r.GET("/booking/time", handler.GetScheduleTime)
	r.GET("/booking/seat", handler.GetScheduleSeat)
	r.POST("/booking/ticket", handler.PostBookTicket)
	r.GET("/booking/payment", handler.GetPayment)
	r.POST("/booking/validate-payment", handler.PostValidatePayment)

	r.GET("/booking/payment", handler.GetPayment)
	r.POST("/booking/validate-payment", handler.PostValidatePayment)

	e.POST("/auth/login", handler.PostAuthLogin)
	e.POST("/auth/register", handler.PostCreateAccount)
	e.GET("/login", handler.GetLoginPage)
	e.GET("/register", handler.GetCreateAccountPage)
	r.GET("/logout", handler.GetLogout)

	e.Static("/static", "static")

	log.Fatal(e.Start(":8080"))
}
