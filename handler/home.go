package handler

import (
	"github.com/datamonsterr/SEProject/view"
	"github.com/datamonsterr/SEProject/view/components"
	"github.com/labstack/echo/v4"
)

func GetHomePage(c echo.Context) error {
	return RenderTemplComponent(c, view.Index())
}

func GetWelcomeMessage(c echo.Context) error {
	return RenderTemplComponent(c, components.SeatEditor(12, 24))
}
