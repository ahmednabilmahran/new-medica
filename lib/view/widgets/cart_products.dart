import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/controllers/cart_controller.dart';
import 'package:medica/models/product_model.dart';
import 'package:medica/view/widgets/constance.dart';

class CartProducts extends StatelessWidget {
  final controller = Get.put(CartController());

  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 600,
        child: ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (BuildContext context, int index) {
              return CartProductCard(
                controller: controller,
                product: controller.products.keys.toList()[index],
                quantity: controller.products.values.toList()[index],
                index: index,
              );
            }),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;

  const CartProductCard({
    Key? key,
    required this.controller,
    required this.product,
    required this.quantity,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        bottom: size.height * 0.02,
        left: size.width * 0.068,
        right: size.width * 0.068,
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width * 0.26,
            height: size.width * 0.26,
            decoration: BoxDecoration(
              // color: Colors.green,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                  product.imageUrl,
                ),
              ),
            ),
          ),
          // CircleAvatar(
          //   radius: 40,
          //   backgroundImage: NetworkImage(
          //     product.imageUrl,
          //   ),
          // ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              product.name,
              style: TextStyle(
                  fontFamily: 'DMSans',
                  color: primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            // padding: EdgeInsets.all(0),
            // height: 90,
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(50)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    controller.removeProduct(product);
                  },
                  icon: Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 17,
                  ),
                ),
                Text(
                  '$quantity',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    height: 0,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.addProduct(product);
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 17,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
