import 'package:delivery_agent/home_screen.dart';
import 'package:delivery_agent/src/features/authentication/screens/notification/notification_services.dart';
import 'package:delivery_agent/src/repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).
   then((value) => Get.put(AuthenticationRepository()));
   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}
NotificationServices notificationServices=NotificationServices();
@pragma('vm:entry-point')
Future<void>_firebaseMessagingBackgroundHandler(RemoteMessage message)async{
  await Firebase.initializeApp();


}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      themeMode:ThemeMode.system,
    );
  }
}

