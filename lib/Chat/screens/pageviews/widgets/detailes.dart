import 'package:flutter/material.dart';
import 'size_config.dart';

class RecieverDetails extends StatelessWidget {
  final String title;
  final String photo;
  final String companyname;
  final String ph;
  final String email;

  const RecieverDetails(
      {Key key, this.title, this.photo, this.companyname, this.ph, this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 185,
                  width: double.maxFinite,
                ),
                FittedBox(
                  child: Text(
                    title!=null?title:"Title",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.safeBlockHorizontal * 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 10,
                ),
                RecieverDetailsContainer(
                  text: companyname!=null?companyname:"Company Name",
                ),
                RecieverDetailsContainer(
                  text: "WHO ARE YOU?",
                ),
                RecieverDetailsContainer(
                  text: ph!=null?ph:"Phone No",
                ),
                RecieverDetailsContainer(
                  text: email!=null?email:"Email",
                ),
              ],
            ),
            customappbar(context),
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 35),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: SizeConfig.safeBlockVertical * 130,
                  width: SizeConfig.safeBlockVertical * 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff707070),
                        blurRadius: SizeConfig.safeBlockHorizontal * 8,
                        offset: Offset(2, 5),
                      ),
                    ],
                    image: DecorationImage(
                        image: photo != null
                            ? NetworkImage(photo)
                            : AssetImage("assets/images/logo,png"),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecieverDetailsContainer extends StatelessWidget {
  final text;

  RecieverDetailsContainer({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 4),
      height: SizeConfig.safeBlockVertical * 44,
      width: SizeConfig.safeBlockHorizontal * 310,
      decoration: BoxDecoration(
        color: Color(0xffEEEEEE),
        borderRadius: BorderRadius.circular(SizeConfig.safeBlockVertical * 25),
      ),
      child: Center(
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.black,
                fontSize: SizeConfig.safeBlockHorizontal * 17),
          ),
        ),
      ),
    );
  }
}

Widget customappbar(BuildContext context) {
  SizeConfig().init(context);
  return Container(
    height: SizeConfig.safeBlockVertical * 120,
    width: double.maxFinite,
    decoration: BoxDecoration(
      color: Color(0xffFBFBFB),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(SizeConfig.safeBlockHorizontal * 70),
      ),
      boxShadow: [
        BoxShadow(
          color: Color(0xff00747A).withOpacity(0.3),
          blurRadius: SizeConfig.safeBlockVertical * 10,
          spreadRadius: SizeConfig.safeBlockVertical * 0.5,
        ),
      ],
    ),
    child: Column(
      children: <Widget>[
        SizedBox(
          height: SizeConfig.safeBlockVertical * 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              iconSize: SizeConfig.safeBlockHorizontal * 25,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ],
    ),
  );
}
