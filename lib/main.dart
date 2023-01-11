
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unt_02/views/home_screen.dart';
import 'package:unt_02/views/onboarding_screen.dart';

Future<void> _firebaseMesagingBackgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification.toString());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initialize();
  FirebaseMessaging.onBackgroundMessage(_firebaseMesagingBackgroundHandler);
  runApp(MyApp());
}

void initialize() {
  final InitializationSettings initializationSettings =
  InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"));
  FlutterLocalNotificationsPlugin().initialize(initializationSettings);
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
      // home: const OnBoardingScreen()
      home: FirebaseAuth.instance.currentUser!.uid == null? OnBoardingScreen() : HomeScreen(),
    );
  }

}