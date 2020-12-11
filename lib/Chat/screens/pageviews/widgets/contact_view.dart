import 'package:smarttextile/Chat/models/message.dart';
import 'package:smarttextile/Chat/screens/pageviews/widgets/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/Chat/models/contact.dart';
import 'package:smarttextile/Chat/resources/auth_methods.dart';
import 'package:smarttextile/Chat/resources/chat_methods.dart';
import 'package:smarttextile/Chat/screens/chatscreens/chat_screen.dart';
import 'package:smarttextile/Chat/screens/chatscreens/widgets/cached_image.dart';
import 'package:smarttextile/Chat/widgets/custom_tile.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/shared/provider_user.dart';
import 'last_message_container.dart';

class ContactView extends StatelessWidget {
  final Contact contact;
  final index;
  final AuthMethods _authMethods = AuthMethods();

  ContactView(this.contact, this.index);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: _authMethods.getUserDetailsById(contact.uid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          User user = snapshot.data;

          return ViewLayout(
            contact: user,
            index: index,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class ViewLayout extends StatelessWidget {
  final User contact;
  final ChatMethods _chatMethods = ChatMethods();
  final index;

  ViewLayout({
    @required this.contact,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    final ProviderUser userProvider = Provider.of<ProviderUser>(context);

    return CustomTile(
      index: index,
      mini: false,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(
                receiver: contact,
                senderProfilePhoto: userProvider.logo,
              ),
            ));
      },
      onLongPress: () {
        _showCupertinoAlertDialog(context, userProvider.uid, contact.uid);
      },
      title: Text(
          (contact != null ? contact.name : null) != null ? contact.name : "..",
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 12,
              color: Color(0xff000000),
              fontWeight: FontWeight.w800,
            ),
          )),
      subtitle: LastMessageContainer(
        stream: _chatMethods.fetchLastMessageBetween(
          senderId: userProvider.uid,
          receiverId: contact.uid,
        ),
      ),
      leading: Container(
        constraints: BoxConstraints(
            maxHeight: SizeConfig.safeBlockHorizontal * 60,
            maxWidth: SizeConfig.safeBlockVertical * 60),
        child: Stack(
          children: <Widget>[
            contact.logo!=null?
            CachedImage(
              contact.logo,
              radius: 40,
              isRound: true,
            ):CircleAvatar(
              backgroundImage:AssetImage("assets/images/logo.png"),
              radius: 20,
            ),
          ],
        ),
      ),
    );
  }
}

_showCupertinoAlertDialog(BuildContext context, String user, String receiver) {
  ChatMethods _chatMethods = ChatMethods();

  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("Delete"),
          content: Text("Are You Sure?"),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text("OK"),
              isDestructiveAction: true,
              onPressed: () {
                _chatMethods.deleteTileDb(user, receiver);
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: Text("CANCEL"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      });
}
