from db.connection import get_db_connection

if __name__ == "__main__":
  connection = get_db_connection()
  if connection:
    print("Connection to the database was successful.")
    connection.close()
  else:
    print("Failed to connect to the database.")
  