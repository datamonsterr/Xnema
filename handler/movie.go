package handler

import (
	"fmt"
	"log"
	"sort"
	"strconv"
	"time"

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
	datesArr := make([]time.Time, len(dates))
	for i, date := range dates {
		datesArr[i] = date.Time
	}

	return RenderTemplComponent(c, components.BookingView(movie, datesArr))
}

func GetScheduleTimeInDate(c echo.Context) error {
	ctx, queries := InitDB()

	x := db.GetScheduleTimeParams{
		MovieID:           StoPGInt4(c.Param("id")),
		ScheduleMovieDate: StoPGdate(c.Param("date")),
	}
	schedules, err := queries.GetScheduleTime(ctx, x)
	if err != nil {
		return RenderTemplComponent(c, components.ErrorPage("No schedule found"))
	}
	timesArr := map[int]string{}
	for _, schedule := range schedules {
		t := schedule.ScheduleMovieStart.Microseconds
		t /= 1e6
		timesArr[int(schedule.ScheduleID)] = fmt.Sprintf("%02d:%02d", t/3600, t%3600/60)
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
	MovieID    int      `json:"movie_id"`
	Seats      []string `json:"seats"`
	ScheduleID string   `json:"schedule_id"`
}

func PostMovieBook(c echo.Context) error {
	var req bookRequest
	if err := c.Bind(&req); err != nil {
		log.Fatal("Err here")
		return c.String(400, "Invalid request")
	}

	ctx, queries := InitDB()
	for _, seat := range req.Seats {
		r, err := queries.BookTicket(ctx, db.BookTicketParams{
			UserID:     ItoPGInt4(1),
			CinemaID:   ItoPGInt4(1),
			MovieID:    ItoPGInt4(req.MovieID),
			ScheduleID: StoPGInt4(req.ScheduleID),
			SeatID:     StoPGInt4(seat),
		})
		if err != nil {
			log.Fatal("Book Ticket Insert to DB: ", err)
			return c.String(400, "Failed to book")
		}
		log.Fatal("ticker id: ", r)
	}
	return c.String(200, "Booked successfully")
}

func GetScheduleView(c echo.Context) error {
	// ctx, queries := InitDB()
	// movieID := StoPGInt4(c.Param("id"))

	// schedules, err := queries.GetSchedule(ctx, movieID)
	// if err != nil {
	// 	return RenderTemplComponent(c, components.ErrorPage("No schedule found"))
	// }

	return RenderTemplComponent(c, components.Schedule())

}
