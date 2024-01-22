import 'package:flutter/material.dart';
import 'package:routelift/model/category.dart';
import 'package:routelift/model/product.dart';
import 'package:routelift/services/api_service.dart';
import 'package:routelift/services/service_locator.dart';

class HomeViewModel extends ChangeNotifier {
  final Apiservice _apiservice = locator<Apiservice>();
  List<Category> categories = [
    Category(name: 'Main', image: 'assets/img/burger.png'),
    Category(name: 'Salads', image: 'assets/img/pizza.png'),
    Category(name: 'Soups', image: 'assets/img/meat.png'),
    Category(name: 'Drinks', image: 'assets/img/ice.png'),
  ];

  Future<List<Product>> products() async {
    List<Product> result = await _apiservice.getproducts();
    return result;
  }
}
