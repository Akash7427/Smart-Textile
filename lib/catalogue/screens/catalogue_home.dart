import 'package:flutter/material.dart';
import 'package:smarttextile/Chat/screens/chat_home_screen.dart';
import 'package:smarttextile/Chat/screens/pageviews/chat_list_screen.dart';
import 'package:smarttextile/catalogue/screens/catalogue.dart';
import 'package:smarttextile/catalogue/services/ApiCatalogue.dart';
import 'package:smarttextile/main_content/components/radial.dart';
import 'package:smarttextile/shared/provider_user.dart';
import 'package:smarttextile/shared/size_config.dart';
import 'catalogue_info.dart';

class CatalogueHome extends StatefulWidget {
  final ProviderUser providerUser;

  const CatalogueHome({Key key, this.providerUser}) : super(key: key);
  @override
  _CatalogueHomeState createState() => _CatalogueHomeState();
}



class _CatalogueHomeState extends State<CatalogueHome> {


  List<Catalogue> cataloguelist = List();
  Future getcataloguelist() async{
    cataloguelist = await ApiCatalogue().getAllCataloguelist(widget.providerUser.uid);
    setState(() {
      
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcataloguelist();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(children: <Widget>[
          ListView(
            children: <Widget>[
              Column(children: <Widget>[
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
                  child: Center(
                    child: Text(
                      "Catalogue",
                      style: TextStyle(
                        fontFamily: "Segoe UI",
                        fontSize: SizeConfig.safeBlockHorizontal * 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeHorizontal*15,),
                cataloguelist != null
                ?Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                                  child: ListView.builder(
                    itemCount: cataloguelist.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              SizeConfig.blockSizeHorizontal *
                                  15.0,
                          vertical:
                              SizeConfig.safeBlockVertical * 7,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical:
                                SizeConfig.safeBlockVertical *
                                    5,
                            horizontal:
                                SizeConfig.safeBlockHorizontal *
                                    3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                             borderRadius:
                              BorderRadius.circular(SizeConfig.safeBlockVertical*12),
                              boxShadow: [BoxShadow(
                                color: Colors.black.withOpacity(0.16),
                                offset: Offset(0, SizeConfig.safeBlockVertical*2.5),
                                blurRadius: SizeConfig.safeBlockVertical*5
                              ),]
                          ),
                          child: Row(
                            children: <Widget>[
                              Column(children: <Widget>[
                                Text("Catalogue Name : ${cataloguelist[index].name}",
                                style: TextStyle(
                                  color:Colors.black,
                                  fontSize:SizeConfig.safeBlockHorizontal*20
                                ),),
                                Text("Catalogue Category : ${cataloguelist[index].category}",
                                style: TextStyle(
                                  color:Colors.black,
                                  fontSize:SizeConfig.safeBlockHorizontal*20
                                ),),
                                Text("Catalogue Code : ${cataloguelist[index].code}",
                                style: TextStyle(
                                  color:Colors.black,
                                  fontSize:SizeConfig.safeBlockHorizontal*20
                                ),),
                                
                              ],),
                              SizedBox(width: SizeConfig.blockSizeVertical*5,),
                              Container(
                                height: SizeConfig.blockSizeHorizontal*30,
                                width: SizeConfig.blockSizeVertical*1,
                                color: Colors.grey,
                              ),
                              SizedBox(width: SizeConfig.blockSizeVertical*5,),
                              IconButton(icon: Icon(Icons.share),onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatHomeScreen()));
                              },)
                            ],
                          ),
                        ),
                      );
                    }
                    ),
                )
                :SizedBox()


              ],),
            ],
          ),
          Radial()
        ],),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return CatalogueInfo();
            }));
          },
          child: Icon(
            Icons.note_add,
          ),
          backgroundColor: Color(0xff62B9BF),
        ),
      ),
    );
  }
}