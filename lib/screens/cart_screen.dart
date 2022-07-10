import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/view/widgets/cart_products.dart';
import 'package:medica/view/widgets/cart_total.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Cart")),
      body: Column(
        children: [
          CartProducts(),
          CartTotal(),
        ],
      ),
    );
  }
}
