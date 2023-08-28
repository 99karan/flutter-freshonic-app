import 'package:flutter/material.dart';
import 'package:freshonic/List/listveg.dart';
import 'package:freshonic/List/listfruits.dart';
import 'package:freshonic/mainpage.dart';
import 'package:freshonic/upi.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({Key? key}) : super(key: key);

  @override
  State<Cartpage> createState() => _CartpageState();
}



class _CartpageState extends State<Cartpage> {
  List<Map<String, dynamic>> combinedCartItems = [];
  
  

  @override
  Widget build(BuildContext context) {
     double totalAmount = calculateTotal(combinedCartItems);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Mainpage()));
            },
          ),
        ],
      ),
      body: Consumer<ListFruits>(
        builder: (context, fruitValue, child) {
          return Consumer<ListVeg>(
            builder: (context, value, child) {
              combinedCartItems.clear();
              combinedCartItems.addAll(value.cartItems);
              combinedCartItems.addAll(fruitValue.cartItems);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'My Cart',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: combinedCartItems.length,
                      padding: const EdgeInsets.all(12),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10.0)),
                            child: ListTile(
                              leading: Image.asset(
                                combinedCartItems[index]['imagePath'],
                                height: 38,
                              ),
                              title: Text(
                                combinedCartItems[index]['name'],
                              ),
                              subtitle: Text(
                                'Rs${combinedCartItems[index]['price']}',
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.cancel),
                                onPressed: () {
                                  if (index < value.cartItems.length) {
                                    value.removeItemFromCart(index);
                                  } else {
                                    fruitValue.removeItemFromCart(
                                        index - value.cartItems.length as int);
                                  }
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                

                  Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8.0)),
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Price',
                                style: TextStyle(
                                    color: Colors.green[100]),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Rs${calculateTotal(combinedCartItems)}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  UPIpayment(totalAmount: totalAmount,
        combinedCartItems: combinedCartItems,)),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.green.shade700,
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                              padding: const EdgeInsets.all(12.0),
                              child: const Row(
                                children: [
                                  Text(
                                    'Pay Now',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}


double calculateTotal(List<Map<String, dynamic>> items) {
  double total = 0;
  for (int i = 0; i < items.length; i++) {
    total += double.parse(items[i]['price']);
  }
  return total;
}

