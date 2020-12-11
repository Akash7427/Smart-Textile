import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/Business/Invoice/transpoter_list.dart';
import 'package:smarttextile/Business/Main/your_order.dart';
import 'package:smarttextile/Transporter/screens/delivery_details.dart';
import 'package:smarttextile/Transporter/shared/size_config.dart';
import 'package:smarttextile/main_content/screens/retailers/reatiler_order.dart';
import 'package:smarttextile/main_content/screens/shared/transporters_list.dart';
import 'package:smarttextile/main_content/screens/wholesalers/wholesaler_order.dart';
import 'package:smarttextile/shared/provider_user.dart';

class UserNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: NotificationList(
                      
                    )
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
  final String title;
  final Function onTap;
  NotificationBuilder({this.index, this.color, this.nextColor, this.last, this.title, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
          child: Container(
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
                                  title,
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
      ),
    );
  }
}




class NotificationList extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    
    ProviderUser providerUser=Provider.of<ProviderUser>(context);
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('notifications').where("receiveruid", isEqualTo:  providerUser.uid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            return Scaffold(
                          body: ListView.builder(
                            itemCount: snapshot.data.documents.length,
                  itemBuilder: (context , index){
                    return NotificationBuilder(
                            index: index,
                            color: Color(0xff62B9BF),
                            nextColor: Color(0xff62B9BF),
                            last: index == snapshot.data.documents.length-1 ? true : false,
                            title:snapshot.data.documents[index].data["title"],
                            onTap: (){

                              if(snapshot.data.documents[index].data["screen"]=="New Order")
                              {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDtls(providerUser: providerUser,)));
                              }

                              if(snapshot.data.documents[index].data["screen"]=="Seller Order")
                              {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDtls(providerUser: providerUser,)));
                              }

                              if(snapshot.data.documents[index].data["screen"]=="Wholesaler Order")
                              {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>WholesalerOrderDtls(providerUser: providerUser,)));
                              }

                              if(snapshot.data.documents[index].data["screen"]=="Order Accepted")
                              {
                                if(providerUser.type == "Wholesaler"){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>WholesalerOrderDtls(providerUser: providerUser,)));
                              }
                              else{
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>RetailerOrderDtls(providerUser: providerUser,)));
                              }
                              }

                              if(snapshot.data.documents[index].data["screen"]=="Transporter New Order")
                              {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>DeliveryDetails(providerUser: providerUser,)));
                              }
                            },
                          );
                  },
                ),
            );
        }
      },
    );
  }
}


// title: new Text(document['title']),
//                       subtitle: new Text(document['uid']),
