package handler

import (
	"example.com/test/view/components"
	"github.com/labstack/echo/v4"
)

func GetLoginPage(c echo.Context) error {
	return RenderTemplComponent(c, components.Login())
}

type LoginRequest struct {
	Username string `json:"username"`
	Password string `json:"password"`
}

func PostAuthLogin(c echo.Context) error {
	return nil
}
