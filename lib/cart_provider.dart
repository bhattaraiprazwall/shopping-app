import 'package:flutter/foundation.dart';

class CartProvider extends ChangeNotifier{ // it doesn't do anything automatically

  final List<Map<String,dynamic>> cart =[];
  void addProduct(Map<String,dynamic> product)
  {
    cart.add(product);
    notifyListeners(); //only notifies the widgets listening to it once the notifyListeners() function is called
  }

  void removeProduct(Map<String,dynamic> product)
  {
    cart.remove(product);
    notifyListeners();
  }

}