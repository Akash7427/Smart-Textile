import 'package:smarttextile/Chat/screens/pageviews/widgets/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/Chat/models/contact.dart';
import 'package:smarttextile/Chat/resources/chat_methods.dart';
import 'package:smarttextile/Chat/screens/pageviews/widgets/contact_view.dart';
import 'package:smarttextile/Chat/screens/pageviews/widgets/quiet_box.dart';
import 'package:smarttextile/main_content/components/radial.dart';
import 'package:smarttextile/shared/provider_user.dart';

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
  ProviderUser providerUser = Provider.of<ProviderUser>(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          //appBar: customAppBar(context),
          body: Stack(
            //alignment: Alignment.topCenter,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    // height: SizeConfig().safeBlockVertical * 5,
                    height: SizeConfig.safeBlockHorizontal * 20,
                  ),
                  Expanded(child: ChatListContainer()),
                ],
              ),
              Chatappbar(),
              
              providerUser.type != "Transporter"?Radial():SizedBox()
              
            ],
          )),
    );
  }
}

class ChatListContainer extends StatelessWidget {
  final ChatMethods _chatMethods = ChatMethods();

  @override
  Widget build(BuildContext context) {
    final ProviderUser userProvider = Provider.of<ProviderUser>(context);

    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: _chatMethods.fetchContacts(
            userId: userProvider.uid,
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var docList = snapshot.data.documents;

              if (docList.isEmpty) {
                return QuietBox();
              }
              return ListView.builder(
                //padding: EdgeInsets.all(10),
                itemCount: docList.length,
                itemBuilder: (context, index) {
                  Contact contact = Contact.fromMap(docList[index].data);

                  return ContactView(contact, index);
                },
              );
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class Chatappbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ProviderUser providerUser = Provider.of<ProviderUser>(context);
    return SafeArea(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft:
                        Radius.circular(SizeConfig.safeBlockVertical * 70),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff62B9BF).withOpacity(0.16),
                      blurRadius: SizeConfig.safeBlockVertical * 8,
                      spreadRadius: SizeConfig.safeBlockVertical * 0.6,
                    ),
                  ]),
              padding: const EdgeInsets.only(
                left: 10,
                top: 0,
                bottom: 0,
                right: 10,
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    providerUser.type != "Transporter"?
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[

                          Container(
                              child: IconButton(
                            icon: Icon(
                              Icons.search,
                              size: SizeConfig.safeBlockHorizontal * 30,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, "/search_screen");
                            },
                          )),
                        ]):
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(icon: Icon(Icons.arrow_back_ios), onPressed:()=> Navigator.pop(context)),
                          Container(
                              child: IconButton(
                            icon: Icon(
                              Icons.search,
                              size: SizeConfig.safeBlockHorizontal * 30,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, "/search_screen");
                            },
                          )),
                        ]),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: SizeConfig.safeBlockVertical * 69),
                        Text(
                          "Chat",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.safeBlockHorizontal * 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 10,
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
