import 'dart:convert';
import 'package:smarttextile/Business/Invoice/driver.dart';
import 'package:smarttextile/Business/Invoice/invoice.dart';
import 'package:smarttextile/Chat/models/notification.dart';
import 'package:smarttextile/Chat/resources/auth_methods.dart';
import 'package:smarttextile/Chat/resources/chat_methods.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/shared/provider_user.dart';


import 'package:http/http.dart' as http;
import 'package:smarttextile/shared/push_notification.dart';

class TransporterService {
  
  final ChatMethods _chatMethods = ChatMethods();
  
        Notifications notifications = Notifications();
  final baseUrl =
      "https://us-central1-smarttextile-137.cloudfunctions.net/app/";


  Future getAllUserDriver(String id) async {
    print("Hello World");
    try {
        http.Response response=await http.get("${baseUrl}drivers/readUser/$id");
        if (response.statusCode==200) {
          List body=jsonDecode(response.body);
          List<Driver> driverList=body.map((e) => Driver.fromJson(e)).toList();
          print(driverList);
          return driverList;
        } else {
          return null;
        }

      print(response.statusCode);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future getAllPending(String id) async {

    print("Hello World");
            http.Response response=await http.get("${baseUrl}invoice/filter/pendingTrue/$id");
            print(response.statusCode);
    try {

        if (response.statusCode==200) {
          List body=jsonDecode(response.body);
          List<Invoice> pendingList=body.map((e) => Invoice.fromJson(e)).toList();
          print(pendingList);
          return  pendingList;
        } else {
          return null;
        }

    } catch (e) {
      print(e);
      return null;
    }
  }

  Future getAllinprogress(String id) async {

    print("Hello World");
            http.Response response=await http.get("${baseUrl}invoice/filter/inprogressTrue/$id");
            print(response.statusCode);
    try {

        if (response.statusCode==200) {
          List body=jsonDecode(response.body);
          List<Invoice> inprogressList=body.map((e) => Invoice.fromJson(e)).toList();
          print(inprogressList);
          return  inprogressList;
        } else {
          return null;
        }

    } catch (e) {
      print(e);
      return null;
    }
  }

  Future getAllcompleted(String id) async {

    print("Hello World");
            http.Response response=await http.get("${baseUrl}invoice/filter/completedTrue/$id");
            print(response.statusCode);
    try {

        if (response.statusCode==200) {
          List body=jsonDecode(response.body);
          List<Invoice> completedList=body.map((e) => Invoice.fromJson(e)).toList();
          print(completedList);
          return  completedList;
        } else {
          return null;
        }

    } catch (e) {
      print(e);
      return null;
    }
  }

  Future changePending(Invoice invoice) async {

    print("Hello World");
            
    try {
      http.Response response=await http.put("${baseUrl}invoice/updatePendingAndInprogress/${invoice.invoiceID}/${invoice.driverID}");
            print(response.statusCode);
      if(response.statusCode == 200)
      {
        User buyer = await AuthMethods().getUserDetailsById(invoice.buyerId);
        List deviceTokenBuyer = List();
        deviceTokenBuyer.add(buyer.deviceToken);
        User seller = await AuthMethods().getUserDetailsById(invoice.buyerId);
        List deviceTokenSeller = List();
        deviceTokenSeller.add(seller.deviceToken);
        PushNotification().postNotification(
            token: deviceTokenBuyer,
            title: "Order In-Progress",
            notification_body:
                "Your order for ${invoice.product} is now in-progress",
            uid: invoice.transporterId,
            receiverid: invoice.buyerId,
            screen: "Wholesaler Order",);
        PushNotification().postNotification(
          token: deviceTokenSeller,
          uid: invoice.transporterId,
          receiverid: invoice.sellerId,
          title: "Order In-Progress",
          notification_body:
              "Delivery of ${invoice.product} to ${invoice.buyerAddress} for ${invoice.buyerName} is now In-Progress",
          screen: "Seller Order",
        );


        notifications.title="Order In-Progress";
        notifications.body="Your order for ${invoice.product} is now in-progress";
        notifications.screen="Wholesaler Order";
        notifications.uid=invoice.transporterId;
        notifications.receiveruid=invoice.buyerId;
        await _chatMethods.addNotificationToDb(notifications);

        notifications.title="Order In-Progress";
        notifications.body="Delivery of ${invoice.product} to ${invoice.buyerAddress} for ${invoice.buyerName} is now In-Progress";
        notifications.screen="Seller Order";
        notifications.receiveruid=invoice.sellerId;
        notifications.uid=invoice.transporterId;
        await _chatMethods.addNotificationToDb(notifications);



      }

    } catch (e) {
      print(e);
      return null;
    }
  }

  
}
