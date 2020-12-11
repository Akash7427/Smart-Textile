import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarttextile/Chat/screens/pageviews/widgets/size_config.dart';
import 'package:flutter/material.dart';
import 'package:smarttextile/Chat/screens/search_screen.dart';
import 'package:smarttextile/Chat/utils/universal_variables.dart';

class QuietBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 25),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.safeBlockVertical * 35,
              horizontal: SizeConfig.safeBlockHorizontal * 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                "assets/images/svg/people_search.svg",
                height: SizeConfig.safeBlockVertical * 270,
                width: SizeConfig.safeBlockHorizontal * 270,
              ),
              SizedBox(height: SizeConfig.safeBlockHorizontal * 25),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Color(0xff62B9BF),
                child: Text("START SEARCHING"),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
