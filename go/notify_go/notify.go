package main

import (
	"fmt"
	"log"
)

func sendNotification(channel string, message string) {

	db, err := getDbConnection()
	if err != nil {
		log.Fatalf("Failed to connect to the database: %v", err)
	}
	defer db.Close()

	query := fmt.Sprintf("NOTIFY %s, '%s';", channel, message)

	_, err = db.Exec(query)
	if err != nil {
		log.Fatalf("Failed to send notification: %v", err)
	}
	fmt.Printf("Notification sent to channel %s: %s\n", channel, message)

}
