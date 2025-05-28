import 'package:notify_dart/notify.dart';

void main() async {
  const channel = 'test_channel';
  const message = 'Merwebo';

  await sendNotification(channel, message);
}
