import 'package:fcmflutter/api/firebase_api.dart';
import 'package:fcmflutter/page/home_screen.dart';
import 'package:fcmflutter/page/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fcmflutter/firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FireBaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Push Notification',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 40),
          ),
        ),
        navigatorKey: navigatorKey,
        home: const HomeScreen(),
        routes: {
          NotificationScreen.route: (context) => const NotificationScreen()
        },
      );
}
