import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smarttextile/Business/Invoice/invoice.dart';
import 'package:smarttextile/Transporter/screens/driverassign.dart';
import 'package:smarttextile/Transporter/screens/transporter_driver.dart';
import 'package:smarttextile/Transporter/services/transporter_services.dart';
import 'package:smarttextile/Transporter/shared/size_config.dart';
import 'package:smarttextile/shared/provider_user.dart';

class DeliveryDetails extends StatefulWidget {
  final ProviderUser providerUser;

  const DeliveryDetails({Key key, this.providerUser}) : super(key: key);
  @override
  _DeliveryDetailsState createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  int _selectedStatus = 1;

  List<Invoice> pendingList = List();
  Future getPending() async {
    pendingList =
        await TransporterService().getAllPending(widget.providerUser.uid);
    setState(() {});
  }

  List<Invoice> inprogressList = List();
  Future getinprogress() async {
    inprogressList =
        await TransporterService().getAllinprogress(widget.providerUser.uid);
    setState(() {});
  }

  List<Invoice> completedList = List();
  Future getcompleted() async {
    completedList =
        await TransporterService().getAllcompleted(widget.providerUser.uid);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPending();
    getinprogress();
    getcompleted();
    
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: SizeConfig.safeBlockHorizontal * 20,
        right: SizeConfig.safeBlockHorizontal * 10,
        top: SizeConfig.safeBlockVertical * 30,
      ),
      height: SizeConfig.safeBlockVertical * 540,
      width: SizeConfig.safeBlockHorizontal * 310,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.elliptical(SizeConfig.safeBlockHorizontal * 55,
              SizeConfig.safeBlockVertical * 70),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image(
                image: AssetImage("assets/images/assign.png"),
                height: SizeConfig.safeBlockHorizontal * 30,
                fit: BoxFit.fill,
                width: SizeConfig.safeBlockHorizontal * 30,
              ),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal * 7,
              ),
              Text(
                "Assign Your Driver",
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 16,
                  color: Color(0xff003694),
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedStatus = 1;
                  });
                },
                child: Text(
                  "Pending",
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 16,
                    color: _selectedStatus == 1
                        ? Color(0xff000000)
                        : Color(0xffb2b2b2),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedStatus = 2;
                  });
                },
                child: Text(
                  "In Progress",
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 16,
                    color: _selectedStatus == 2
                        ? Color(0xff000000)
                        : Color(0xffB2B2B2),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedStatus = 3;
                  });
                },
                child: Text(
                  "Completed",
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 16,
                    color: _selectedStatus == 3
                        ? Color(0xff000000)
                        : Color(0xffB2B2B2),
                  ),
                ),
              )
            ],
          ),
          Expanded(
              child: _selectedStatus != 1
                  ?  _selectedStatus != 2
                    ? _selectedStatus != 3
                      ? Container()
                      : ListContainer1(pendingList: completedList)
                    : ListContainer1(pendingList: inprogressList)
                  :ListContainer(pendingList: pendingList)),
        ],
      ),
    );
  }
}

class ListContainer extends StatelessWidget {
  const ListContainer({
    Key key,
    @required this.pendingList,
  }) : super(key: key);

