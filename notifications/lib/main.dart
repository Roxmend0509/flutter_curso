import 'package:flutter/material.dart';
import 'package:notifications/screens/home_screen.dart';
import 'package:notifications/screens/message_screen.dart';
import 'package:notifications/services/push_notifications_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationsService.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messagerKey = new GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
  
    // Context!

    PushNotificationsService.messagesStream.listen((message) { 

      print('MyApp: $message');

      navigatorKey.currentState?.pushNamed('message',arguments: message);
      
      final snackBar = SnackBar(content: Text(message));
      messagerKey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messagerKey,
      routes:{
        'home': ( _ ) => HomeScreen(),
        'message': ( _ ) => MessageScreen()
      }
    );
  }
}