import 'dart:convert';
import 'package:http/http.dart' as http;

class PushNotification {
  Future postNotification(
      {String title,
      String notification_body,
      String receiverid,
      List token,
      String screen,
      String uid}) async {
    final postUrl = 'https://fcm.googleapis.com/fcm/send';
    final data = {
      "registration_ids": token,
      "collapse_key": "type_a",
      "notification": {
        "title": title ?? "Smart Textile",
        "body": notification_body
      },
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "id": "1",
        "status": "done",
        "notification_screen": screen,
        "uid": uid,
        "receiverid":receiverid,
      },
    };

    final headers = {
      'content-type': 'application/json',
      'Authorization':
          "key=AAAAm0roNh0:APA91bFF7W8ICDPHF8kGZq9IHpX56BQiG56Icy-Oc_tqgiQkKNkttrtb5Ku-DY-3EGLDq1-f3XATeI2QWbkBXjcfzt6iY0F7Ci7OiJHrXFh-8BTP_PMQjUQj5c7GBRDtAj37trn2tl2A"
    };

    http.Response response = await http.post(
      postUrl,
      body: json.encode(data),
      encoding: Encoding.getByName('utf-8'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      print("Notification send Successfully");
    }
  }
}