  final List<Invoice> pendingList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.safeBlockVertical * 3,
      ),
      child: pendingList != null
          ? ListView.builder(
                itemCount: pendingList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(

            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>DriverAssign(uid:ProviderUser().uid,invoice: pendingList[index],)));
            },

                                      child: Container(
                      padding: EdgeInsets.only(
          right: SizeConfig.safeBlockHorizontal * 5,
          left: SizeConfig.safeBlockHorizontal * 7,
          top: SizeConfig.safeBlockVertical * 5,
          bottom: SizeConfig.safeBlockVertical * 5,
                      ),
                      margin: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 6,
                      ),
                      width: SizeConfig.safeBlockHorizontal * 280,
                      height: SizeConfig.safeBlockVertical * 125,
                      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 0.2,
          ),
          borderRadius: BorderRadius.circular(
            SizeConfig.safeBlockVertical * 12,
          ),
                      ),
                      child: Row(
          children: <Widget>[
            Container(
              width: SizeConfig.safeBlockHorizontal * 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: 'Sell_Name ',
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: '- ${pendingList[index].sellerName}',
                            style: TextStyle(
                              fontSize:
                                  SizeConfig.safeBlockHorizontal * 13,
                              color: Color(0xff707070),
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Sell_City ',
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text:
                                '- ${pendingList[index].sellerAddress}',
                            style: TextStyle(
                              fontSize:
                                  SizeConfig.safeBlockHorizontal * 13,
                              color: Color(0xff707070),
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Buy_Name ',
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: '- ${pendingList[index].buyerName}',
                            style: TextStyle(
                              fontSize:
                                  SizeConfig.safeBlockHorizontal * 13,
                              color: Color(0xff707070),
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Buyer_Address ',
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text:
                                '- ${pendingList[index].buyerAddress}',
                            style: TextStyle(
                              fontSize:
                                  SizeConfig.safeBlockHorizontal * 13,
                              color: Color(0xff707070),
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
            Container(
              width: 0.3,
              height: double.maxFinite,
              color: Color(0xff707070),
            ),
            Container(
              width: SizeConfig.safeBlockHorizontal * 85,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Text(
                      pendingList[index].quantity + "pcs",
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 18,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 9,
                    ),
                    Text(
                      pendingList[index].product,
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 18,
                      ),
                    ),
                ],
              ),
            ),
          ],
                      ),
                    ),
                  );
                })
          : Container(),
    );
  }
}

class ListContainer1 extends StatelessWidget {
  const ListContainer1({
    Key key,
    @required this.pendingList,
  }) : super(key: key);

  final List<Invoice> pendingList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.safeBlockVertical * 3,
      ),
      child: pendingList != null
          ? ListView.builder(
              itemCount: pendingList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(
                    right: SizeConfig.safeBlockHorizontal * 5,
                    left: SizeConfig.safeBlockHorizontal * 7,
                    top: SizeConfig.safeBlockVertical * 5,
                    bottom: SizeConfig.safeBlockVertical * 5,
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockVertical * 6,
                  ),
                  width: SizeConfig.safeBlockHorizontal * 280,
                  height: SizeConfig.safeBlockVertical * 125,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 0.2,
                    ),
                    borderRadius: BorderRadius.circular(
                      SizeConfig.safeBlockVertical * 12,
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: SizeConfig.safeBlockHorizontal * 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text: 'Sell_Name ',
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: [
                                  TextSpan(
                                    text: '- ${pendingList[index].sellerName}',
                                    style: TextStyle(
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 13,
                                      color: Color(0xff707070),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Sell_City ',
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        '- ${pendingList[index].sellerAddress}',
                                    style: TextStyle(
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 13,
                                      color: Color(0xff707070),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Buy_Name ',
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: [
                                  TextSpan(
                                    text: '- ${pendingList[index].buyerName}',
                                    style: TextStyle(
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 13,
                                      color: Color(0xff707070),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Buyer_Address ',
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        '- ${pendingList[index].buyerAddress}',
                                    style: TextStyle(
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 13,
                                      color: Color(0xff707070),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 0.3,
                        height: double.maxFinite,
                        color: Color(0xff707070),
                      ),
                      Container(
                        width: SizeConfig.safeBlockHorizontal * 85,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              pendingList[index].quantity + "pcs",
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 18,
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.safeBlockVertical * 9,
                            ),
                            Text(
                              pendingList[index].product,
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              })
          :Column(
                          children: <Widget>[
                            
                          SizedBox(height: SizeConfig.safeBlockHorizontal*15,),
                            SvgPicture.asset(
                                "assets/images/svg/no_invoice.svg",
                                height: SizeConfig.safeBlockVertical * 270,
                                width: SizeConfig.safeBlockHorizontal * 270,
                              ),
                              SizedBox(height: SizeConfig.safeBlockHorizontal*15,),
                          Text(
                            "No Orders",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Segoe UI",
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockSizeHorizontal * 19),
                          ),
                          ],
                        ),
    );
  }
}
