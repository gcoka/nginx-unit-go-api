package main

import (
	"fmt"
	"net/http"
	"nginx/unit"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "<h1>Hello NGINX Unit</h1>")
	})
	port := 3000
	fmt.Printf("server start listening port %v", port)
	unit.ListenAndServe(fmt.Sprintf(":%v", port), nil)
}
