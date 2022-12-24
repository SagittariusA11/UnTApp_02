import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  static void storeNotificationToken()async{
    String? token = await FirebaseMessaging.instance.getToken();
    FirebaseFirestore.instance.collection('counsellor_anonymous').doc(FirebaseAuth.instance.currentUser!.uid).set(
        {
          'fcmToken': token
        },SetOptions(merge: true));
  }

  static void display(RemoteMessage message) async{
    try {
      print("In Notification method");
      // int id = DateTime.now().microsecondsSinceEpoch ~/1000000;
      Random random = new Random();
      int id = random.nextInt(1000);
      final NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
            "mychanel",
            "my chanel",
            importance: Importance.max,
            priority: Priority.high,
          )

      );
      print("my id is ${id.toString()}");
      await FlutterLocalNotificationsPlugin().show(

        id,
        message.notification!.title,
        message.notification!.title,
        notificationDetails,);
    } on Exception catch (e) {
      print('Error>>>$e');
    }
  }

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((message) {
      display(message);
    });
    storeNotificationToken();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Home Screen"),
        ),
      ),
    );
  }
}
