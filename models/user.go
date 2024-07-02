package models

import (
	"context"
)

type UserData struct {
	UserID   int
	UserRole string
}

type ContextKey string

var UserDataCtxK ContextKey = "data"

func GetUserData(ctx context.Context) UserData {
	if data, ok := ctx.Value(UserDataCtxK).(UserData); ok {
		return data
	}
	return UserData{}
}

var TotalSlides int
