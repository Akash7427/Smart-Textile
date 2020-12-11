import 'package:flutter/material.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/main_content/components/grey_header.dart';
import 'package:smarttextile/main_content/models/supplier.dart';
import 'package:smarttextile/main_content/services/launching_services.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SingleTaxConsultantDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffbfbfb),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 10),
            child: Column(
              children: <Widget>[
                GreyHeader(
                  name: "Details",
                  color: Color(0xff03ACB8),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 15,
                ),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 130,
                  height: SizeConfig.safeBlockHorizontal * 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff707070).withOpacity(0.4),
                        blurRadius: SizeConfig.safeBlockHorizontal * 5,
                        offset: Offset(2, 5),
                      ),
                    ],
                    image: DecorationImage(
                        image: AssetImage("assets/images/tax/01.png"),
                        fit: BoxFit.contain),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 8,
                ),
                FittedBox(
                  child: Text(
                    "Paras Gang",
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      fontSize: SizeConfig.safeBlockHorizontal * 25,
                    ),
                  ),
                ),
                SmoothStarRating(
                  rating: 4.5,
                  allowHalfRating: true,
                  size: SizeConfig.safeBlockHorizontal * 35,
                  onRated: (rating) {
                    //TODO Update rating
                  },
                  color: Color(0xffFFEB37),
                  borderColor: Color(0xff00ADD1),
                  //filledIconData: Icons.blur_off,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 5,
                ),
                ActionChip(
                  label: Text(
                    "+91 7226090089",
                    style: TextStyle(
                        fontFamily: "Segoe UI",
                        fontSize: SizeConfig.safeBlockHorizontal * 13),
                  ),
                  onPressed: () async {
                    LaunchingServices().makePhoneCall("tel:+91 7226090089");
                  },
                  backgroundColor: Color(0xffD0FF92),
                  elevation: 5.0,
                  avatar: Icon(
                    Icons.call,
                    color: Color(0xff00D848),
                  ),
                  labelPadding: EdgeInsets.all(4.0),
                  shadowColor: Colors.black.withOpacity(0.5),
                ),
                ActionChip(
                  label: Text(
                    "Favourite",
                    style: TextStyle(
                        fontFamily: "Segoe UI",
                        fontSize: SizeConfig.safeBlockHorizontal * 13),
                  ),
                  shadowColor: Colors.black.withOpacity(0.5),
                  onPressed: () {
                    //TODO
                  },
                  labelPadding: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockVertical * 3,
                    horizontal: SizeConfig.safeBlockHorizontal * 3,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 5.0,
                  avatar: Icon(
                    Icons.favorite_border,
                    color: Color(0xff707070),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 10,
                ),
                RichText(
                  text: TextSpan(
                    text: "Address: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: SizeConfig.safeBlockHorizontal * 15),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Parvat Patiya, Surat, Gujarat, 395010",
                        style: TextStyle(
                          fontFamily: "Seogoe UI",
                          fontWeight: FontWeight.normal,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockVertical * 10,
                  ),
                  padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
                  height: SizeConfig.safeBlockVertical * 100,
                  width: SizeConfig.safeBlockHorizontal * 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.16),
                        blurRadius: SizeConfig.safeBlockHorizontal * 2.0,
                        offset: Offset(
                          SizeConfig.safeBlockHorizontal * 0.5,
                          SizeConfig.safeBlockHorizontal * 0.5,
                        ),
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Description",
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 15,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 3,
                      ),
                      Text(
                        "sfjnskdfknczknxm,zvnn,znv,mxznv,znvjknzvjknxzdkjfndzjknfjdn",
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 13.5,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
