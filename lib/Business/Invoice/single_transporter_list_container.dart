import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleTransporterListContainer extends StatelessWidget {
  final companyName;
  final city;
  final state;
  final ratings;
  final imageUrl;
  SingleTransporterListContainer(
      {this.city, this.companyName, this.state, this.ratings, this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      width: 320,
      //height:  100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Color(0xff707070).withOpacity(0.15),
              blurRadius: 3.0,
              spreadRadius: 0.5,
              offset: Offset(0, 1)),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            width: 100,
            height: 90,
            
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
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
                right: 8,
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
                          fontSize: 11,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xffFFEB37),
                        size: 19,
                      ),
                    ],
                  ),
                  FittedBox(
                    child: Text(
                      "${companyName}",
                      style: GoogleFonts.muli(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      "${city}, ${state}",
                      style: GoogleFonts.muli(
                        color: Colors.black.withOpacity(0.3),
                        fontSize: 15,
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
                        onPressed: null,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Color(0xffFF7171),
                        ),
                        onPressed: null,
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
