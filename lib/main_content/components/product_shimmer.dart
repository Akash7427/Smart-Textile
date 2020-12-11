import 'package:flutter/material.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';

class ProductShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 20,
          vertical: SizeConfig.safeBlockVertical * 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                right: SizeConfig.safeBlockHorizontal * 8,
              ),
              //color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: SizeConfig.safeBlockVertical * 30,
                    width: SizeConfig.safeBlockHorizontal * 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              SizeConfig.safeBlockVertical * 20),
                          bottomRight: Radius.circular(
                              SizeConfig.safeBlockVertical * 20),
                        )),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FittedBox(
                      child: Container(
                        color: Colors.white,
                        height: SizeConfig.safeBlockVertical * 15,
                        width: SizeConfig.safeBlockHorizontal * 100,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 5,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      color: Colors.white,
                      height: SizeConfig.safeBlockVertical * 12,
                      width: SizeConfig.safeBlockHorizontal * 70,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 20,
                  ),
                  Container(
                    height: SizeConfig.safeBlockVertical * 30,
                    width: SizeConfig.safeBlockHorizontal * 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                              SizeConfig.safeBlockVertical * 20),
                          bottomLeft: Radius.circular(
                              SizeConfig.safeBlockVertical * 20),
                        )),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 10),
            width: SizeConfig.safeBlockHorizontal * 100,
            height: SizeConfig.safeBlockVertical * 135,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(SizeConfig.safeBlockHorizontal * 15),
            ),
          ),
        ],
      ),
    );
  }
}
