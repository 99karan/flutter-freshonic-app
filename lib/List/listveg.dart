import 'package:flutter/material.dart';

class ListVeg extends ChangeNotifier {
   final List _shopItems = [
    // itemName, itemPrice, imagePath, color
    ['Avocado', '1', 'lib/images/Vegetables/avocado.png', Colors.green],
    ['Cabbage', '2', 'lib/images/Vegetables/cabbage.png', Colors.lightGreenAccent],
    ['Chili', '1', 'lib/images/Vegetables/chili.png', Colors.red],
    ['Cucumber', '2', 'lib/images/Vegetables/cucumber.png', Colors.lightGreen],
    ['Spinach', '1', 'lib/images/Vegetables/spinach.png', Colors.green],
    ['Tomato', '2',  'lib/images/Vegetables/tomato.png', Colors.redAccent],
  ];

  final List<Map<String, dynamic>> _cartItems = [];

  get shopItems => _shopItems;
  get cartItems => _cartItems;

  // add to cart
  void addItemToCart(int index) {
  Map<String, dynamic> cartItem = {
    'name': _shopItems[index][0],
    'price': _shopItems[index][1],
    'imagePath': _shopItems[index][2],
    'color': _shopItems[index][3],
  };
  _cartItems.add(cartItem);
  notifyListeners();
}

  // remove
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // total price
  String calculateTotal(List<Map<String, dynamic>> combinedCartItems) {
    double total = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      // ignore: unnecessary_null_comparison
      if(_cartItems[i] == null) {
      print('_cartItems[$i]: ${_cartItems[i]}');
      total += double.parse(_cartItems[i][1]);
    } else {
      print('_cartItems[$i] is null');
    }
  }

    return total.toStringAsFixed(2);
  }
}



 

 