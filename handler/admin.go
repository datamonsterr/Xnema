package handler

import (
	"log"

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
	if err := c.Request().ParseForm(); err != nil {
		log.Println("Error parsing form:", err)
	}

	// form := c.Request().Form
	// movieTitle := form["title"][0]
	// movieLength := form["length"][0]

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
	ctx, queries := InitDB()
	cinemas, err := queries.GetAllCinemas(ctx)
	if err != nil {
		return err
	}
	rooms, err := queries.GetAllRooms(ctx)
	if err != nil {
		return err
	}

	return RenderTemplComponent(c, components.AdminCinema(cinemas, rooms))
}

func AdminGetOrder(c echo.Context) error {
	return RenderTemplComponent(c, components.AdminOrder())
}
