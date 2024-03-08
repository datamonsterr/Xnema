package handler

import (
	"example.com/test/view"
	"example.com/test/view/components"
	"github.com/labstack/echo/v4"
)

func GetHomePage(c echo.Context) error {
	return RenderTemplComponent(c, view.Index())
}

func GetBookingView(c echo.Context) error {
	return RenderTemplComponent(c, components.SeatEditor(12, 24, c.Param("id")))
}
