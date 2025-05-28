import 'db_connection.dart';

Future<void> sendNotification(String channel, String message) async {
  final connection = await getDbConnection();

  try {
    final query = "NOTIFY $channel, '$message';";
    await connection.query(query);
    print('Menssage sent to channel $channel: $message');
  } catch (e) {
    print('Failed to send notification: $e');
  } finally {
    await connection.close();
  }
}
