import 'package:flutter/material.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';

class SupplierShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 20,
          vertical: SizeConfig.safeBlockVertical * 8),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 10),
            width: SizeConfig.safeBlockHorizontal * 100,
            height: SizeConfig.safeBlockVertical * 90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(SizeConfig.safeBlockHorizontal * 15),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                right: SizeConfig.safeBlockHorizontal * 8,
              ),
              //color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        height: SizeConfig.safeBlockVertical * 15,
                        width: SizeConfig.safeBlockHorizontal * 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        color: Colors.white,
                        height: SizeConfig.safeBlockVertical * 15,
                        width: SizeConfig.safeBlockHorizontal * 20,
                      ),
                    ],
                  ),
                  FittedBox(
                    child: Container(
                      color: Colors.white,
                      height: SizeConfig.safeBlockVertical * 15,
                      width: SizeConfig.safeBlockHorizontal * 100,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 4,
                  ),
                  Container(
                    color: Colors.white,
                    height: SizeConfig.safeBlockVertical * 12,
                    width: SizeConfig.safeBlockHorizontal * 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        height: SizeConfig.safeBlockVertical * 15,
                        width: SizeConfig.safeBlockHorizontal * 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        color: Colors.white,
                        height: SizeConfig.safeBlockVertical * 15,
                        width: SizeConfig.safeBlockHorizontal * 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        color: Colors.white,
                        height: SizeConfig.safeBlockVertical * 15,
                        width: SizeConfig.safeBlockHorizontal * 30,
                      ),
                      SizedBox(
                        width: 5,
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
