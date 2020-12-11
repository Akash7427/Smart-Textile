import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/catalogue/screens/catalogue.dart';
import 'package:smarttextile/catalogue/screens/catalogue_home.dart';
import 'package:smarttextile/catalogue/services/ApiCatalogue.dart';
import 'package:smarttextile/shared/provider_user.dart';
import 'package:smarttextile/shared/size_config.dart';

import 'package:path/path.dart' as p;
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';

class CatalogueInfo extends StatefulWidget {
  @override
  _CatalogueInfoState createState() => _CatalogueInfoState();
}

class _CatalogueInfoState extends State<CatalogueInfo> {
  var name = TextEditingController();
  var productcode = TextEditingController();
  var category = TextEditingController();

  List<String> _public = ['Public', 'Only Connections']; // Option 2
  String _selectedpublic;

  documentImage() async {
    File selectedFile = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    return selectedFile;
  }

  static final Firestore firestore = Firestore.instance;

  StorageReference _storageReference;

  Future<String> uploadDocumnetToStorage(File documentfile) async {
    // mention try catch later on

    try {
      String filename1 = p.basename(documentfile.path);
      _storageReference =
          FirebaseStorage.instance.ref().child("catalogues/${filename1}");
      final StorageUploadTask uploadTask =
          _storageReference.putFile(documentfile);
      final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
      final String url = (await downloadUrl.ref.getDownloadURL());
      //print(url);
      return url;
    } catch (e) {
      return null;
    }
  }

  File filename;

  Catalogue catalogue = Catalogue();

 

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ProviderUser providerUser = Provider.of<ProviderUser>(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 35,
                          ),
                          Text(
                            "Catalogue Info",
                            style: TextStyle(
                              fontFamily: "Segoe UI",
                              fontSize: SizeConfig.safeBlockHorizontal * 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeVertical * 12.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Catalogue Name",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.safeBlockHorizontal * 15,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 12,
                          vertical: SizeConfig.blockSizeVertical * 12),
                      child: TextFormField(
                        validator: (value) {
                          return value.trim().length >= 3
                              ? null
                              : "Enter a valid Catalogue Name";
                        },
                        controller: name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          hintText: "Catalogue Name",
                          hintStyle: TextStyle(
                              color: Color(0xff646464),
                              fontSize: SizeConfig.safeBlockHorizontal * 10,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w400),
                          contentPadding: const EdgeInsets.only(left: 10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeVertical * 12.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Catalogue Category",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.safeBlockHorizontal * 15,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 12,
                          vertical: SizeConfig.blockSizeVertical * 12),
                      child: TextFormField(
                        validator: (value) {
                          return value.trim().length >= 3
                              ? null
                              : "Enter a valid Catalogue Category";
                        },
                        controller: category,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          hintText: "Catalogue Category",
                          hintStyle: TextStyle(
                              color: Color(0xff646464),
                              fontSize: SizeConfig.safeBlockHorizontal * 10,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w400),
                          contentPadding: const EdgeInsets.only(left: 10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeVertical * 12.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Catalogue Product Code",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.safeBlockHorizontal * 15,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 12,
                          vertical: SizeConfig.blockSizeVertical * 12),
                      child: TextFormField(
                        validator: (value) {
                          return value.trim().length >= 3
                              ? null
                              : "Enter a valid Catalogue Product Code";
                        },
                        controller: productcode,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          hintText: "Catalogue Category",
                          hintStyle: TextStyle(
                              color: Color(0xff646464),
                              fontSize: SizeConfig.safeBlockHorizontal * 10,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w400),
                          contentPadding: const EdgeInsets.only(left: 10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeVertical * 12.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Visiblity Type",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.safeBlockHorizontal * 15,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 12,
                          vertical: SizeConfig.blockSizeVertical * 12),
                      child: Container(
                        width: SizeConfig.safeBlockVertical * 320,
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeBlockHorizontal * 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 0.80),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            hint: Text('Please choose a Visiblity type'),
                            value: _selectedpublic,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedpublic = newValue;
                              });
                            },
                            items: _public.map((public) {
                              return DropdownMenuItem(
                                child: new Text(public),
                                value: public,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    Center(
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
                            String url =
                                await uploadDocumnetToStorage(filename);
                            catalogue.code = productcode.text.trim();
                            catalogue.name = name.text.trim();
                            catalogue.category = category.text.trim();
                            catalogue.pdf = url;
                            catalogue.userId = providerUser.uid;
                            if (_selectedpublic == "Public") {
                              catalogue.public = true;
                            } else {
                              catalogue.public = false;
                            }
                            DateTime now = DateTime.now();
                            String formattedDate =
                                DateFormat('kk:mm:ssEEEdMMM').format(now);
                            String id = providerUser.uid + formattedDate;
                            await ApiCatalogue().uploadcatalogue(catalogue, id);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CatalogueHome()));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.safeBlockVertical * 5),
                            child: Text(
                              "Save Changes",
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
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            filename = await documentImage();
            FlutterToast.showToast(msg: "File Uploaded Successfully");
          },
          child: Icon(
            Icons.add,
          ),
          backgroundColor: Color(0xff62B9BF),
        ),
      ),
    );
  }
}
