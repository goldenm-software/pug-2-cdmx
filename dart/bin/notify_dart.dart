import 'package:postgres/postgres.dart';

void main() async {
  print('Connecting to the database...');
  final conn = PostgreSQLConnection(
    String.fromEnvironment('DATABASE_HOST', defaultValue: 'db'),
    int.fromEnvironment('DATABASE_PORT', defaultValue: 5432),
    String.fromEnvironment('DATABASE_NAME', defaultValue: 'demo_db'),
    username: String.fromEnvironment('DATABASE_USER', defaultValue: 'listen_notify'),
    password: String.fromEnvironment('DATABASE_PASSWORD', defaultValue: '123456'),
  );

  await conn.open();
  print('Connected to the database');

  print('Listening for notifications on "dart_channel"...');
  await conn.execute('LISTEN dart_channel');
  conn.notifications.listen((notification) {
    print('Received notification @ [${DateTime.now()}]: ${notification.payload}');
  });
}
