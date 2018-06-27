package main

import (
	"encoding/json"
	"fmt"
)

func main() {
	// Store contents of Json data
	myJsonMap := make(map[string]interface{})
	jsonData := []byte(`{"hello":"world"}`)
	err := json.Unmarshal(jsonData, &myJsonMap)
	if err != nil {
		panic(err)
	}
	fmt.Printf("%s\n", myJsonMap["hello"])

}
