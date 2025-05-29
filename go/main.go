package main

import (
	"database/sql"
	"fmt"
	"time"

	"github.com/lib/pq"
)

func main() {
	fmt.Println("Conecting to PostgreSQL database...")
	connStr := "host=db port=5432 user=listen_notify password=123456 dbname=demo_db sslmode=disable"

	for {
		db, err := sql.Open("postgres", connStr)
		if err != nil {
			fmt.Printf("error connecting to the database: %v\n", err)
			fmt.Println("Retrying in 5 seconds...")
			time.Sleep(5 * time.Second)
			continue
		}

		err = db.Ping()
		if err != nil {
			fmt.Printf("error pinging the database: %v\n", err)
			fmt.Println("Retrying in 5 seconds...")
			time.Sleep(5 * time.Second)
			continue
		}

		fmt.Println("Connected to the database successfully")
		db.Close()
		break
	}

	fmt.Println("Listening for notifications on channel \"go_channel\"...")
	l := pq.NewListener(connStr, 10*time.Second, time.Minute, func(ev pq.ListenerEventType, err error) {
		if err != nil {
			fmt.Printf("Listener error: %v\n", err)
			return
		}
		switch ev {
		case pq.ListenerEventConnected:
			fmt.Println("Listener connected")
		case pq.ListenerEventDisconnected:
			fmt.Println("Listener disconnected")
		case pq.ListenerEventReconnected:
			fmt.Println("Listener reconnected")
		default:
			fmt.Printf("Listener event: %v\n", ev)
		}
	})

	err := l.Listen("go_channel")
	if err != nil {
		fmt.Printf("Error listening to channel: %v\n", err)
		return
	}
	defer l.Unlisten("go_channel")

	for {
		waitForNotification(l)
	}
}

func waitForNotification(l *pq.Listener) {
	select {
	case <-l.Notify:
		notification := <-l.Notify
		now := time.Now().Format(time.RFC3339)
		fmt.Printf("Received notification @ [%s]: %s\n", now, notification.Extra)
	case <-time.After(1 * time.Second):
		l.Ping()
	}
}
