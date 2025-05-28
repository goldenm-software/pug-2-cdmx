from notify import send_notification

if __name__ == "__main__":
    channel = "test_channel"
    message = "test"
    
    send_notification(channel, message)
    #print(f"Notification sent to {channel}: {message}")