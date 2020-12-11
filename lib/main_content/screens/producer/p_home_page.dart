import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/catalogue/screens/catalogue_list.dart';
import 'package:smarttextile/main_content/provider/set_screen.dart';
import 'package:smarttextile/main_content/screens/producer/producer_dashboard.dart';
import 'package:smarttextile/main_content/screens/shared/global_markets.dart';
import 'package:smarttextile/main_content/screens/shared/policy.dart';
import 'package:smarttextile/main_content/screens/shared/prediction.dart';
import 'package:smarttextile/main_content/screens/shared/products/productsList.dart';
import 'package:smarttextile/main_content/screens/shared/retailers_list.dart';
import 'package:smarttextile/main_content/screens/shared/tax_consultants_list.dart';
import 'package:smarttextile/main_content/screens/shared/transporters_list.dart';
import 'package:smarttextile/main_content/screens/shared/wholesalers_list.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';

class PHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var setscreen = Provider.of<SetScreen>(context);
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff9599B3),
        body: setscreen.index == 1
            ? ProducerDashboard()
            : setscreen.index == 3
                ? Prediction()
                : setscreen.index == 4
                    ? WholesalersList()
                    : setscreen.index == 5
                        ? RetailersList()
                        : setscreen.index == 6
                            ? TransportersList()
                            : setscreen.index == 7
                                ? TaxConsultantsList()
                                : setscreen.index == 8
                                    ? ProductsList()
                                    : setscreen.index == 10
                                        ? Policy()
                                        : setscreen.index == 11
                                          ? CatalogueSearch()
                                          : GlobalMarkets(),

      ),
    );
  }
}
