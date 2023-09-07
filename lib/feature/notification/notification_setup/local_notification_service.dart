import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> createLocalNotification(
    {required String title, required String body}) async {
  print('notification');
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'basic_channel2',
      title: title,
      body: body,
      // bigPicture: 'asset://assets/notification_map.png',
      // notificationLayout: NotificationLayout.BigPicture,
    ),
  );
}

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}
