package main

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

func main() {
	e := echo.New()

	e.GET("/", hello)
	e.Logger.Fatal(e.Start(":9999"))
}

// Handler
func hello(c echo.Context) error {
	return c.HTML(http.StatusOK, "<strong>Hello, World!</strong>")
}
