import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleDriverListContainer extends StatelessWidget {
  final name;
  final imageUrl;
  SingleDriverListContainer(
      { this.name,this.imageUrl});
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  
                  FittedBox(
                    child: Text(
                      "${name}",
                      style: GoogleFonts.muli(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(icon: Icon(Icons.call,color: Color(0xff00D848),),onPressed: null,)
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
