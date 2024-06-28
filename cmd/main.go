package main

import (
	"log"

	"example.com/test/handler"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
	e := echo.New()
	r := e.Group("/restricted")
	au := e.Group("/auth")

	e.Use(middleware.LoggerWithConfig(middleware.LoggerConfig{
		Format: "${time_rfc3339} ${method} ${status} ${uri} ${error}\n",
	}))

	e.GET("/", handler.GetIndex)
	e.GET("/home", handler.GetHome)
	e.GET("/home/news", handler.GetNews)
	r.GET("/movie/:id/booking", handler.GetBookingView)
	e.GET("/home/movies", handler.GetMovieSelection)
	e.GET("/movie/:id/info", handler.GetMovieInfo)
	e.POST("/movie/book", handler.PostMovieBook)

	e.GET("/movie/schedule/:id/:date", handler.GetScheduleTimeInDate)

	au.POST("/login", handler.PostAuthLogin)

	e.GET("/login", handler.GetLoginPage)

	e.Static("/static", "static")

	log.Fatal(e.Start(":8080"))
}
