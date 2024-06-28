package handler

import (
	"strconv"

	"example.com/test/view/components"
	"github.com/labstack/echo/v4"
)

func GetBookingView(c echo.Context) error {
	ctx, queries := InitDB()
	movieID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		return RenderTemplComponent(c, components.ErrorPage("Invalid movie ID"))
	}

	movie, err := queries.GetMovie(ctx, int32(movieID))
	if err != nil {
		return RenderTemplComponent(c, components.ErrorPage("Movie not found"))
	}
	title := movie.Title.String
	return RenderTemplComponent(c, components.SeatEditor(12, 24, c.Param("id"), title))
}

func GetMovieInfo(c echo.Context) error {
	ctx, queries := InitDB()
	movieID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		return RenderTemplComponent(c, components.ErrorPage("Invalid movie ID"))
	}

	movie, err := queries.GetMovie(ctx, int32(movieID))
	if err != nil {
		return RenderTemplComponent(c, components.ErrorPage("Movie not found"))
	}

	return RenderTemplComponent(c, components.MovieInfo(movie))
}
