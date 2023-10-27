package main

import (
	"net/http"
)

func main() {
	port := "8080"

	mux := http.NewServeMux()

	mux.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("<p>Hello World</p>"))
	})
	http.ListenAndServe(":"+port, mux)
}
