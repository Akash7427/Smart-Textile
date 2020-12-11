import 'package:provider/provider.dart';
import 'package:smarttextile/Business/Invoice/size_config.dart';
import 'package:smarttextile/Business/Main/dashboard.dart';
import 'package:smarttextile/Business/manage_product/product.dart';
import 'package:smarttextile/Business/manage_product/screens/add_product.dart';
import 'package:smarttextile/Business/manage_product/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:smarttextile/main_content/components/radial.dart';
import 'package:smarttextile/shared/provider_user.dart';
import 'package:flare_flutter/flare_actor.dart';

class Manage extends StatefulWidget {
  @override
  _ManageState createState() => _ManageState();
}

class _ManageState extends State<Manage> {

  
  bool _visibleError = false;
  bool _loadingVisible = false;

  @override
  Widget build(BuildContext context) {
    ProviderUser providerUser = Provider.of<ProviderUser>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.blockSizeHorizontal * 15,
                ),
                Container(
                  height: SizeConfig.blockSizeHorizontal * 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff000000).withOpacity(0.3),
                            blurRadius: 2,
                            offset: Offset(0, 2))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ManageBusinessDashboard(),
                            ),
                          );
                        },
                      ),
                      Spacer(
                        flex: 3,
                      ),
                      Text(
                        "Product",
                        style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 20,
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(
                        flex: 4,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeHorizontal * 15,
                ),
                CategoryList(
                  providerUser: providerUser,
                ),
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
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddProduct()));
          },
          child: Icon(Icons.add_shopping_cart),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}

class CategoryList extends StatefulWidget {
  final ProviderUser providerUser;
  CategoryList({@required this.providerUser});
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  // by default first item will be selected
  double kDefaultPadding = SizeConfig.blockSizeHorizontal * 20;
  int selectedIndex = 0;
  List categories = [
    'Saree',
    'Kurti',
    'Fabric',
    'Dress',
    'Ethnic Wear',
    'Apperal and Garment'
  ];

  List<Product> productSareeList = List();
  List<Product> productKurtiList = List();
  List<Product> productFabricList = List();
  List<Product> productDressList = List();
  List<Product> productEthnicList = List();
  List<Product> productApperalList = List();
  Future getSareeProduct() async {
    productSareeList =
        await ApiService().getAllUserSareeProduct(widget.providerUser.uid);
    setState(() {});
  }

  Future getKurtiProduct() async {
    productKurtiList =
        await ApiService().getAllUserKurtiProduct(widget.providerUser.uid);
    setState(() {});
  }

  Future getFabricProduct() async {
    productFabricList =
        await ApiService().getAllUserFabricProduct(widget.providerUser.uid);
    setState(() {});
  }

  Future getDressProduct() async {
    productDressList =
        await ApiService().getAllUserDressProduct(widget.providerUser.uid);
    setState(() {});
  }

  Future getEthnicProduct() async {
    productEthnicList =
        await ApiService().getAllUserEthnicWearProduct(widget.providerUser.uid);
    setState(() {});
  }

