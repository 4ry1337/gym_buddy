import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gym_buddy/main.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  Future showNotification(int id, String title, String body, DateTime? date) async {
    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
      'GymBuddy',
      'GymBuddy',
      priority: Priority.max,
      importance: Importance.max,
    );
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    var scheduledTime = tz.TZDateTime.from(date!, tz.local);
    flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledTime,
      notificationDetails,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      payload: 'notlification-payload',
    );
  }
}
