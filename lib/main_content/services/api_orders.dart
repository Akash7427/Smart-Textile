import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smarttextile/Business/Main/order.dart';
import 'package:smarttextile/Chat/models/notification.dart';
import 'package:smarttextile/Chat/resources/chat_methods.dart';
import 'package:smarttextile/main_content/screens/shared/transporters_list.dart';
import 'package:smarttextile/shared/push_notification.dart';

class ApiOrder {
  String baseUrl =
      "https://us-central1-smarttextile-137.cloudfunctions.net/app/";
  final ChatMethods _chatMethods = ChatMethods();
  
        Notifications notifications = Notifications();
  Future createOrder(Order order, List deviceToken) async {
    print(order.buyerAddress);
    print(order.sellerAddress);
    try {
      http.Response response = await http.post(
        "${baseUrl}orders/create/${order.orderID}",
        headers: {
          'Content-type': 'application/json',
        },
        body: json.encode(order.toJson()),
      );
      if (response.statusCode == 200) {
        print(deviceToken);
        print("Order Placed Successfully");
        PushNotification().postNotification(
            title: "New Order Recieved",
            token: deviceToken,
            notification_body:
                "Order of ${order.product} from ${order.buyerName} ${order.buyerCity}, ${order.buyerState}",
            screen: "New Order",
            uid: order.sellerUID);
        notifications.title="New Order Recieved";
        notifications.body="Order of ${order.product} from ${order.buyerName} ${order.buyerCity}, ${order.buyerState}";
        notifications.screen="New Order";
        notifications.uid=order.sellerUID;
        notifications.receiveruid=order.buyerUID;
        await _chatMethods.addNotificationToDb(notifications);
      } else {
        print("Order Failed");
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  Future getAllUserOrder(String id) async {
    print("Hello World");
    print(id);
    try {
      http.Response response =
          await http.get("${baseUrl}orders/readBuyerF/$id");
      print(response.statusCode);
      if (response.statusCode == 200) {
        List body = jsonDecode(response.body);
        List<Order> orderList =
            body.map((e) => Order.fromJson(e)).toList();
        print(orderList);
        
        return orderList;
      } else {
        print("jj");
        return null;
      }

      print(response.statusCode);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future getAllUserInProgerssOrder(String id) async {
    print("Hello World");
    print(id);
    try {
      http.Response response =
          await http.get("${baseUrl}orders/readBuyerT/$id");
      print(response.statusCode);
      if (response.statusCode == 200) {
        List body = jsonDecode(response.body);
        List<Order> orderList =
            body.map((e) => Order.fromJson(e)).toList();
        print(orderList);
        
        return orderList;
      } else {
        print("jj");
        return null;
      }

      print(response.statusCode);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future getAllUserCompletedOrder(String id) async {
    print("Hello World");
    print(id);
    try {
      http.Response response =
          await http.get("${baseUrl}orders/readBuyerCT/$id");
      print(response.statusCode);
      if (response.statusCode == 200) {
        List body = jsonDecode(response.body);
        List<Order> orderList =
            body.map((e) => Order.fromJson(e)).toList();
        print(orderList);
        
        return orderList;
      } else {
        print("jj");
        return null;
      }

      print(response.statusCode);
    } catch (e) {
      print(e);
      return null;
    }
  }

}
