package handler

import (
	"context"

	"github.com/a-h/templ"
	"github.com/labstack/echo/v4"
)

func RenderTemplComponent(c echo.Context, component templ.Component) error {
	return component.Render(context.Background(), c.Response().Writer)
}
