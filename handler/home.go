package handler

import (
	"log"

	"example.com/test/models"
	"example.com/test/view"
	"example.com/test/view/components"
	"github.com/golang-jwt/jwt"
	"github.com/labstack/echo/v4"
)

func GetIndex(c echo.Context) error {
	cookie, err := c.Cookie("token")
	defaultData := models.UserData{UserID: -1, UserRole: "guest"}
	if err != nil {
		return RenderTemplComponentWithData(c, view.Index(), defaultData)
	}

	token, err := jwt.ParseWithClaims(cookie.Value, &jwtCustomClaims{}, func(token *jwt.Token) (interface{}, error) {
		return []byte("secret"), nil
	})
	if err != nil {
		return RenderTemplComponentWithData(c, view.Index(), defaultData)
	}

	claims, ok := token.Claims.(*jwtCustomClaims)
	if !ok || !token.Valid {
		return RenderTemplComponentWithData(c, view.Index(), defaultData)
	}
	data := models.UserData{UserID: claims.UserID, UserRole: claims.Role}
	log.Println("Authorized: " + claims.Role)
	return RenderTemplComponentWithData(c, view.Index(), data)
}

func GetHome(c echo.Context) error {
	return RenderTemplComponent(c, components.Home())
}

func GetNews(c echo.Context) error {
	slides := []string{"https://iguov8nhvyobj.vcdn.cloud/media/banner/cache/1/b58515f018eb873dafa430b6f9ae0c1e/2/_/2._rolling_banner_web_app_980x448-min.png", "https://iguov8nhvyobj.vcdn.cloud/media/banner/cache/1/b58515f018eb873dafa430b6f9ae0c1e/9/8/980x448-min_1__3.jpg", "https://iguov8nhvyobj.vcdn.cloud/media/banner/cache/1/b58515f018eb873dafa430b6f9ae0c1e/r/o/rolling_banner_980x448_2_.png"}
	models.TotalSlides = len(slides)
	return RenderTemplComponent(c, components.News(slides))
}

func GetMovieSelection(c echo.Context) error {
	ctx, queries := InitDB()
	movies, err := queries.GetMovies(ctx)
	if err != nil {
		panic(err)
	}

	return RenderTemplComponent(c, components.MovieSelection(movies))
}
