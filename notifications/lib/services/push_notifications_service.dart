import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// SHA1: F4:53:C9:56:54:61:51:D4:A3:91:77:E5:E8:92:E7:88:BC:95:46:B6

class PushNotificationsService {

  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static StreamController<String> _messageStream = new StreamController.broadcast();

  static Stream<String> get messagesStream => _messageStream.stream;

 
 static Future _backgroundHandler(RemoteMessage message) async {
    //print('background Handler ${message.messageId}');
print(message.data);
    _messageStream.add( message.data['product'] ?? 'No data' );
  } 
  
  static Future _onMessageHanler(RemoteMessage message) async {
    //print('message Handler ${message.messageId}');
    print(message.data);
    _messageStream.add( message.data['product'] ?? 'No data' );
  } 
  
  static Future _onMessageOpenApp(RemoteMessage message) async {
    //print('onMessageOpenApp Handler ${message.messageId}');
print(message.data);
    _messageStream.add( message.data['product'] ?? 'No data' );
  }


  static Future initializeApp() async{
    //Push Notifications
    await Firebase.initializeApp();
    token= await FirebaseMessaging.instance.getToken();
    print(token);

    //Handlers

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen( _onMessageHanler );
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp );

    //Local Notifications
  }


  static closeStreams(){
    _messageStream.close();
  }

} 