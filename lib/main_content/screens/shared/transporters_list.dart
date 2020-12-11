import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/main_content/components/category_select.dart';
import 'package:smarttextile/main_content/components/top_bar.dart';
import 'package:smarttextile/main_content/models/get_list.dart';
import 'package:smarttextile/main_content/provider/provider_search.dart';
import 'package:smarttextile/main_content/provider/provider_supplier_filter_option.dart';
import 'package:smarttextile/main_content/screens/shared/supplier_search.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';
import 'dart:math';
import 'package:animate_do/animate_do.dart';

class TransportersList extends StatefulWidget {
  @override
  _TransportersListState createState() => _TransportersListState();
}

ProviderSupplierFilterOption providerSupplierFilterOption;
ProviderSearch providerSearch;

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _TransportersListState extends State<TransportersList> {
  var currentPage = images.length - 1.0;
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    providerSupplierFilterOption =
        Provider.of<ProviderSupplierFilterOption>(context);
    providerSearch = Provider.of<ProviderSearch>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff005364), //color[currentPage.toInt()],
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 132,
                  width: double.maxFinite,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Select Transporter Type",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.safeBlockHorizontal * 19,
                        color: Colors.white),
                  ),
                ),
                Expanded(flex: 1, child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    onTap[currentPage.toInt()](context);
                  },
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        SlideInLeft(child: CardScrollWidget(currentPage)),
                        Positioned.fill(
                          child: PageView.builder(
                            itemCount: images.length,
                            controller: controller,
                            reverse: true,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  GestureDetector(child: Container()),
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(flex: 3, child: SizedBox()),
              ],
            ),
            TopBar(),
          ],
        ),
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;
  ProviderSupplierFilterOption providerSupplierFilterOption;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    providerSupplierFilterOption =
        Provider.of<ProviderSupplierFilterOption>(context);
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35.0),
              child: Container(
                decoration:
                    BoxDecoration(color: Colors.transparent, boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(6.0, 0.0),
                    blurRadius: 10.0,
                  ),
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(images[i], fit: BoxFit.fill),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, bottom: 12.0),
                              child: Container(
                                margin: EdgeInsets.only(right: 27),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 6.0),
                                decoration: BoxDecoration(
                                    color: buttonColor[i],
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Text(
                                  title[i],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}

List<String> images = [
  "assets/images/image_05.png",
  "assets/images/image_04.png",
  "assets/images/image_03.png",
  "assets/images/image_02.png",
  "assets/images/image_01.png",
];

List<Function> onTap = [
  (BuildContext context) {
    providerSearch.setFilterList([]);

    providerSupplierFilterOption.clearFilterCity();
    providerSupplierFilterOption.clearFilterSubCategory();
    providerSupplierFilterOption.setRatings(0.0);
    providerSupplierFilterOption
        .setSubCategory(GetList().getEthincWearSubCategoryList().sublist(0, 8));
    providerSupplierFilterOption.setCategoryType("Courier Service");
    providerSupplierFilterOption.setSupplierType("Transporter");
    providerSupplierFilterOption.setCounter(0);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return SupplierSearch();
        },
      ),
    );
  },
  (BuildContext context) {
    providerSearch.setFilterList([]);

    providerSupplierFilterOption.clearFilterCity();
    providerSupplierFilterOption.clearFilterSubCategory();
    providerSupplierFilterOption.setRatings(0.0);
    providerSupplierFilterOption
        .setSubCategory(GetList().getFabricsSubCategoryList().sublist(0, 8));
    providerSupplierFilterOption.setCategoryType("Local Transporter");
    providerSupplierFilterOption.setSupplierType("Transporter");
    providerSupplierFilterOption.setCounter(0);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return SupplierSearch();
        },
      ),
    );
  },
  (BuildContext context) {
    providerSearch.setFilterList([]);

    providerSupplierFilterOption.clearFilterCity();
    providerSupplierFilterOption.clearFilterSubCategory();
    providerSupplierFilterOption.setRatings(0.0);
    providerSupplierFilterOption
        .setSubCategory(GetList().getDressSubCategoryList().sublist(0, 8));
    providerSupplierFilterOption.setCategoryType("Express Service");
    providerSupplierFilterOption.setSupplierType("Transporter");
    providerSupplierFilterOption.setCounter(0);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return SupplierSearch();
        },
      ),
    );
  },
  (BuildContext context) {
    providerSearch.setFilterList([]);
    providerSupplierFilterOption.clearFilterCity();
    providerSupplierFilterOption.clearFilterSubCategory();
    providerSupplierFilterOption.setRatings(0.0);
    providerSupplierFilterOption
        .setSubCategory(GetList().getKurtiSubCategoryList().sublist(0, 8));
    providerSupplierFilterOption.setCategoryType("Shipping Cargo");
    providerSupplierFilterOption.setSupplierType("Transporter");
    providerSupplierFilterOption.setCounter(0);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return SupplierSearch();
        },
      ),
    );
  },
  (BuildContext context) {
    providerSearch.setFilterList([]);

    providerSupplierFilterOption.clearFilterCity();
    providerSupplierFilterOption.clearFilterSubCategory();
    providerSupplierFilterOption.setRatings(0.0);
    providerSupplierFilterOption
        .setSubCategory(GetList().getSareeSubCategoryList().sublist(0, 8));
    providerSupplierFilterOption.setCategoryType("Air Cargo");
    providerSupplierFilterOption.setSupplierType("Transporter");
    providerSupplierFilterOption.setCounter(0);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return SupplierSearch();
        },
      ),
    );
  }
];

List<Color> color = [
  Color(0xffF2FE52).withOpacity(0.4),
  Color(0xff9EC5FF).withOpacity(0.4),
  Color(0xffFB3F3F).withOpacity(0.4),
  Color(0xffF2FE52).withOpacity(0.4),
  Color(0xff9EC5FF).withOpacity(0.4),
];

List<Color> buttonColor = [
  Color(0xff00B6C7),
  Color(0xff3F3D56),
  Color(0xff71BDC3),
  Color(0xff00B6C7),
  Color(0xff3F3D56),
];

List<String> title = [
  "Local Transporter",
  "Courier Service",
  "Express Service",
  "Shipping Cargo",
  "Air Cargo"
];
