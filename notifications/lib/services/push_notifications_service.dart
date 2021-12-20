import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// SHA1: F4:53:C9:56:54:61:51:D4:A3:91:77:E5:E8:92:E7:88:BC:95:46:B6

class PushNotificationsService {

  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static Future initializeApp() async{
    //Push Notifications
    await Firebase.initializeApp();
    token= await FirebaseMessaging.instance.getToken();
    print(token);

    //Local Notifications
  }

} 