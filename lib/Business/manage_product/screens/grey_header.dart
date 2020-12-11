import 'package:flutter/material.dart';
import 'package:smarttextile/Business/manage_product/screens/size_config.dart';

class GreyHeader extends StatelessWidget {
  final name;
  GreyHeader({this.name});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.safeBlockVertical * 40,
      width: SizeConfig.safeBlockHorizontal * 340,
      decoration: BoxDecoration(
        color: Color(0xffEBEBEB),
        borderRadius:
            BorderRadius.circular(SizeConfig.safeBlockHorizontal * 15),
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
            name,
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
    );
  }
}
