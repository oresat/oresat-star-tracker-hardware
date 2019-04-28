package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"strings"
  "os/exec"
)

func main() {
  fmt.Printf("start\n")
	http.HandleFunc("/", fileServe)
  err := http.ListenAndServe(":8081", nil)
  if err != nil {
    log.Fatalf("error: %s\n", err.Error())
  }
  fmt.Printf("end\n")
}

func fileServe(res http.ResponseWriter, req *http.Request) {
  out, err := exec.Command("./test_dev").CombinedOutput()
  if err != nil {
    if out != nil {
      fmt.Printf("error output: %s\n", out)
    }
    log.Fatalf("Exec error: %s\n", err.Error())
  }

  fmt.Printf("out: %s\n", out)
	filepath := req.URL.String()
	filepath = strings.TrimLeft(filepath, "/")

	fmt.Printf("%s requests '%s'\n", req.RemoteAddr, filepath)

	//read the current directory
	dir, err := ioutil.ReadDir(".")
	if err != nil {
		log.Fatalf("error reading directory: %s", err.Error())
	}

	//if file is found in current directory, serve it up
	for _, file := range dir {
		if file.Name() == filepath {
			fmt.Printf("Serving file: %s\n", file.Name())
			http.ServeFile(res, req, file.Name())
			fmt.Printf("Request complete.\n\n")
			return
		}
	}

	err = fmt.Errorf("Error: file '%s' not found", filepath)
	fmt.Printf("%s\n\n", err.Error())

	http.Error(res, err.Error(), 404)
}
