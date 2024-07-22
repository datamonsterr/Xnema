package handler

import (
	"fmt"
	"log"
	"sort"
	"time"

	"example.com/test/db"
	"example.com/test/models"
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

func GetScheduleSeat(c echo.Context) error {
	ctx, queries := InitDB()
	scheduleID := StoPGInt4(c.QueryParam("scheduleID"))
	data, err := queries.GetSeat(ctx, scheduleID.Int32)
	if err != nil {
		log.Println(err.Error())
		return RenderTemplComponent(c, components.ErrorPage("No seat found"))
	}
	totalRow := 1
	firstRow := 'A'
	for _, seat := range data {
		if (byte(firstRow) >= 'A' && byte(firstRow) <= 'Z') || (byte(firstRow) >= 'a' && byte(firstRow) <= 'z') {
			if byte(firstRow) != seat.Rowss.String[0] {
				totalRow++
				firstRow++
			}
		} else {
			break
		}
	}

	seats := make([][]db.GetSeatRow, totalRow)
	for _, seat := range data {
		seats[rune(seat.Rowss.String[0])-65] = append(seats[rune(seat.Rowss.String[0])-65], seat)
	}

	bookedSeats, err := queries.GetBookedSeat(ctx, scheduleID)
	bookedSeatIDs := make([]int, len(bookedSeats))
	if err != nil {
		return err
	}
	for i, seat := range bookedSeats {
		bookedSeatIDs[i] = int(seat.Int32)
	}

	cost, err := queries.GetRoomPrice(ctx, scheduleID.Int32)
	if err != nil {
		return err
	}

	return RenderTemplComponent(c, components.SeatEditor(seats, bookedSeatIDs, int(cost.Int32)))
}

func GetScheduleTime(c echo.Context) error {
	ctx, queries := InitDB()

	schedules, err := queries.GetScheduleTime(ctx, db.GetScheduleTimeParams{
		MovieID:           StoPGInt4(c.QueryParam("movieID")),
		ScheduleMovieDate: StoPGdate(c.QueryParam("date")),
		CinemaID:          StoPGInt4(c.QueryParam("cinemaID")),
	})
	if err != nil {
		return RenderTemplComponent(c, components.ErrorPage("No schedule found"))
	}
	arr := []models.RoomTime{}
	for _, schedule := range schedules {
		timesArr := map[int]string{}
		t := schedule.ScheduleMovieStart.Microseconds / 1e6
		timesArr[int(schedule.ScheduleID)] = fmt.Sprintf("%02d:%02d", t/3600, t%3600/60)
		room := fmt.Sprintf("Room %d - %s", schedule.RoomID.Int32, schedule.Type.String)
		rt := models.RoomTime{
			Room:  room,
			Times: timesArr,
		}
		arr = append(arr, rt)
	}

	return RenderTemplComponent(c, components.TimeSelection(arr))
}

func GetScheduleCinema(c echo.Context) error {
	ctx, queries := InitDB()
	movieID := c.QueryParam("movieID")
	date := c.QueryParam("date")

	cinemas, err := queries.GetScheduleCinema(ctx, db.GetScheduleCinemaParams{
		MovieID:           StoPGInt4(movieID),
		ScheduleMovieDate: StoPGdate(date),
	})
	if err != nil {
		return RenderTemplComponent(c, components.ErrorPage("No cinema found"))
	}
	cinemasArr := map[int]string{}
	for _, cinema := range cinemas {
		cinemasArr[int(cinema.CinemaID.Int32)] = cinema.Name.String
	}
	log.Println("Cinemas: hahah")

	return RenderTemplComponent(c, components.CinemaSelection(cinemasArr, movieID, date))
}

func PostBookTicket(c echo.Context) error {
	if err := c.Request().ParseForm(); err != nil {
		log.Println("Error parsing form:", err)
	}

	ctx, queries := InitDB()

	selectedSeats := c.Request().Form["seat"]
	scheduleID := StoPGInt4(c.QueryParam("scheduleID"))

	roomPrice, err := queries.GetRoomPrice(ctx, scheduleID.Int32)
	if err != nil {
		return err
	}

	userID := GetCtxData(c).UserID
	ticketIDs := make([]int, 0, len(selectedSeats))
	for _, seat := range selectedSeats {
		ticketID, err := queries.BookTicket(ctx, db.BookTicketParams{
			SeatID:     StoPGInt4(seat),
			ScheduleID: scheduleID,
			UserID:     ItoPGInt4(userID),
			Cost:       roomPrice,
		})
		if err != nil {
			return err
		}
		ticketIDs = append(ticketIDs, int(ticketID))
	}

	if len(ticketIDs) == 0 {
		return RenderTemplComponent(c, components.ErrorPage("No seat selected"))
	}

	tickets := map[int]db.GetTicketSeatRow{}
	for _, ticketID := range ticketIDs {
		ticket, err := queries.GetTicketSeat(ctx, int32(ticketID))
		if err != nil {
			return err
		}
		tickets[ticketID] = ticket
	}
	movieID, err := queries.GetMovieBySchedule(ctx, scheduleID.Int32)
	if err != nil {
		return err
	}
	movie, err := queries.GetMovie(ctx, movieID.Int32)
	if err != nil {
		return err
	}
	schedule, err := queries.GetSchedule(ctx, scheduleID.Int32)
	if err != nil {
		return err
	}

	return RenderTemplComponent(c, components.Payment(movie, schedule, tickets))
}

// TODO
func GetPayment(c echo.Context) error {
	return RenderTemplComponent(c, components.QRCode())
}

func PostValidatePayment(c echo.Context) error {
	return RenderTemplComponent(c, components.Approve())
}

func GetUserTickets(c echo.Context) error {
	ctx, queries := InitDB()
	tickets, err := queries.GetBookedTicketsByUser(ctx, ItoPGInt4(GetCtxData(c).UserID))
	if err != nil {
		return err
	}

	return RenderTemplComponent(c, components.ViewTicket(tickets))
}
