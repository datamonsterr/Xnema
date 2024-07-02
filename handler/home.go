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

func GetNews(c echo.Context) error {
	slides := []string{"https://iguov8nhvyobj.vcdn.cloud/media/banner/cache/1/b58515f018eb873dafa430b6f9ae0c1e/2/_/2._rolling_banner_web_app_980x448-min.png", "https://iguov8nhvyobj.vcdn.cloud/media/banner/cache/1/b58515f018eb873dafa430b6f9ae0c1e/9/8/980x448-min_1__3.jpg", "https://iguov8nhvyobj.vcdn.cloud/media/banner/cache/1/b58515f018eb873dafa430b6f9ae0c1e/r/o/rolling_banner_980x448_2_.png"}
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
