import os

if os.path.exists('./.env'):
  from dotenv import load_dotenv

  load_dotenv(dotenv_path='./.env')

DATABASE_NAME = os.environ.get('DATABASE_NAME', 'layrz')
DATABASE_USERNAME = os.environ.get('DATABASE_USERNAME', 'postgres')
DATABASE_PASSWORD = os.environ.get('DATABASE_PASSWORD', '')
DATABASE_HOST = os.environ.get('DATABASE_HOST', '127.0.0.1')
DATABASE_PORT = os.environ.get('DATABASE_PORT', '5432')