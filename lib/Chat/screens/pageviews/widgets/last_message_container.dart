import 'package:smarttextile/Chat/screens/pageviews/widgets/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smarttextile/Chat/models/message.dart';
import 'package:google_fonts/google_fonts.dart';

class LastMessageContainer extends StatelessWidget {
  final stream;

  LastMessageContainer({
    @required this.stream,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          var docList = snapshot.data.documents;

          if (docList.isNotEmpty) {
            Message message = Message.fromMap(docList.last.data);
            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(message.message,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.safeBlockHorizontal * 14,
                      fontWeight: FontWeight.w300,
                    ),
                  )),
            );
          }

          return Text("No Message",
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.safeBlockHorizontal * 14,
                    fontWeight: FontWeight.bold),
              ));
        }
        return Text("..",
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: SizeConfig.safeBlockHorizontal * 14,
                  fontWeight: FontWeight.bold),
            ));
      },
    );
  }
}
