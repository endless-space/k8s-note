package main

import (
	"os"

	"github.com/gin-gonic/gin"
	log "github.com/sirupsen/logrus"
	"infinite.com/x/simpleapp/apis"
)

func init() {
	log.SetOutput(os.Stdout)
	log.SetReportCaller(true)
	log.SetLevel(log.InfoLevel)
	log.SetFormatter(&log.JSONFormatter{})
}

func main() {
	log.Infof("start application")

	router := gin.Default()
	router.GET("/info", apis.PrintAppInfo)
	router.Run(":8080")
}
