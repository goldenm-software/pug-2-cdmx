import psycopg2
from config import DATABASE_NAME, DATABASE_USERNAME, DATABASE_PASSWORD, DATABASE_HOST, DATABASE_PORT

def get_db_connection():
  """
  connect to the PostgreSQL database
  """
  try:
    connection = psycopg2.connect(
      dbname=DATABASE_NAME,
      user=DATABASE_USERNAME,
      password=DATABASE_PASSWORD,
      host=DATABASE_HOST,
      port=DATABASE_PORT
    )
    return connection
  except Exception as e:
    print(f"Error connecting to the database: {e}")
    raise