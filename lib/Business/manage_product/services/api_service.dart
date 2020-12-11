import 'dart:convert';

import 'package:smarttextile/Business/Main/order.dart';
import 'package:smarttextile/Business/manage_product/product.dart';

import 'package:http/http.dart' as http;

class ApiService {
  final baseUrl =
      "https://us-central1-smarttextile-137.cloudfunctions.net/app/";

  Future uploadProduct(Product product, String id, String uid) async {
    product.uid = uid;
    product.id = id;
    print("Hello World");
    try {
      http.Response response = await http.post(
        "${baseUrl}products/create",
        headers: {
          'Content-type': 'application/json',
        },
        body: json.encode(product.toJson()),
      );
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

  Future getAllUserSareeProduct(String id) async {
    print("Hello World");
    try {
      http.Response response =
          await http.get("${baseUrl}products/filterUID/$id/Saree");
      if (response.statusCode == 200) {
        List body = jsonDecode(response.body);
        List<Product> productsareeList =
            body.map((e) => Product.fromJson(e)).toList();
        print(productsareeList);
        return productsareeList;
      } else {
        return null;
      }

      print(response.statusCode);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future getAllUserKurtiProduct(String id) async {
    print("Hello World");
    try {
      http.Response response =
          await http.get("${baseUrl}products/filterUID/$id/Kurti");
      if (response.statusCode == 200) {
        List body = jsonDecode(response.body);
        List<Product> productkurtiList =
            body.map((e) => Product.fromJson(e)).toList();
        print(productkurtiList);
        return productkurtiList;
      } else {
        return null;
      }

      print(response.statusCode);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future getAllUserDressProduct(String id) async {
    print("Hello World");
    try {
      http.Response response =
          await http.get("${baseUrl}products/filterUID/$id/Dress");
      if (response.statusCode == 200) {
        List body = jsonDecode(response.body);
        List<Product> productDressList =
            body.map((e) => Product.fromJson(e)).toList();
        print(productDressList);
        return productDressList;
      } else {
        return null;
      }

      print(response.statusCode);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future getAllUserFabricProduct(String id) async {
    print("Hello World");
    try {
      http.Response response =
          await http.get("${baseUrl}products/filterUID/$id/Fabric");
      if (response.statusCode == 200) {
        List body = jsonDecode(response.body);
        List<Product> productFabricList =
            body.map((e) => Product.fromJson(e)).toList();
        print(productFabricList);
        return productFabricList;
      } else {
        return null;
      }

      print(response.statusCode);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future getAllUserEthnicWearProduct(String id) async {
    print("Hello World");
    try {
      http.Response response =
          await http.get("${baseUrl}products/filterUID/$id/EthincWea");
      if (response.statusCode == 200) {
        List body = jsonDecode(response.body);
        List<Product> productEthnicList =
            body.map((e) => Product.fromJson(e)).toList();
        print(productEthnicList);
        return productEthnicList;
      } else {
        return null;
      }

      print(response.statusCode);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future getAllUserApperalProduct(String id) async {
    print("Hello World");
    try {
      http.Response response =
          await http.get("${baseUrl}products/filterUID/$id/ApperalAndGarments");
      if (response.statusCode == 200) {
        List body = jsonDecode(response.body);
        List<Product> productApperalList =
            body.map((e) => Product.fromJson(e)).toList();
        print(productApperalList);
        return productApperalList;
      } else {
        return null;
      }

      print(response.statusCode);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future getAllUserOrder(String id) async {
    print("Hello World");
    print(id);
    try {
      http.Response response =
          await http.get("${baseUrl}orders/readSellerF/$id");
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
          await http.get("${baseUrl}orders/readSellerT/$id");
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
          await http.get("${baseUrl}orders/readSellerCT/$id");
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
