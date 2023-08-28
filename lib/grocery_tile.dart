
import 'package:flutter/material.dart';

  class CartItem {
  final String name;
  final String price;
  final String imagePath;
  final Color color;

  CartItem({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.color,
  });
}

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  final onPressed;

  const GroceryItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPressed,
  });


  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imagePath,
              height: 75,
            ),
            Text(itemName),
            MaterialButton(
              onPressed: onPressed,
              color: color[800],
              child: Text(
                'Rs$itemPrice',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
            // item name
            // price + button
        ),
      ),
    );
  }
}