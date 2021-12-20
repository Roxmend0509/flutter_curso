import 'package:flutter/material.dart';
import 'package:notifications/screens/home_screen.dart';
import 'package:notifications/screens/message_screen.dart';
import 'package:notifications/services/push_notifications_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationsService.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes:{
        'home': ( _ ) => HomeScreen(),
        'message': ( _ ) => MessageScreen()
      }
    );
  }
}