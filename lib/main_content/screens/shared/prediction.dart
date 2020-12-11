import 'package:flutter/material.dart';
import 'package:smarttextile/main_content/components/top_bar.dart';

class Prediction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            TopBar(),
          ],
        ),
      ),
    );
  }
}
