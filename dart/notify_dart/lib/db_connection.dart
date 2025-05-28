import 'package:postgres/postgres.dart';

Future<PostgreSQLConnection> getDbConnection() async {
  final connection = PostgreSQLConnection(
    'localhost',
    5432,
    'expo',
    username: 'mariano',
    password: '123456',
  );

  try {
    await connection.open();
    print('Connected to the database successfully.');
    return connection;
  } catch (e) {
    print('Failed to connect to the database: $e');
    rethrow;
  }
}
