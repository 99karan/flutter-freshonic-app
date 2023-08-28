import 'package:flutter/material.dart';

class ListFruits extends ChangeNotifier {
   final List _shopItems = [
    // itemName, itemPrice, imagePath, color
    ['Apple', '1', 'lib/images/Fruits/apple.png', Colors.green],
    ['Banana', '2', 'lib/images/Fruits/banana.png', Colors.lightGreenAccent],
    ['Blueberry', '1', 'lib/images/Fruits/blueberry.png', Colors.red],
    ['Mango', '2', 'lib/images/Fruits/mango.png', Colors.lightGreen],
    ['Orange', '1', 'lib/images/Fruits/orange.png', Colors.green],
    ['Pineapple', '2',   'lib/images/Fruits/pineapple.png', Colors.redAccent],
    ['Strawberry', '1',  'lib/images/Fruits/strawberry.png', Colors.redAccent],
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
  String calculateTotal() {
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
