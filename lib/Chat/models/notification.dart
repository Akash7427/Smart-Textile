import 'package:cloud_firestore/cloud_firestore.dart';

class Notifications {
  String title;
  String body;
  String uid;
  String receiveruid;
  String screen;

  


  Notifications({
    this.title,
    this.body,
    this.uid,
    this.receiveruid,
    this.screen,
  });


  Map toMap() {
    var map = Map<String, dynamic>();
    map['title'] = this.title;
    map['body'] = this.body;
    map['uid'] = this.uid;
    map['receiveruid'] = this.receiveruid;
    map['screen'] = this.screen;
    return map;
  }

  

  // named constructor
  Notifications.fromMap(Map<String, dynamic> map) {
    this.title = map['title'];
    this.body = map['body'];
    this.uid = map['uid'];
    this.receiveruid = map['receiveruid'];
    this.screen = map['screen'];
  }
  
}
