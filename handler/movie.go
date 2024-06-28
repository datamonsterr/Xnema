package handler

import (
	"fmt"
	"log"
	"sort"
	"strconv"
	"strings"

	"example.com/test/db"
	"example.com/test/view/components"
	"github.com/labstack/echo/v4"
)

func GetBookingView(c echo.Context) error {
	ctx, queries := InitDB()
	movieID := StoPGInt4(c.Param("id"))

	movie, err := queries.GetMovie(ctx, movieID.Int32)
	if err != nil {
		return RenderTemplComponent(c, components.ErrorPage("Movie not found"))
	}

	dates, err := queries.GetScheduleDate(ctx, movieID)
	if err != nil {
		return RenderTemplComponent(c, components.ErrorPage("No schedule found"))
	}

	sort.Slice(dates, func(i, j int) bool {
		return dates[i].Time.Before(dates[j].Time)
	})
	datesArr := make([]string, len(dates))
	for i, date := range dates {
		t := date.Time.Format("2006-Jan-02 15:04:05")
		t = strings.Split(t, " ")[0]
		datesArr[i] = t
	}

	return RenderTemplComponent(c, components.SeatEditor(datesArr, movie))
}

func GetScheduleTimeInDate(c echo.Context) error {
	ctx, queries := InitDB()

	x := db.GetScheduleTimeParams{
		MovieID:           StoPGInt4(c.Param("id")),
		ScheduleMovieDate: StoPGdate(c.Param("date")),
	}
	times, err := queries.GetScheduleTime(ctx, x)
	if err != nil {
		return RenderTemplComponent(c, components.ErrorPage("No schedule found"))
	}
	timesArr := make([]string, len(times))
	for i, time := range times {
		t := time.Microseconds
		t /= 1e6
		timesArr[i] = fmt.Sprintf("%02d:%02d", t/3600, t%3600/60)
	}

	return RenderTemplComponent(c, components.TimeSelection(timesArr))
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

type bookRequest struct {
	MovieID           int32  `json:"movie_id"`
	ScheduleMovieDate string `json:"date"`
	ScheduleMovieTime string `json:"time"`
	Seats             int32  `json:"seats"`
}

func PostMovieBook(c echo.Context) error {
	var req bookRequest
	if err := c.Bind(&req); err != nil {
		return RenderTemplComponent(c, components.ErrorPage("Invalid request"))
	}
	log.Fatal(req)
	return c.JSON(200, req)
}
