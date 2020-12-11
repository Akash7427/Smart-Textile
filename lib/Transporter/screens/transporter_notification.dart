import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarttextile/Transporter/shared/size_config.dart';

class TransporterNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return NotificationBuilder(
                            index: index,
                            color: Color(0xff62B9BF),
                            nextColor: Color(0xff62B9BF),
                            last: index == 9 ? true : false,
                          );
                        }),
                  ),
                ),
              ],
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 80,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    SizeConfig.safeBlockVertical * 70,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 15,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: SizeConfig.safeBlockHorizontal * 25,
                      color: Color(0xff3b3b3b),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    "Notification",
                    style: GoogleFonts.montserrat(
                      fontSize: SizeConfig.safeBlockHorizontal * 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Spacer(
                    flex: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationBuilder extends StatelessWidget {
  final int index;
  final Color color;
  final Color nextColor;
  final bool last;
  NotificationBuilder({this.index, this.color, this.nextColor, this.last});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: last == true ? Colors.white : nextColor,
      child: Container(
        height: index == 0
            ? SizeConfig.safeBlockVertical * 182
            : SizeConfig.safeBlockVertical * 102,
        width: double.maxFinite,
        padding: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 2),
        decoration: BoxDecoration(
          color: Color(0xffE0E0E0),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              SizeConfig.safeBlockVertical * 70,
            ),
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(
            left: SizeConfig.safeBlockVertical * 25,
          ),
          height: index == 0
              ? SizeConfig.safeBlockVertical * 180
              : SizeConfig.safeBlockVertical * 100,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                SizeConfig.safeBlockVertical * 70,
              ),
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: index == 0
                    ? SizeConfig.safeBlockVertical * 80
                    : SizeConfig.safeBlockVertical * 0,
              ),
              Expanded(
                child: Container(
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: SizeConfig.safeBlockVertical * 22,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: SizeConfig.safeBlockVertical * 20,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage("assets/images/logo.png"),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.safeBlockHorizontal * 5,
                              vertical: SizeConfig.safeBlockVertical * 5,
                            ),
                            child: Center(
                              child: Text(
                                "One message from paras gang",
                                style: TextStyle(
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 15,
                                    color: Colors.white,
                                    fontFamily: "Segoe ui"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
