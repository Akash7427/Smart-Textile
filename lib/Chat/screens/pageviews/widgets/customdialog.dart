import 'dart:math';

import 'package:smarttextile/Chat/screens/pageviews/widgets/detailes.dart';
import 'package:smarttextile/Chat/screens/pageviews/widgets/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDialog extends StatelessWidget {
  final String title, description;
  final String profileImage;
  final Function onTap;
  final isFav;
  
  final String companyname;
  final String ph;
  final String email;

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.profileImage,
    this.onTap,
    this.isFav, this.companyname, this.ph, this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context, onTap),
    );
  }

  dialogContent(BuildContext context, Function onTap) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Color(0xff505C62),
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                title,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.safeBlockHorizontal * 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.safeBlockHorizontal * 16),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff6E8CA0),
                  fontSize: SizeConfig.safeBlockHorizontal * 16,
                ),
              ),
              SizedBox(height: SizeConfig.safeBlockHorizontal * 24),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: SizeConfig.safeBlockVertical * 50,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecieverDetails(
                                  title: title,
                                  photo: profileImage,
                                  companyname: companyname,
                                  ph: ph,
                                  email: email,
                                )),
                      ); // To close the dialog
                    },
                    child: Text("DETAILS",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                color: Color(0xff87BCBF),
                                fontWeight: FontWeight.w400))),
                  ),
                  SizedBox(width: SizeConfig.safeBlockVertical * 45),
                  GestureDetector(
                    onTap: () {
                      onTap();
                      Navigator.pop(context);
                    },
                    child: Text(
                      isFav == false ? "FAVOURITE" : "UN-FAVOURITE",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 12,
                              color: Color(0xffD97D54),
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 45,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: Consts.padding,
          right: Consts.padding,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey,
                      child: CircleAvatar(
              backgroundColor: Colors.white,
              
              radius: 48,
              child: ClipOval(
                child: profileImage!=null?Image.network(profileImage):Image.asset("assets/images/logo.png"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 50.0;
}
