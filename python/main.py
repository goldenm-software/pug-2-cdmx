import os
import time
import zoneinfo
from datetime import datetime

import psycopg

TZ = zoneinfo.ZoneInfo('America/Mexico_City')


def main() -> None:
  print('Connecting to PostgreSQL database...')
  conn = psycopg.connect(
    dbname=os.getenv('DATABASE_NAME', 'postgres'),
    user=os.getenv('DATABASE_USER', 'postgres'),
    password=os.getenv('DATABASE_PASSWORD', 'postgres'),
    host=os.getenv('DATABASE_HOST', 'localhost'),
    port=os.getenv('DATABASE_PORT', '5432'),
  )
  print('Connected to PostgreSQL database!')

  conn.execute('LISTEN python_channel;')
  conn.commit()
  gen = conn.notifies()
  print('Listening for notifications on channel "python_channel"...')
  for notify in gen:
    now = datetime.now(TZ)
    print(f'Received notification @ {now.strftime("%Y-%m-%d %H:%M:%S")}: {notify.payload}')

  conn.close()


print(f'__name__ = {__name__}')
if __name__ == '__main__':
  main()
