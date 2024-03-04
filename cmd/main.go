package main

import (
	"github.com/datamonsterr/SEProject/handler"
	"github.com/labstack/echo/v4"
)

func main() {
	e := echo.New()

	e.GET("/", handler.GetHomePage)
	e.GET("/click_btn", handler.GetWelcomeMessage)

	e.Static("/static", "static")
	e.Static("/css", "css")

	e.Start(":8080")
}
