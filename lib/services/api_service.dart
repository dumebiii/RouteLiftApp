import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:routelift/model/checkout.dart';
import 'package:routelift/model/product.dart';
import 'package:routelift/services/api_constants.dart';

class Apiservice {
  Future<List<Product>> getproducts() async {
    final response = await http.get(Uri.parse(ApiConstants.products));

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> data = body['data'];
      List<Product> products = data.map((e) => Product.fromJson(e)).toList();

      return products;
    } else {
      throw ("Can't get list of products");
    }
  }

  Future<Checkoutt> checkout(String name, String price, String qty) async {
    Map data = {"productName": name, "price": price, "quantity": qty};

    final response = await http.post(
      Uri.parse(ApiConstants.checkout),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      body: data,
      encoding: Encoding.getByName("utf-8"),
    );

    if (response.statusCode == 201) {
      Map<String, dynamic> body = jsonDecode(response.body);
      // Explicitly specify the type of data
      Checkoutt checkoutResponse = Checkoutt.fromJson(body['data']);

      return checkoutResponse;
    } else {
      throw Exception(
          "Failed to checkout. Status code: ${response.statusCode}");
    }
  }

 
}
