import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/Chat/resources/auth_methods.dart';
import 'package:smarttextile/Chat/screens/chatscreens/chat_screen.dart';
import 'package:smarttextile/Transporter/screens/transporter_home_page.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/login/screens/login_body.dart';
import 'package:smarttextile/main_content/components/radial.dart';
import 'package:smarttextile/main_content/screens/producer/p_home_page.dart';
import 'package:smarttextile/main_content/screens/retailers/r_home_page.dart';
import 'package:smarttextile/main_content/screens/transporters/t_home_page.dart';
import 'package:smarttextile/main_content/screens/wholesalers/w_home_page.dart';
import 'package:smarttextile/shared/provider_user.dart';
import 'package:smarttextile/shared/push_notification.dart';

class CheckUser extends StatefulWidget {
  @override
  _CheckUserState createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  _configureFirebaseListner() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        User user =
            await AuthMethods().getUserDetailsById(message['data']['uid']);
        // showOverlayNotification((context) {
        //   return SafeArea(
        //     child: Container(
        //       color: Colors.white,
        //       margin: EdgeInsets.all(10),
        //       decoration: BoxDecoration(),
        //       child: Center(
        //         child: Row(
        //           children: <Widget>[
        //             Text(
        //               user.name,
        //               style: TextStyle(
        //                 color: Colors.black,
        //                 fontSize: 15,
        //                 decoration: TextDecoration.none,
        //               ),
        //             ),
        //             Text(
        //               message['notification']['body'],
        //               style: TextStyle(
        //                 color: Colors.black,
        //                 fontSize: 15,
        //                 decoration: TextDecoration.none,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   );
        // });
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        print(message['data']['notification_screen']);

        if (message['data']['notification_screen'] == 'chat') {
          User user =
              await AuthMethods().getUserDetailsById(message['data']['uid']);

          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ChatScreen(
              receiver: user,
            );
          }));
        }
      },
      // onLaunch: (Map<String, dynamic> message) async {
      //   print("onLaunch: $message");
      //   if (message['data']['notification_screen'] == "chat") {
      //     User user =
      //         await AuthMethods().getUserDetailsById(message['data']['uid']);

      //     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      //       return ChatScreen(
      //         receiver: user,
      //       );
      //     }));
      //   }
      // },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _configureFirebaseListner();
    // PushNotification().postNotification(
    //     notification_body: "Hello World",
    //     token: [
    //       "dzHEfpSFtM0:APA91bFa7jZg7sMN8EZjpnOQM6wWev-uskjNj0SlD6e6jtoYgdsPBcMEFXFpAa_kO-pk_wAAbJNOeGKZkqlRfcjDDFhWiEKniRKm8bC5ZOia98Qoht-RH7QnyOlDImHRCJEHCyDsrukK",
    //     ],
    //     screen: "chat",
    //     uid: "PXyFKQaj38hszWLcfPKYhODZ6582");
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<ProviderUser>(context);

    print(userProvider.uid);
    print(userProvider.type);
    if (userProvider.uid != null) {
      return userProvider.type == "Producer"
          ? Stack(
              children: <Widget>[
                PHomePage(),
                Radial(),
              ],
            )
          : userProvider.type == "Wholesaler"
              ? Stack(
                  children: <Widget>[
                    WHomePage(),
                    Radial(),
                  ],
                )
              : userProvider.type == "Retailer"
                  ? Stack(
                      children: <Widget>[
                        RHomePage(),
                        Radial(),
                      ],
                    )
                  : userProvider.type == "Transporter"
                      ? TransporterHomePage()
                      : LoginBody();
    } else {
      return LoginBody();
    }
  }
}
