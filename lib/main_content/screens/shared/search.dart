import 'package:flutter/material.dart';
import 'package:smarttextile/main_content/components/grey_header.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';

class Search extends StatefulWidget {
  final Function onTap;
  final List list;
  final name;

  Search({this.list, this.onTap, this.name});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var _filterList;

  @override
  void initState() {
    _filterList = widget.list;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  name: "Select ${widget.name}", color: Color(0xffEBEBEB)),
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
                      return GestureDetector(
                        onTap: () {
                          widget.onTap(_filterList[index]);
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: SizeConfig.safeBlockVertical * 40,
                          width: SizeConfig.safeBlockHorizontal * 320,
                          margin: EdgeInsets.all(
                              SizeConfig.safeBlockHorizontal * 10),
                          decoration: BoxDecoration(
                            color: Color(0xff00CBD2),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.16),
                                blurRadius: 2.0,
                                spreadRadius: 1.0,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              _filterList[index],
                              style: TextStyle(
                                fontFamily: "Segoe UI",
                                color: Colors.white,
                                fontSize: SizeConfig.safeBlockHorizontal * 20,
                              ),
                            ),
                          ),
                        ),
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
