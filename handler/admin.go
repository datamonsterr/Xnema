package handler

import (
	"example.com/test/view/components"
	"github.com/labstack/echo/v4"
)

func AdminGetHome(c echo.Context) error {
	return RenderTemplComponent(c, components.AdminHome())
}

func AdminGetMovie(c echo.Context) error {
	ctx, queries := InitDB()
	movies, err := queries.GetAllMovies(ctx)
	if err != nil {
		return err
	}

	return RenderTemplComponent(c, components.AdminMovie(movies))
}

func AdminAddSchedule(c echo.Context) error {
	return RenderTemplComponent(c, components.ScheduleRow())
}

func AdminPostAddMovie(c echo.Context) error {
	return nil
}
func AdminGetAddMovie(c echo.Context) error {
	return RenderTemplComponent(c, components.AdminAddMovie())
}

func AdminDeleteMovie(c echo.Context) error {
	return nil
}

func AdminUpdateMovie(c echo.Context) error {
	return nil
}

func AdminGetCinema(c echo.Context) error {
	return nil
}
