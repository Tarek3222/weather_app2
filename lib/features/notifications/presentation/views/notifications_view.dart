import 'package:flutter/material.dart';
import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/features/notifications/presentation/views/widgets/notification_body.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.primaryColor,
      body: const NotificationBody(),
    );
  }
}
