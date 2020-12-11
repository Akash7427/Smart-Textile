import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/main_content/components/radial.dart';
import 'package:smarttextile/main_content/models/requirements_model.dart';
import 'package:smarttextile/main_content/services/api_requirements.dart';
import 'package:smarttextile/shared/provider_user.dart';
import 'package:smarttextile/shared/size_config.dart';

class PostRequirements extends StatefulWidget {
  @override
  _PostRequirementsState createState() => _PostRequirementsState();
}

class _PostRequirementsState extends State<PostRequirements> {
  String _selectedCategory = "Saree";

  List<String> _category = [
    "Saree",
    "Kurti",
    "Dress",
    "Fabrics",
    "Ethnic Wear",
    "Apparel and Garments"
  ];
  RequirementsModel _requirementsModel = RequirementsModel();

  RangeValues priceRange = RangeValues(1, 15000);
  RangeLabels priceRangeLabel = RangeLabels("0", "99999");
  TextEditingController _subCategory = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _priceStart = TextEditingController();
  TextEditingController _priceEnd = TextEditingController();

  bool _visibleLoading = false;

  @override
  Widget build(BuildContext context) {
    ProviderUser providerUser = Provider.of<ProviderUser>(context);
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 75,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.safeBlockHorizontal * 8,
                        bottom: SizeConfig.safeBlockVertical * 4),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Choose Category",
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 12,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 7,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Color(0xff707070), width: 0.4),
                        borderRadius: BorderRadius.circular(15)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        items: _category.map((String category) {
                          return DropdownMenuItem<String>(
                              value: category, child: Text(category));
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            this._selectedCategory = newValue;
                          });
                        },
                        value: _selectedCategory,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 15,
                  ),
                  TextField(
                    controller: _subCategory,
                    decoration: kTextField.copyWith(labelText: "Sub Category"),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 15,
                  ),
                  TextField(
                    controller: _description,
                    decoration: kTextField.copyWith(hintText: "Description"),
                    maxLines: 5,
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 15,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 8,
                      bottom: SizeConfig.safeBlockVertical * 8,
                      top: SizeConfig.safeBlockVertical * 4,
                    ),
                    child: Text(
                      "Price Range",
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 15,
                      ),
                    ),
                  ),
                  RangeSlider(
                    values: priceRange,
                    onChanged: (RangeValues newValues) {
                      setState(() {
                        priceRange = newValues;
                        priceRangeLabel = RangeLabels(
                          newValues.start.floor().toString(),
                          newValues.end.floor().toString(),
                        );
                        _priceStart.text = newValues.start.floor().toString();
                        _priceEnd.text = newValues.end.floor().toString();
                      });
                    },
                    activeColor: Color(0xff66CCCC),
                    min: 1,
                    max: 15000,
                    divisions: 400,
                    labels: priceRangeLabel,
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 15,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: _priceStart,
                          decoration: kTextField.copyWith(labelText: "Start"),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 10,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _priceEnd,
                          decoration: kTextField.copyWith(labelText: "End"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 70,
                              vertical: SizeConfig.safeBlockVertical * 10),
                          child: FlatButton(
                            color: Color(0xff00B6C7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            onPressed: () async {
                              setState(() {
                                _visibleLoading = true;
                              });

                              _requirementsModel.category = _selectedCategory;
                              _requirementsModel.description =
                                  _description.text;
                              _requirementsModel.endingPrice = _priceEnd.text;
                              _requirementsModel.startingPrice =
                                  _priceStart.text;
                              _requirementsModel.subCategory =
                                  _subCategory.text;
                              _requirementsModel.uid = providerUser.uid;
                              await ApiRequirements()
                                  .postRequirements(_requirementsModel);
                              setState(() {
                                Navigator.pop(context);
                                _visibleLoading = false;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.safeBlockVertical * 5),
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    fontFamily: "Segoe UI",
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 20),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 75,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5.0,
                        color: Colors.black.withOpacity(0.16),
                        spreadRadius: 1),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  )),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Text(
                    "Tell Us Your Requiremnets",
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      fontSize: SizeConfig.safeBlockHorizontal * 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Expanded(flex: 2, child: SizedBox()),
                ],
              ),
            ),
            Radial(),
            Visibility(
              visible: _visibleLoading,
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                color: Colors.black38,
                child: Center(
                  child: Container(
                    height: SizeConfig.safeBlockHorizontal * 120,
                    width: SizeConfig.safeBlockHorizontal * 120,
                    child: FlareActor(
                      "assets/images/loader.flr",
                      animation: "Aura",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const kTextField = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  hintStyle: TextStyle(
    color: Colors.grey,
    fontSize: 17,
  ),
  contentPadding: EdgeInsets.all(15),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(color: Colors.red),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(color: Color(0xff66CCCC), width: 2.0),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(color: Color(0xff66CCCC), width: 2.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(color: Color(0xffC9C9C9), width: 0.5),
  ),
);
