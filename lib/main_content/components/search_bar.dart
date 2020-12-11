import 'package:flutter/material.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';

class SearchBar extends StatelessWidget {
  final Function onChanged;
  SearchBar({this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(SizeConfig.safeBlockHorizontal * 13),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                blurRadius: SizeConfig.safeBlockHorizontal * 2,
                offset: Offset(SizeConfig.safeBlockHorizontal * 1,
                    SizeConfig.safeBlockHorizontal * 1),
              ),
            ]),
        child: TextField(
          onChanged: (val) {
            onChanged(val);
          },
          style: TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 15,
            fontFamily: "Segoe UI",
          ),
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 15,
              fontFamily: "Segoe UI",
            ),
            fillColor: Color(0xffffffff),
            filled: true,
            contentPadding: EdgeInsets.only(
              top: SizeConfig.safeBlockVertical * 9,
              bottom: SizeConfig.safeBlockVertical * 9,
              left: SizeConfig.safeBlockVertical * 15,
              right: SizeConfig.safeBlockVertical * 8,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(SizeConfig.safeBlockHorizontal * 13),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(SizeConfig.safeBlockHorizontal * 13),
              borderSide: BorderSide(color: Colors.white),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(SizeConfig.safeBlockHorizontal * 13),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
