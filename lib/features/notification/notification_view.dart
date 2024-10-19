import 'package:flutter/material.dart';
import '../../core/models/notification_model.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  final List<NotificationModel> notifications = [];

  void addNotification(String title, String message) {
    setState(() {
      notifications.add(NotificationModel(
        title: title,
        message: message,
        date: DateTime.now(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Simulate adding a notification
              addNotification(
                  'New Notification', 'This is a sample notification.');
            },
          ),
        ],
      ),
      body: notifications.isEmpty
          ? const Center(child: Text('No notifications yet.'))
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return ListTile(
                  title: Text(notification.title),
                  subtitle:
                      Text('${notification.message}\n${notification.date}'),
                  isThreeLine: true,
                );
              },
            ),
    );
  }
}