  Future getApperalProduct() async {
    productApperalList =
        await ApiService().getAllUserApperalProduct(widget.providerUser.uid);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSareeProduct();
    getKurtiProduct();
    getFabricProduct();
    getDressProduct();
    getEthnicProduct();
    getApperalProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          height: SizeConfig.blockSizeHorizontal * 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: kDefaultPadding,
                  // At end item it add extra 20 right  padding
                  right: index == categories.length - 1 ? kDefaultPadding : 0,
                ),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                decoration: BoxDecoration(
                  color: index == selectedIndex
                      ? Colors.blue.withOpacity(0.4)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  categories[index],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Segoe UI",
                      fontSize: SizeConfig.blockSizeHorizontal * 18),
                ),
              ),
            ),
          ),
        ),
        selectedIndex == 0
            ? productSareeList != null
                ? ManageProductContainer(productSareeList: productSareeList)
                : Column(
                    children: <Widget>[
                      SizedBox(
                        height: SizeConfig.blockSizeHorizontal * 50,
                      ),
                      Text(
                        "No Product Listed Here",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.blockSizeHorizontal * 19),
                      ),
                      Container(
                        height: SizeConfig.blockSizeHorizontal * 300,
                        width: SizeConfig.blockSizeVertical * 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/business/noproduct.png"),
                          ),
                        ),
                      ),
                    ],
                  )
            : Container(),
        selectedIndex == 1
            ? productKurtiList != null
                ? ManageProductContainer(productSareeList: productKurtiList)
                : Column(
                    children: <Widget>[
                      SizedBox(
                        height: SizeConfig.blockSizeHorizontal * 50,
                      ),
                      Text(
                        "No Product Listed Here",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.blockSizeHorizontal * 19),
                      ),
                      Container(
                        height: SizeConfig.blockSizeHorizontal * 300,
                        width: SizeConfig.blockSizeVertical * 300,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/business/noproduct.png"))),
                      ),
                    ],
                  )
            : Container(),
        selectedIndex == 2
            ? productFabricList != null
                ? ManageProductContainer(productSareeList: productFabricList)
                : Column(
                    children: <Widget>[
                      SizedBox(
                        height: SizeConfig.blockSizeHorizontal * 50,
                      ),
                      Text(
                        "No Product Listed Here",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.blockSizeHorizontal * 19),
                      ),
                      Container(
                        height: SizeConfig.blockSizeHorizontal * 300,
                        width: SizeConfig.blockSizeVertical * 300,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/business/noproduct.png"))),
                      ),
                    ],
                  )
            : Container(),
        selectedIndex == 3
            ? productDressList != null
                ? ManageProductContainer(productSareeList: productDressList)
                : Column(
                    children: <Widget>[
                      SizedBox(
                        height: SizeConfig.blockSizeHorizontal * 50,
                      ),
                      Text(
                        "No Product Listed Here",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.blockSizeHorizontal * 19),
                      ),
                      Container(
                        height: SizeConfig.blockSizeHorizontal * 300,
                        width: SizeConfig.blockSizeVertical * 300,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/business/noproduct.png"))),
                      ),
                    ],
                  )
            : Container(),
        selectedIndex == 4
            ? productEthnicList != null
                ? ManageProductContainer(productSareeList: productEthnicList)
                : Column(
                    children: <Widget>[
                      SizedBox(
                        height: SizeConfig.blockSizeHorizontal * 50,
                      ),
                      Text(
                        "No Product Listed Here",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.blockSizeHorizontal * 19),
                      ),
                      Container(
                        height: SizeConfig.blockSizeHorizontal * 300,
                        width: SizeConfig.blockSizeVertical * 300,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/business/noproduct.png"))),
                      ),
                    ],
                  )
            : Container(),
        selectedIndex == 5
            ? productApperalList != null
                ? ManageProductContainer(productSareeList: productApperalList)
                : Column(
                    children: <Widget>[
                      SizedBox(
                        height: SizeConfig.blockSizeHorizontal * 50,
                      ),
                      Text(
                        "No Product Listed Here",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.blockSizeHorizontal * 19),
                      ),
                      Container(
                        height: SizeConfig.blockSizeHorizontal * 300,
                        width: SizeConfig.blockSizeVertical * 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/business/noproduct.png"),
                          ),
                        ),
                      ),
                    ],
                  )
            : Container(),
      ],
    );
  }
}

class ManageProductContainer extends StatelessWidget {
  const ManageProductContainer({
    Key key,
    @required this.productSareeList,
  }) : super(key: key);

  final List<Product> productSareeList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      color: Colors.white,
      child: ListView.builder(
          itemCount: productSareeList.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Padding(
              padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 8.0),
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeVertical * 5.0),
                      child: Container(
                        height: SizeConfig.blockSizeHorizontal * 80,
                        width: SizeConfig.blockSizeVertical * 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                                image:
                                    productSareeList[index].primaryImg != null
                                        ? NetworkImage(
                                            productSareeList[index].primaryImg)
                                        : AssetImage("assets/images/logo.png"),
                                )),
                      ),
                    ),
                    SizedBox(width: SizeConfig.blockSizeHorizontal*5,),
                    Container(
                      height: SizeConfig.blockSizeHorizontal * 50,
                      width: SizeConfig.blockSizeVertical * 1,
                      color: Colors.grey,
                    ),
                    SizedBox(width: SizeConfig.blockSizeVertical * 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal * 5,
                        ),
                        FittedBox(
                          child: Text(
                            "Category : ${productSareeList[index].category}",
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 15,
                                fontFamily: "Segoe UI"),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal * 5,
                        ),
                        Container(
                          width: SizeConfig.safeBlockHorizontal * 190,
                          child: Text(
                            "Sub Category : ${productSareeList[index].subCategory}",
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 15,
                                fontFamily: "Segoe UI"),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal * 5,
                        ),
                        FittedBox(
                          child: Text(
                            "Price : ${productSareeList[index].mrp}",
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 15,
                                fontFamily: "Segoe UI"),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal * 5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
