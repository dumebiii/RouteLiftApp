import 'package:flutter/material.dart';
import 'package:routelift/model/checkout.dart';
import 'package:routelift/services/api_service.dart';
import 'package:routelift/services/service_locator.dart';

class DescriptionViewModel extends ChangeNotifier {
  final Apiservice apiservice = locator<Apiservice>();
  Checkoutt? checkoutResult;
  bool isLoading = false;

  int qty = 1;

  void increment() {
    qty++;
    notifyListeners();
  }

  void decrement() {
    if (qty > 1) {
      qty--;
      notifyListeners();
    }
  }

  Future<Checkoutt?> checkoutproducts(
      String name, String price, String qtyy) async {
    try {
      notifyListeners();

      Checkoutt result = await apiservice.checkout(name, price, qtyy);
      checkoutResult = result;

      // The operation has completed, set loading to false
      isLoading = false;
      notifyListeners();

      return checkoutResult;
    } catch (error) {
      isLoading = false; // Set loading to false in case of an error
      notifyListeners();
      rethrow;
    }
  }
}
