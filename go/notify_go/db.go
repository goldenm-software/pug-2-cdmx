package main

import (
	"database/sql"
	"fmt"

	_ "github.com/lib/pq"
)

func getDbConnection() (*sql.DB, error) {

	connStr := "host=127.0.0.1 port=5432 user=mariano password=123456 dbname=expo sslmode=disable"
	db, err := sql.Open("postgres", connStr)
	if err != nil {
		return nil, fmt.Errorf("error connecting to the database: %v", err)
	}

	err = db.Ping()
	if err != nil {
		return nil, fmt.Errorf("error pinging the database: %v", err)
	}

	fmt.Println("connected to the database successfully")
	return db, nil
}
