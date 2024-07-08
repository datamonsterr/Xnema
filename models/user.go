package models

import (
	"context"
)

type CtxData struct {
	UserID   int
	UserRole string
}

type ContextKey string

var UserDataCtxK ContextKey = "data"

func GetUserData(ctx context.Context) CtxData {
	if data, ok := ctx.Value(UserDataCtxK).(CtxData); ok {
		return data
	}
	return CtxData{}
}

type RoomTime struct {
	Room  string
	Times map[int]string
}
