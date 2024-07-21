package handler

import (
	"example.com/test/view/components"
	"github.com/labstack/echo/v4"
)

func AdminGetHome(c echo.Context) error {
	return RenderTemplComponent(c, components.AdminHome())
}

func AdminGetMovie(c echo.Context) error {
	return nil
}

func AdminPostAddMovie(c echo.Context) error {
	return nil
}

func AdminDeleteMovie(c echo.Context) error {
	return nil
}

func AdminUpdateMovie(c echo.Context) error {
	return nil
}
