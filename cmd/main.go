package main

import (
	"log"

	"example.com/test/handler"
	"github.com/labstack/echo/v4"
)

func main() {
	e := echo.New()

	e.GET("/", handler.GetIndex)
	e.GET("/home", handler.GetHome)
	e.GET("/home/news", handler.GetNews)
	e.GET("/movie/:id/booking", handler.GetBookingView)
	e.GET("/home/movies", handler.GetMovieSelection)
	e.GET("/movie/:id/info", handler.GetMovieInfo)

	e.POST("/login/auth", handler.CheckLogin)

	e.GET("/login", handler.GetLoginPage)

	e.Static("/static", "static")

	log.Fatal(e.Start(":8080"))
}
