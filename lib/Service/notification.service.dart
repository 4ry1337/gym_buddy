class NotificationService {
  /*Future showNotification(int id, String title, String body, DateTime? date) async {
    AndroidNotificationDetails androidNotificationDetails =
    const AndroidNotificationDetails(
      'Well.Done',
      'Tasks',
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
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      payload: 'notlification-payload',
    );
  }*/
}
