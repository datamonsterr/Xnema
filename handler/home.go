package handler

import (
	"github.com/datamonsterr/SEProject/view"
	"github.com/datamonsterr/SEProject/view/common"
	"github.com/datamonsterr/SEProject/view/components"
	"github.com/labstack/echo/v4"
)

func GetHomePage(c echo.Context) error {
	return RenderTemplComponent(c, view.Index())
}

func GetBookingView(c echo.Context) error {
	return RenderTemplComponent(c, components.SeatEditor(12, 24, c.Param("id")))
}

func RemoveElm(c echo.Context) error {
	return RenderTemplComponent(c, common.EmptySpan(c.Param("id")))
}
