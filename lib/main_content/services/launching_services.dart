import 'dart:ffi';

import 'package:url_launcher/url_launcher.dart';

class LaunchingServices {
  Future<void> makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("Error");
    }
  }
}
