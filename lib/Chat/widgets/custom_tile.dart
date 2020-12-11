import 'package:flutter/material.dart';
import 'package:smarttextile/Chat/screens/pageviews/widgets/size_config.dart';

class CustomTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget icon;
  final Widget subtitle;
  final Widget trailing;
  final EdgeInsets margin;
  final bool mini;
  final GestureTapCallback onTap;
  final GestureLongPressCallback onLongPress;
  final index;

  CustomTile({
    @required this.leading,
    @required this.title,
    this.icon,
    @required this.subtitle,
    this.trailing,
    this.margin = const EdgeInsets.all(0),
    this.onTap,
    this.onLongPress,
    this.mini = true,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        //color: Colors.purpleAccent,
        //padding: EdgeInsets.symmetric(horizontal: mini ? 10 : 0),
        margin: margin,
        child: Container(
          //height: index!=0?167.5:180,
          padding: EdgeInsets.only(bottom: SizeConfig.safeBlockHorizontal * 1),
          decoration: BoxDecoration(
            //color: Color(0xffFBFBFB),
            //border: Border.all(width: 0),
            color: Color(0xffAFAFAF),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffFBFBFB),
              //border: Border.all(width: 0),
              //color: Colors.purpleAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(70),
              ),
            ),
            child: Column(
              children: <Widget>[
                index == 0
                    ? SizedBox(
                        height: SizeConfig.safeBlockVertical * 80,
                      )
                    : SizedBox(),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(
                      width: SizeConfig.safeBlockVertical * 30,
                    ),
                    leading,
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: mini ? 10 : 15),

                        //padding: EdgeInsets.symmetric(vertical: mini ? 3 : 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                title,
                                SizedBox(
                                    height: SizeConfig.safeBlockHorizontal * 5),
                                Row(
                                  children: <Widget>[
                                    icon ?? Container(),
                                    subtitle,
                                  ],
                                ),
                              ],
                            ),
                            trailing ?? Container(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
