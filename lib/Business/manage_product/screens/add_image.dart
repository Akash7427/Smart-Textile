import 'dart:io';
import 'package:provider/provider.dart';
import 'package:smarttextile/Business/Main/manage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:smarttextile/Business/manage_product/product.dart';
import 'package:smarttextile/Business/manage_product/screens/grey_header.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smarttextile/Business/manage_product/screens/size_config.dart';
import 'package:smarttextile/Business/manage_product/services/api_service.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as Path;
import 'package:smarttextile/main_content/components/radial.dart';
import 'package:smarttextile/shared/provider_user.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flare_flutter/flare_actor.dart';

class AddImage extends StatefulWidget {
  final Product product;

  const AddImage({Key key, this.product}) : super(key: key);

  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  Product product;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    product = widget.product;
  }

  bool _visibleError = false;
  bool _loadingVisible = false;

  File _image, _image1, _image2, _image3, _image4;
  String _uploadedFileURL,
      _uploadedFileURL1,
      _uploadedFileURL2,
      _uploadedFileURL3,
      _uploadedFileURL4;

  List<String> secImg = List();

  Future chooseFile() async {
    // ignore: deprecated_member_use
    if (_image == null) {
      // ignore: deprecated_member_use
      try {
        // ignore: deprecated_member_use
        await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
          setState(() {
            _image = image;
          });
        });
      } catch (e) {
        print(e);
      }
    }
  }

  Future chooseFile1() async {
    // ignore: deprecated_member_use
    if (_image1 == null) {
      // ignore: deprecated_member_use
      try {
        // ignore: deprecated_member_use
        await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
          setState(() {
            _image1 = image;
          });
        });
      } catch (e) {
        print(e);
      }
    }
  }

  Future chooseFile2() async {
    // ignore: deprecated_member_use
    if (_image2 == null) {
      // ignore: deprecated_member_use
      try {
        // ignore: deprecated_member_use
        await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
          setState(() {
            _image2 = image;
          });
        });
      } catch (e) {
        print(e);
      }
    }
  }

  Future chooseFile3() async {
    // ignore: deprecated_member_use
    if (_image3 == null) {
      // ignore: deprecated_member_use
      try {
        // ignore: deprecated_member_use
        await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
          setState(() {
            _image3 = image;
          });
        });
      } catch (e) {
        print(e);
      }
    }
  }

  Future chooseFile4() async {
    // ignore: deprecated_member_use
    if (_image4 == null) {
      // ignore: deprecated_member_use
      try {
        // ignore: deprecated_member_use
        await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
          setState(() {
            _image4 = image;
          });
        });
      } catch (e) {
        print(e);
      }
    }
  }

  void clearSelection() {
    setState(() {
      _image = null;
      _uploadedFileURL = null;
    });
  }

  void clearSelection1() {
    setState(() {
      _image1 = null;
      _uploadedFileURL1 = null;
    });
  }

  void clearSelection2() {
    setState(() {
      _image2 = null;
      _uploadedFileURL2 = null;
    });
  }

  void clearSelection3() {
    setState(() {
      _image3 = null;
      _uploadedFileURL3 = null;
    });
  }

  void clearSelection4() {
    setState(() {
      _image4 = null;
      _uploadedFileURL4 = null;
    });
  }

  List<String> basenameList = List();

  Future uploadFile() async {
    if (_image != null) {
      String basename = Path.basename(_image.path);
      if (!basenameList.contains(basename)) {
        basenameList.add(basename);
      }
      StorageReference storageReference = FirebaseStorage.instance.ref().child(
          'product_category/sub_category/primary/${Path.basename(_image.path)}}');
      StorageUploadTask uploadTask = storageReference.putFile(_image);
      await uploadTask.onComplete;
      print('File Uploaded');
      storageReference.getDownloadURL().then((fileURL) {
        print(fileURL);
        setState(() {
          _uploadedFileURL = fileURL;
          product.primaryImg = _uploadedFileURL;
        });
      });
    }
  }

  Future uploadFile1() async {
    
    if (_image1 != null) {
      String basename = Path.basename(_image1.path);
      if (!basenameList.contains(basename)) {
        basenameList.add(basename);
      }
      StorageReference storageReference = FirebaseStorage.instance.ref().child(
          'product_category/sub_category/secondary/${Path.basename(_image1.path)}}');
      StorageUploadTask uploadTask = storageReference.putFile(_image1);
      await uploadTask.onComplete;
      print('File Uploaded');
      storageReference.getDownloadURL().then((fileURL) {
        setState(() {
          _uploadedFileURL1 = fileURL;
          secImg.add(_uploadedFileURL1);
          // product.secondaryImg.add(_uploadedFileURL1);
        });
      });
    }
  }

  Future uploadFile2() async {
    if (_image2 != null) {
      String basename = Path.basename(_image2.path);
      if (!basenameList.contains(basename)) {
        basenameList.add(basename);
      }
      StorageReference storageReference = FirebaseStorage.instance.ref().child(
          'product_category/sub_category/secondary/${Path.basename(_image2.path)}');
      StorageUploadTask uploadTask = storageReference.putFile(_image2);
      await uploadTask.onComplete;
      print('File Uploaded');
      storageReference.getDownloadURL().then((fileURL) {
        setState(() {
          _uploadedFileURL2 = fileURL;
          secImg.add(_uploadedFileURL2);
        });
      });
    }
  }

  Future uploadFile3() async {
    if (_image3 != null) {
      String basename = Path.basename(_image3.path);
      if (!basenameList.contains(basename)) {
        basenameList.add(basename);
      }
      StorageReference storageReference = FirebaseStorage.instance.ref().child(
          'product_category/sub_category/secondary/${Path.basename(_image3.path)}}');
      StorageUploadTask uploadTask = storageReference.putFile(_image3);
      await uploadTask.onComplete;
      print('File Uploaded');
      storageReference.getDownloadURL().then((fileURL) {
        setState(() {
          _uploadedFileURL3 = fileURL;
          secImg.add(_uploadedFileURL3);
        });
      });
    }
  }

  Future uploadFile4() async {
    if (_image4 != null) {
      String basename = Path.basename(_image4.path);
      if (!basenameList.contains(basename)) {
        basenameList.add(basename);
      }
      StorageReference storageReference = FirebaseStorage.instance.ref().child(
          'product_category/sub_category/secondary/${Path.basename(_image4.path)}}');
      StorageUploadTask uploadTask = storageReference.putFile(_image4);
      await uploadTask.onComplete;
      print('File Uploaded');
      storageReference.getDownloadURL().then((fileURL) {
        setState(() {
          _uploadedFileURL4 = fileURL;
          secImg.add(_uploadedFileURL4);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ProviderUser providerUser = Provider.of<ProviderUser>(context);
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              SizedBox(
                height: SizeConfig.safeBlockHorizontal * 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: GreyHeader(name: "Add Photo"),
              ),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal * 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Primary Image",
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 15,
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w400),
                    )),
              ),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal * 15,
              ),
              buildCenter(),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal * 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Secondary Image",
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 15,
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w400),
                    )),
              ),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal * 15,
              ),
              Container(
                height: SizeConfig.safeBlockHorizontal * 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    buildContainer1(),
                    _image1 != null
                        ? buildContainer2()
                        : _image2 != null ? buildContainer2() : Container(),
                    _image2 != null
                        ? buildContainer3()
                        : _image3 != null ? buildContainer3() : Container(),
                    _image3 != null
                        ? buildContainer4()
                        : _image4 != null ? buildContainer4() : Container(),
                  ],
                ),
              ),
              _image1 != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 80.0, right: 80.0),
                      child: RaisedButton(
                        color: Colors.blueAccent,
                        child: Text('Clear Selection'),
                        onPressed: () {
                          clearSelection1();
                          clearSelection2();
                          clearSelection3();
                          clearSelection4();
                        },
                      ),
                    )
                  : Container(),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal * 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 120, right: 120, bottom: 30),
                child: Container(
                  height: SizeConfig.safeBlockHorizontal * 40,
                  decoration: BoxDecoration(
                      color: Color(0xff00B6C7),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Center(
                      child: GestureDetector(
                    onTap: () async {

                      setState(() {
                        _loadingVisible = true;
                      });
                      print(product.name);
                      if (_image != null) {
                        await uploadFile();
                      }

                      if (_image1 != null) {
                        await uploadFile1();
                      }

                      if (_image2 != null) {
                        await uploadFile2();
                      }

                      if (_image3 != null) {
                        await uploadFile3();
                      }

                      if (_image4 != null) {
                        await uploadFile4();
                      }
                      product.images=basenameList;
                      product.secondaryImg = secImg;
                      
                      print(product.secondaryImg);
                      DateTime now = DateTime.now();
                      String formattedDate =
                          DateFormat('kk:mm:ssEEEdMMM').format(now);
                      String sellerid = providerUser.uid;
                      String id = sellerid + formattedDate;
                      print(id);
                      product.sellerName = providerUser.companyName;
                      product.sellerAddress = providerUser.address +
                          "," +
                          providerUser.city +
                          "," +
                          providerUser.pincode;
                      await ApiService()
                          .uploadProduct(product, id, providerUser.uid);
                      clearSelection();
                      clearSelection1();
                      clearSelection2();
                      clearSelection3();
                      clearSelection4();
                      product.primaryImg = null;
                      secImg = [];
                      print(secImg);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Manage()));
                      _loadingVisible = false;
                    },
                    child: Text(
                      "Save Product",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.safeBlockHorizontal * 15,
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w500),
                    ),
                  )),
                ),
              )
            ],
          ),
          Radial(),
          Visibility(
              visible: _loadingVisible,
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
      )),
    );
  }

  Center buildCenter() {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            _image != null
                ? Container(
                    height: SizeConfig.safeBlockHorizontal * 150,
                    width: SizeConfig.safeBlockVertical * 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:FileImage(_image),
                        fit: BoxFit.fill,
                      ),
                      color: Colors.white,
                      border: Border.all(),
                      boxShadow: [
                        BoxShadow(color: Color(0xff17B8FF), blurRadius: 2)
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      chooseFile();
                    },
                    child: Container(
                      height: SizeConfig.safeBlockHorizontal * 150,
                      width: SizeConfig.safeBlockVertical * 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/business/image1.png')),
                          color: Colors.white,
                          border: Border.all(),
                          boxShadow: [
                            BoxShadow(color: Color(0xff17B8FF), blurRadius: 2)
                          ]),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Add Image",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w400),
                              )),
                        ),
                      ),
                    ),
                  ),
            Row(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 50,
                  width: SizeConfig.safeBlockVertical * 75,
                ),
                SizedBox(
                  width: SizeConfig.safeBlockVertical * 40,
                ),
                _image != null
                    ? RaisedButton(
                        color: Colors.blueAccent,
                        child: Text('Clear Selection'),
                        onPressed: () {
                          clearSelection();
                        },
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainer1() {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: _image1 != null
                ? Container(
                    height: SizeConfig.safeBlockHorizontal * 150,
                    width: SizeConfig.safeBlockVertical * 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:FileImage(_image1), fit: BoxFit.fill),
                        color: Colors.white,
                        border: Border.all(),
                        boxShadow: [
                          BoxShadow(color: Color(0xff17B8FF), blurRadius: 2)
                        ]),
                  )
                : InkWell(
                    onTap: () {
                      chooseFile1();
                    },
                    child: Container(
                      height: SizeConfig.safeBlockHorizontal * 150,
                      width: SizeConfig.safeBlockVertical * 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/business/image1.png')),
                          color: Colors.white,
                          border: Border.all(),
                          boxShadow: [
                            BoxShadow(color: Color(0xff17B8FF), blurRadius: 2)
                          ]),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Add Image",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 14,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w400),
                              )),
                        ),
                      ),
                    ),
                  ),
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: SizeConfig.safeBlockVertical * 5,
              ),
              _image1 != null
                  ? RaisedButton(
                      color: Colors.blueAccent,
                      child: Text('Clear Selection'),
                      onPressed: () {
                        clearSelection1();
                      },
                    )
                  : Container(),
            ],
          )
        ],
      ),
    );
  }

  Container buildContainer2() {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: _image2 != null
                ? Container(
                    height: SizeConfig.safeBlockHorizontal * 150,
                    width: SizeConfig.safeBlockVertical * 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:FileImage(_image2), fit: BoxFit.fill),
                        color: Colors.white,
                        border: Border.all(),
                        boxShadow: [
                          BoxShadow(color: Color(0xff17B8FF), blurRadius: 2)
                        ]),
                  )
                : InkWell(
                    onTap: () {
                      chooseFile2();
                    },
                    child: Container(
                      height: SizeConfig.safeBlockHorizontal * 150,
                      width: SizeConfig.safeBlockVertical * 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/business/image1.png')),
                          color: Colors.white,
                          border: Border.all(),
                          boxShadow: [
                            BoxShadow(color: Color(0xff17B8FF), blurRadius: 2)
                          ]),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Add Image",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 14,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w400),
                              )),
                        ),
                      ),
                    ),
                  ),
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: SizeConfig.safeBlockVertical * 5,
              ),
              _image2 != null
                  ? RaisedButton(
                      color: Colors.blueAccent,
                      child: Text('Clear Selection'),
                      onPressed: () {
                        clearSelection2();
                      },
                    )
                  : Container(),
            ],
          )
        ],
      ),
    );
  }

  Container buildContainer3() {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: _image3 != null
                ? Container(
                    height: SizeConfig.safeBlockHorizontal * 150,
                    width: SizeConfig.safeBlockVertical * 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:FileImage(_image3), fit: BoxFit.fill),
                        color: Colors.white,
                        border: Border.all(),
                        boxShadow: [
                          BoxShadow(color: Color(0xff17B8FF), blurRadius: 2)
                        ]),
                  )
                : InkWell(
                    onTap: () {
                      chooseFile3();
                    },
                    child: Container(
                      height: SizeConfig.safeBlockHorizontal * 150,
                      width: SizeConfig.safeBlockVertical * 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/business/image1.png')),
                          color: Colors.white,
                          border: Border.all(),
                          boxShadow: [
                            BoxShadow(color: Color(0xff17B8FF), blurRadius: 2)
                          ]),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Add Image",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 14,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w400),
                              )),
                        ),
                      ),
                    ),
                  ),
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: SizeConfig.safeBlockVertical * 5,
              ),
              _image3 != null
                  ? RaisedButton(
                      color: Colors.blueAccent,
                      child: Text('Clear Selection'),
                      onPressed: () {
                        clearSelection3();
                      },
                    )
                  : Container(),
            ],
          )
        ],
      ),
    );
  }

  Container buildContainer4() {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: _image4 != null
                ? Container(
                    height: SizeConfig.safeBlockHorizontal * 150,
                    width: SizeConfig.safeBlockVertical * 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:FileImage(_image4), fit: BoxFit.fill),
                        color: Colors.white,
                        border: Border.all(),
                        boxShadow: [
                          BoxShadow(color: Color(0xff17B8FF), blurRadius: 2)
                        ]),
                  )
                : InkWell(
                    onTap: () {
                      chooseFile4();
                    },
                    child: Container(
                      height: SizeConfig.safeBlockHorizontal * 150,
                      width: SizeConfig.safeBlockVertical * 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/business/image1.png')),
                          color: Colors.white,
                          border: Border.all(),
                          boxShadow: [
                            BoxShadow(color: Color(0xff17B8FF), blurRadius: 2)
                          ]),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Add Image",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 14,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w400),
                              )),
                        ),
                      ),
                    ),
                  ),
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: SizeConfig.safeBlockVertical * 5,
              ),
              _image4 != null
                  ? RaisedButton(
                      color: Colors.blueAccent,
                      child: Text('Clear Selection'),
                      onPressed: () {
                        clearSelection4();
                      },
                    )
                  : Container(),
            ],
          )
        ],
      ),
    );
  }
}
