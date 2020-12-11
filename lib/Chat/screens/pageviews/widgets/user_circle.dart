import 'package:smarttextile/Chat/screens/pageviews/widgets/customdialog.dart';
import 'package:smarttextile/Chat/screens/pageviews/widgets/size_config.dart';
import 'package:flutter/material.dart';
import 'package:smarttextile/Chat/utils/universal_variables.dart';

class UserCircle extends StatefulWidget {
  final String profile;
  final String name;
  final String companyname;
  final String ph;
  final String email;

  UserCircle({this.profile, this.name, this.companyname, this.ph, this.email});

  @override
  _UserCircleState createState() => _UserCircleState();
}

class _UserCircleState extends State<UserCircle> {
  bool isFav;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFav = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(
            title: widget.name,
            description: widget.companyname,
            profileImage: widget.profile,
            companyname: widget.companyname,
            ph: widget.ph,
            email: widget.email,
            onTap: () {
              setState(() {
                isFav = !isFav;
                print(isFav);
              });
            },
            isFav: isFav),
      ),
      child: Container(
        height: SizeConfig.safeBlockHorizontal * 45,
        width: SizeConfig.safeBlockVertical * 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 48,
                // child: ClipOval(
                //   child: widget.profile != null
                //       ? Image.network(widget.profile)
                //       : Image.asset("assets/images/logo.png"),
                // ),
                backgroundImage: widget.profile != null ?NetworkImage(widget.profile):AssetImage("assets/images/logo.png"),
              ),
            ),
            new Positioned(
                bottom: -4,
                right: -4,
                child: new Container(
                    padding: EdgeInsets.all(1),
                    constraints: BoxConstraints(
                      minWidth: SizeConfig.safeBlockVertical * 12,
                      minHeight: SizeConfig.safeBlockHorizontal * 12,
                    ),
                    child: Icon(
                      isFav ? Icons.favorite : null,
                      color: Colors.red,
                    )))
          ],
        ),
      ),
    );
  }
}
