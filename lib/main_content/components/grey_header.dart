import 'package:flutter/material.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';

class GreyHeader extends StatelessWidget {
  final Color textColor;
  final name;
  final Color color;
  GreyHeader({@required this.name, @required this.color, this.textColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.safeBlockVertical * 40,
      width: SizeConfig.safeBlockHorizontal * 340,
      decoration: BoxDecoration(
        color: color,
        borderRadius:
            BorderRadius.circular(SizeConfig.safeBlockHorizontal * 25),
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
              color: textColor ?? Colors.black,
            ),
            iconSize: SizeConfig.safeBlockHorizontal * 18,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Expanded(
            flex: 3,
            child: SizedBox(),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 20,
              fontWeight: FontWeight.w100,
              fontFamily: "Segoe UI",
              color: textColor ?? Color(0xff3A3A3A),
            ),
          ),
          Expanded(flex: 4, child: SizedBox()),
        ],
      ),
    );
  }
}
