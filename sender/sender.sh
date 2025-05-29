#!/bin/bash

# Do a while loop to send a message every 5 seconds
while true; do
  echo "Sending notification to python_channel..."
  PGPASSWORD=123456 psql -U listen_notify -d demo_db -h db -c "SELECT pg_notify('python_channel', 'Hello from sender to Python!')" >> /dev/null 2>&1
  sleep 1

  echo "Sending notification to go_channel..."
  PGPASSWORD=123456 psql -U listen_notify -d demo_db -h db -c "SELECT pg_notify('go_channel', 'Hello from sender to Go!')" >> /dev/null 2>&1
  sleep 1

  echo "Sending notification to dart_channel..."
  PGPASSWORD=123456 psql -U listen_notify -d demo_db -h db -c "SELECT pg_notify('dart_channel', 'Hello from sender to Dart!')" >> /dev/null 2>&1
  sleep 1

  echo "Notification sent. Waiting for 5 seconds..."
  sleep 5
done