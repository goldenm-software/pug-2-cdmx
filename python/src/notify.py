from db.connection import get_db_connection

def send_notification(channel: str, message: str):
  """
  Sends a notification to the specified channel with the given message.
  
  Args:
    channel (str): The channel to send the notification to.
    message (str): The message to send.
  """
  connection = get_db_connection()
  if connection:
    try:
      cursor = connection.cursor()
      query = f"NOTIFY {channel}, '{message}';"
      cursor.execute(query)
      connection.commit()
      print(f"Notification sent to {channel}: {message}")
    except Exception as e:
      print(f"Error sending notification: {e}")
    finally:
      cursor.close()
      connection.close()
  else:
    print("Failed to connect to the database for sending notification.")
