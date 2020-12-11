import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';
import 'package:smarttextile/shared/provider_user.dart';

import '../../Chat/screens/chatscreens/chat_screen.dart';
import '../../login/models/user.dart';
import '../models/supplier.dart';

class SingleSupplierListContainer extends StatelessWidget {
  final companyName;
  final city;
  final state;
  final ratings;
  final imageUrl;
  final User supplier;
  SingleSupplierListContainer(
      {this.city,
      this.companyName,
      this.state,
      this.ratings,
      this.imageUrl,
      @required this.supplier});
  @override
  Widget build(BuildContext context) {
    ProviderUser providerUser = Provider.of<ProviderUser>(context);
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 20,
          vertical: SizeConfig.safeBlockVertical * 8),
      width: SizeConfig.safeBlockHorizontal * 320,
      //height: SizeConfig.safeBlockVertical * 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(SizeConfig.safeBlockHorizontal * 15),
        boxShadow: [
          BoxShadow(
              color: Color(0xff707070).withOpacity(0.15),
              blurRadius: SizeConfig.safeBlockHorizontal * 3.0,
              spreadRadius: SizeConfig.safeBlockHorizontal * 0.5,
              offset: Offset(0, SizeConfig.safeBlockHorizontal * 1)),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 10),
            width: SizeConfig.safeBlockHorizontal * 100,
            height: SizeConfig.safeBlockVertical * 90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(SizeConfig.safeBlockHorizontal * 15),
              image: DecorationImage(
                  image: imageUrl != null
                      ? NetworkImage(imageUrl)
                      : AssetImage('assets/images/logo.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                right: SizeConfig.safeBlockHorizontal * 8,
              ),
              //color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "$ratings",
                        style: GoogleFonts.muli(
                          color: Colors.black,
                          fontSize: SizeConfig.safeBlockHorizontal * 11,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xffFFEB37),
                        size: SizeConfig.safeBlockHorizontal * 19,
                      ),
                    ],
                  ),
                  FittedBox(
                    child: Text(
                      "${companyName}",
                      style: GoogleFonts.muli(
                        color: Colors.black,
                        fontSize: SizeConfig.safeBlockHorizontal * 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      "${city}, ${state}",
                      style: GoogleFonts.muli(
                        color: Colors.black.withOpacity(0.3),
                        fontSize: SizeConfig.safeBlockHorizontal * 15,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Color(0xff00D848),
                        ),
                        onPressed: null,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.mode_comment,
                          color: Color(0xff3BB7FF),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                        receiver: supplier,
                                      )));
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Color(0xffFF7171),
                        ),
                        onPressed: () {
                          providerUser.setFavouriteUsers(supplier.uid);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// providerUser.favouriteUsers == null
//                             ? providerUser.favouriteUsers.contains(supplier.uid)
//                                 ? Icon(
//                                     Icons.favorite,
//                                     color: Color(0xffFF7171),
//                                   )
//                                 : Icon(
//                                     Icons.favorite_border,
//                                     color: Color(0xffFF7171),
//                                   )
//                             :
