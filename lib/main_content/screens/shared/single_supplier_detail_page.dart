import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/Chat/screens/chatscreens/chat_screen.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/main_content/models/supplier.dart';
import 'package:smarttextile/main_content/services/launching_services.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';
import 'package:smarttextile/shared/provider_user.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SingleSupplierDetailPage extends StatelessWidget {
  final User supplier;
  SingleSupplierDetailPage({this.supplier});
  @override
  Widget build(BuildContext context) {
    ProviderUser providerUser = Provider.of<ProviderUser>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffbfbfb),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 10),
            child: Column(
              children: <Widget>[
                Container(
                  height: SizeConfig.safeBlockVertical * 40,
                  width: SizeConfig.safeBlockHorizontal * 340,
                  decoration: BoxDecoration(
                    color: Color(0xffEBEBEB),
                    borderRadius: BorderRadius.circular(
                        SizeConfig.safeBlockHorizontal * 25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.16),
                        blurRadius: SizeConfig.safeBlockHorizontal * 2.5,
                        offset: Offset(SizeConfig.safeBlockHorizontal * 1,
                            SizeConfig.safeBlockHorizontal * 1),
                        spreadRadius: SizeConfig.safeBlockHorizontal * 1,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                        iconSize: SizeConfig.safeBlockHorizontal * 18,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Expanded(flex: 3, child: SizedBox()),
                      Text(
                        "Details",
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 20,
                          fontWeight: FontWeight.w100,
                          fontFamily: "Segoe UI",
                          color: Color(0xff3A3A3A),
                        ),
                      ),
                      Expanded(flex: 4, child: SizedBox()),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 10,
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
                        image: supplier.logo == null
                            ? AssetImage("assets/images/logo.png")
                            : NetworkImage(supplier.logo),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 8,
                ),
                FittedBox(
                  child: Text(
                    supplier.companyName,
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      fontSize: SizeConfig.safeBlockHorizontal * 25,
                    ),
                  ),
                ),
                SmoothStarRating(
                  rating: double.parse(supplier.rating),
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
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ActionChip(
                        label: Text(
                          "Chat",
                          style: TextStyle(
                              fontFamily: "Segoe UI",
                              fontSize: SizeConfig.safeBlockHorizontal * 13),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ChatScreen(
                              receiver: supplier,
                            );
                          }));
                        },
                        backgroundColor: Colors.white,
                        elevation: 5.0,
                        shadowColor: Colors.black.withOpacity(0.5),
                        avatar: Icon(
                          Icons.mode_comment,
                          color: Color(0xff3BB7FF),
                        ),
                        labelPadding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeBlockHorizontal * 12),
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 4,
                      ),
                      ActionChip(
                        label: Text(
                          "+91 ${supplier.phoneNo.toString()}",
                          style: TextStyle(
                              fontFamily: "Segoe UI",
                              fontSize: SizeConfig.safeBlockHorizontal * 13),
                        ),
                        onPressed: () async {
                          LaunchingServices().makePhoneCall(
                              "tel:+91 ${supplier.phoneNo.toString().substring(supplier.phoneNo.toString().length - 10)}");
                        },
                        backgroundColor: Colors.white,
                        elevation: 5.0,
                        avatar: Icon(
                          Icons.call,
                          color: Color(0xff00D848),
                        ),
                        labelPadding: EdgeInsets.all(4.0),
                        shadowColor: Colors.black.withOpacity(0.5),
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 4,
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
                          providerUser.setFavouriteUsers(supplier.uid);
                        },
                        backgroundColor: Colors.white,
                        elevation: 5.0,
                        avatar: Icon(
                          Icons.favorite,
                          color: Color(0xffFF7171),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockVertical * 5,
                  ),
                  child: Text(
                    "Supplier of ${supplier.categories.join(", ")}",
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      fontSize: SizeConfig.safeBlockHorizontal * 16,
                    ),
                    textAlign: TextAlign.center,
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
                        text:
                            "${supplier.address}, ${supplier.city}, ${supplier.state}, ${supplier.pincode}",
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
                    vertical: SizeConfig.safeBlockVertical * 15,
                  ),
                  padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 10),
                  //height: SizeConfig.safeBlockVertical * 100,
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
                        height: SizeConfig.safeBlockVertical * 7,
                      ),
                      Text(
                        supplier.description,
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 13.5,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 5,
                    vertical: SizeConfig.safeBlockVertical * 10,
                  ),
                  height: SizeConfig.safeBlockVertical * 150,
                  width: SizeConfig.safeBlockHorizontal * 130,
                  //color: Colors.green,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://firebasestorage.googleapis.com/v0/b/smart-textile137.appspot.com/o/OIP.jpg?alt=media&token=12cd3427-d48e-46ed-8f87-bf3e33c9b066"),
                          fit: BoxFit.fill)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 5,
                    vertical: SizeConfig.safeBlockVertical * 10,
                  ),
                  height: SizeConfig.safeBlockVertical * 150,
                  width: SizeConfig.safeBlockHorizontal * 130,
                  //color: Colors.green,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://firebasestorage.googleapis.com/v0/b/smart-textile137.appspot.com/o/iso-logo.gif?alt=media&token=ae5b234e-0300-4d0d-b348-59bdf47f87d4"),
                          fit: BoxFit.fill)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
