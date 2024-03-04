package main

import (
	"github.com/datamonsterr/SEProject/handler"
	"github.com/labstack/echo/v4"
)

func main() {
	e := echo.New()
	e.Static("/", "./view/css/output.css")
	e.GET("/", handler.GetHomePage)
	e.Start(":8080")
}
