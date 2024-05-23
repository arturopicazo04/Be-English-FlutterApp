import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {
  static void initialize() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'be_english_channel',
          channelName: 'Be English Notifications',
          channelDescription: 'Notification Channel for App notifications',
        ),
      ],
      debug: true,
    );
  }

  static void scheduleDailyNotification() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      isAllowed =
          await AwesomeNotifications().requestPermissionToSendNotifications();
    }

    if (isAllowed) {
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 0,
          channelKey: 'be_english_channel',
          title: 'Daily Quiz',
          body: 'Time to take your daily quiz!',
        ),
        schedule: NotificationCalendar(
          hour: 9,
          minute: 0,
          second: 0,
          timeZone: 'CET',
          repeats: true,
        ),
      );
    } else {
      print('Notification permissions are denied');
    }
  }
}
