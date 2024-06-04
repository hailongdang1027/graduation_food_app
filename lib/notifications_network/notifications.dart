import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class NotificationsApp extends StatefulWidget {
  const NotificationsApp({super.key});

  @override
  State<NotificationsApp> createState() => _NotificationsAppState();
}

class _NotificationsAppState extends State<NotificationsApp> {
  @override
  void initState(){
    super.initState();
    initNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: const Center(
        child: Text("Notification"),
      ),
    );
  }

  Future<void> initNotification()async{
    await OneSignal.shared.setAppId("");
    await OneSignal.shared.getDeviceState().then((value) {
      print(value!.userId);
    });
  }
}