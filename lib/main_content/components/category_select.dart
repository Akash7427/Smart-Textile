import 'package:flutter/material.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';

class CategorySelect extends StatelessWidget {
  final name;
  final color1;
  final color2;
  final alignment;
  final Function onTap;
  final backbutton;
  CategorySelect(
      {@required this.alignment,
      @required this.name,
      @required this.color1,
      @required this.color2,
      this.onTap,
      this.backbutton = false});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin:
              EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 10),
          height: SizeConfig.safeBlockVertical * 50,
          width: SizeConfig.safeBlockHorizontal * 345,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color1, color2],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft),
            borderRadius: BorderRadius.only(
              topRight: alignment == Alignment.centerLeft
                  ? Radius.circular(SizeConfig.safeBlockVertical * 25)
                  : Radius.circular(SizeConfig.safeBlockVertical * 0),
              topLeft: alignment != Alignment.centerLeft
                  ? Radius.circular(SizeConfig.safeBlockVertical * 25)
                  : Radius.circular(SizeConfig.safeBlockVertical * 0),
              bottomRight: alignment == Alignment.centerLeft
                  ? Radius.circular(SizeConfig.safeBlockVertical * 25)
                  : Radius.circular(SizeConfig.safeBlockVertical * 0),
              bottomLeft: alignment != Alignment.centerLeft
                  ? Radius.circular(SizeConfig.safeBlockVertical * 25)
                  : Radius.circular(SizeConfig.safeBlockVertical * 0),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              backbutton == true
                  ? IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      iconSize: SizeConfig.safeBlockHorizontal * 18,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  : SizedBox(),
              Expanded(flex: 1, child: SizedBox()),
              Text(
                name,
                style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 25,
                    fontWeight: FontWeight.w300),
              ),
              Expanded(flex: 1, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
