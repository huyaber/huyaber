package main

import (
	"log"
	"net/http"

	"github.com/prometheus/client_golang/prometheus/promhttp"
)

func main() {

	router := NewRouter()

	router.Handle("/metrics", promhttp.Handler())

	log.Fatal(http.ListenAndServe(":8080", router))
}
