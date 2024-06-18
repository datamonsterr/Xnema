package handler

import (
	"fmt"

	"example.com/test/view/components"
	"github.com/labstack/echo/v4"
)

func GetLoginPage(c echo.Context) error {
	return RenderTemplComponent(c, components.Login())
}

var json map[string]interface{} = map[string]interface{}{}

func CheckLogin(c echo.Context) error {
	if err := c.Bind(&json); err != nil {
		return err
	}
	username := fmt.Sprintf("%s", json["username"])
	password := fmt.Sprintf("%s", json["password"])

	return RenderTemplComponent(c, components.LoginSuccess(username, password))
}
