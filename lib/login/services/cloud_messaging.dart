import 'package:firebase_messaging/firebase_messaging.dart';

class CloudMessaging {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  Future<String> getToken() async {
    String token = await _firebaseMessaging.getToken();
    print(token);
    return token;
  }
}
