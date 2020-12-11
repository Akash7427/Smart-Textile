import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/main.dart';

class THomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Transporter"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  Box<User> userBox = Hive.box<User>("User");
                  userBox.delete("user");
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return MyApp();
                  }));
                })
          ],
        ),
      ),
    );
  }
}
