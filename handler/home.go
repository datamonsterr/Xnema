package handler

import (
	"example.com/test/view"
	"example.com/test/view/components"
	"github.com/labstack/echo/v4"
)

func GetIndex(c echo.Context) error {
	return RenderTemplComponent(c, view.Index())
}

func GetHome(c echo.Context) error {
	return RenderTemplComponent(c, components.Home())
}

func GetBookingView(c echo.Context) error {
	return RenderTemplComponent(c, components.SeatEditor(12, 24, c.Param("id")))
}
