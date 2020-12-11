import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smarttextile/Business/manage_product/product.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/main_content/components/single_supplier_list_container.dart';
import 'package:smarttextile/main_content/components/supplier_shimmer.dart';
import 'package:smarttextile/main_content/screens/shared/single_supplier_detail_page.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';
import 'package:smarttextile/shared/provider_user.dart';
import 'package:smarttextile/main_content/services/api_favrouite.dart';

class FavUsers extends StatefulWidget {
  final ProviderUser providerUser;
  FavUsers({@required this.providerUser});
  @override
  _FavUsersState createState() => _FavUsersState();
}

class _FavUsersState extends State<FavUsers> {
  void getData() async {
    if (widget.providerUser.favouriteUsers.length == 0) {
      userAvailable = false;
    } else {
      favUsers =
          await ApiFavourite().getFavUsers(widget.providerUser.favouriteUsers);
    }
    setState(() {});
  }

  bool userAvailable = true;
  List<User> favUsers = List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.safeBlockVertical * 100,
      child: userAvailable == true
          ? favUsers.length == 0
              ? ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                        baseColor: Colors.grey[300],
                        highlightColor: Colors.grey[100],
                        child: SupplierShimmer());
                  })
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: favUsers.length,
                  itemBuilder: (context, index) {
                    return FadeInLeft(
                      duration: Duration(milliseconds: 500),
                      delay: Duration(milliseconds: index * 50),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return SingleSupplierDetailPage(
                              supplier: favUsers[index],
                            );
                          }));
                        },
                        child: SingleSupplierListContainer(
                          supplier: favUsers[index],
                          companyName: favUsers[index].companyName,
                          city: favUsers[index].city,
                          state: favUsers[index].state,
                          ratings: favUsers[index].rating,
                          imageUrl: favUsers[index].logo,
                        ),
                      ),
                    );
                  })
          : SvgPicture.asset("assets/images/svg/empty.svg"),
      width: SizeConfig.safeBlockHorizontal * 280,
    );
  }
}
