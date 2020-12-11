import 'package:flutter/material.dart';
import 'package:smarttextile/main_content/components/grey_header.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';

class SelectCity extends StatefulWidget {
  final Function onTap;
  final List list;
  final List cityList;

  SelectCity({this.list, this.onTap, this.cityList});

  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  var _filterList;
  List<String> _cityList = List();

  @override
  void initState() {
    _filterList = widget.list;
    _cityList = widget.cityList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 10,
            vertical: SizeConfig.safeBlockVertical * 15,
          ),
          child: Column(
            children: <Widget>[
              GreyHeader(
                  name: "Select Working Cities", color: Color(0xffEBEBEB)),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 10),
                child: TextField(
                  onChanged: (string) {
                    setState(() {
                      _filterList = widget.list
                          .where((u) => (u
                              .toLowerCase()
                              .contains(string.trim().toLowerCase())))
                          .toList();
                    });
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
                    contentPadding: EdgeInsets.only(
                      top: SizeConfig.safeBlockVertical * 9,
                      bottom: SizeConfig.safeBlockVertical * 9,
                      left: SizeConfig.safeBlockVertical * 18,
                      right: SizeConfig.safeBlockVertical * 8,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          SizeConfig.safeBlockHorizontal * 20),
                      borderSide: BorderSide(
                        color: Color(0xff00CBD2),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          SizeConfig.safeBlockHorizontal * 20),
                      borderSide: BorderSide(
                        color: Color(0xff00CBD2),
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          SizeConfig.safeBlockHorizontal * 20),
                      borderSide: BorderSide(
                        color: Color(0xff00CBD2),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 15,
              ),
              Expanded(
                child: Container(
                  width: SizeConfig.blockSizeHorizontal * 340,
                  height: SizeConfig.safeBlockVertical * 300,
                  child: ListView.builder(
                    itemCount: _filterList.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        value: _cityList.contains(_filterList[index]),
                        onChanged: (bool selected) {
                          if (selected) {
                            if (_cityList.contains(_filterList[index]) !=
                                true) {
                              widget.onTap(_filterList[index], true);
                              print(_cityList);
                            }
                          } else {
                            if (_cityList.contains(_filterList[index]) ==
                                true) {
                              _cityList.remove(_filterList[index]);
                              widget.onTap(_filterList[index], false);
                              print(_cityList);
                            }
                          }
                          setState(() {});
                        },
                        title: Text(
                          _filterList[index],
                          style: TextStyle(
                              fontFamily: "Segoe UI",
                              fontSize: SizeConfig.safeBlockHorizontal * 20),
                        ),
                        activeColor: Color(0xff00B6C7),
                        controlAffinity: ListTileControlAffinity.leading,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// widget.onTap(_filterList[index]);
