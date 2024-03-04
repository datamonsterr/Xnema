package handler

import (
	"github.com/datamonsterr/SEProject/view"
	"github.com/labstack/echo/v4"
)

func GetHomePage(c echo.Context) error {
	return RenderTemplComponent(c, view.Home("Dat"))
}
