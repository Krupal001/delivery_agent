import 'dart:convert';

import 'package:delivery_agent/src/features/authentication/screens/notification/notification_services.dart';
import 'package:delivery_agent/src/repository/authentication_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  NotificationServices notificationServices = NotificationServices();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit(context);
    notificationServices.getDeviceToken().then((value){
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Notifications'),

      ),
      body: ElevatedButton(
        onPressed: (){
          AuthenticationRepository.instance.logout();
        },
        child: const Text('logout'),
      ),

    );
  }
}