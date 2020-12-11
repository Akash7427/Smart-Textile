import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:smarttextile/Business/Invoice/driver.dart';
import 'package:smarttextile/Chat/models/notification.dart';
import 'package:smarttextile/Chat/resources/auth_methods.dart';
import 'package:smarttextile/Chat/resources/chat_methods.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/shared/provider_user.dart';
import 'package:smarttextile/shared/push_notification.dart';

import 'invoice.dart';

import 'package:http/http.dart' as http;

class ApiService {
  final ChatMethods _chatMethods = ChatMethods();
  
        Notifications notifications = Notifications();
  final baseUrl =
      "https://us-central1-smarttextile-137.cloudfunctions.net/app/";
      

  Future uploadInvoice(
      Invoice invoice, String id, List deviceTokenTransporter) async {
    print("Hello World");
    print({id});
    try {
      http.Response response = await http.post(
        "${baseUrl}invoice/create/${id}",
        headers: {
          'Content-type': 'application/json',
        },
        body: json.encode(invoice.toJson()),
      );
      if (response.statusCode == 200) {
        User buyer = await AuthMethods().getUserDetailsById(invoice.buyerId);
        List deviceTokenBuyer = List();
        deviceTokenBuyer.add(buyer.deviceToken);
        PushNotification().postNotification(
            token: deviceTokenBuyer,
            title: "Order Accepted",
            notification_body:
                "Your order for ${invoice.product} is accepted by ${invoice.sellerName} and will be delivered soon.",
            uid: invoice.sellerId,
            receiverid: invoice.buyerId,
            screen: "Order Accepted",);
        PushNotification().postNotification(
          token: deviceTokenTransporter,
          uid: invoice.sellerId,
          receiverid: invoice.transporterId,
          title: "New Delivery Recieved",
          notification_body:
              "Delivery of ${invoice.product} from ${invoice.sellerAddress} to ${invoice.buyerAddress} by ${invoice.sellerName}",
          screen: "Transporter New Order",
        );

        notifications.title="Order Accepted";
        notifications.body="Your order for ${invoice.product} is accepted by ${invoice.sellerName} and will be delivered soon.";
        notifications.screen="Order Accepted";
        notifications.uid=invoice.sellerId;
        notifications.receiveruid=invoice.buyerId;
        await _chatMethods.addNotificationToDb(notifications);

        notifications.title="New Delivery Recieved";
        notifications.body="Delivery of ${invoice.product} from ${invoice.sellerAddress} to ${invoice.buyerAddress} by ${invoice.sellerName}";
        notifications.screen="Transporter New Order";
        notifications.uid=invoice.sellerId;
        notifications.receiveruid=invoice.transporterId;
        await _chatMethods.addNotificationToDb(notifications);

      }
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

  Future uploadDriver(Driver driver, String id) async {
    print("Hello World");

    try {
      http.Response response = await http.post(
        "${baseUrl}drivers/create/$id",
        headers: {
          'Content-type': 'application/json',
        },
        body: json.encode(driver.toJson()),
      );
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

  Future getAllUserDriver(String id) async {
    print("Hello World");
    try {
      http.Response response = await http.get("${baseUrl}drivers/readUser/$id");
      if (response.statusCode == 200) {
        List body = jsonDecode(response.body);
        List<Driver> driverList = body.map((e) => Driver.fromJson(e)).toList();
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

  Future getInvoice(String id) async {
    try {
      http.Response response = await http.get("${baseUrl}invoice/read/$id");
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print(body);
        Invoice invoice = Invoice.fromJson(body);
        print(invoice.date);
        return invoice;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future getAllUserInvoice(String id) async {
    print("Hello World");
    try {
      http.Response response = await http.get("${baseUrl}invoice/filter/$id");
      if (response.statusCode == 200) {
        List body = jsonDecode(response.body);
        List<Invoice> invoiceList =
            body.map((e) => Invoice.fromJson(e)).toList();
        print(invoiceList);
        return invoiceList;
      } else {
        return null;
      }

      print(response.statusCode);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future deleteorder(String id) async {
    print("Hello World");

    try {
      http.Response response = await http.delete("${baseUrl}orders/delete/$id");
      print(response.statusCode);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future changeAccept(String id) async {
    print("Hello World");

    try {
      http.Response response =
          await http.put("${baseUrl}orders/sellerAccept/$id");
      print(response.statusCode);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future changeCompleted(String id) async {
    print("Hello World");

    try {
      http.Response response =
          await http.put("${baseUrl}orders/sellerCompleted/$id");
      print(response.statusCode);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future changeOrderCompleted(String id) async {
    print("Hello World");

    try {
      http.Response response =
          await http.put("${baseUrl}invoice/completedTrue/$id");
      print(response.statusCode);
    } catch (e) {
      print(e);
      return null;
    }
  }

}
