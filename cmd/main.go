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
	// e.GET("/click/open/:id", handler.GetBookingView)

	e.POST("/login/auth", handler.CheckLogin)

	e.GET("/login", handler.GetLoginPage)

	e.Static("/static", "static")

	log.Fatal(e.Start(":8080"))
}
