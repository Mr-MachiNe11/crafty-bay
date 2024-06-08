import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          leading: IconButton(
              onPressed: () {
                Get.find<MainBottomNavBarController>().backToHome();
              },
              icon: const Icon(Icons.arrow_back_ios_sharp)),
        ),
        body: Column(
          children: [
            Card(
              child: Row(
                children: [
                  Image.asset(
                    AssetsPath.shoePng,
                    width: 100,
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text('Nike Shoe 2123K2'),
                                Wrap(
                                  spacing: 16,
                                  children: [
                                    Text('Color: Red'),
                                    Text('Size: XL'),
                                  ],
                                )
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete_outline_sharp))
                        ],
                      ),
                      Row(),
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
