import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/utility/app_colors.dart';
import 'package:crafty_bay/presentation/widgets/color_picker.dart';
import 'package:crafty_bay/presentation/widgets/product_image_carousel_slider.dart';
import 'package:crafty_bay/presentation/widgets/wish_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _counterValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios_sharp)),
      ),
      body: Column(
        children: [
          const ProductImageCarouselSlider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Nike Shoe 2024 Latest Edition 80AFE45',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.65)),
                    )),
                    _buildCounter(),
                  ],
                ),
                _buildReviewSection(),
                const Text(
                  'Color',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                ColorPicker(
                  colors: const [
                    Colors.black,
                    Colors.red,
                    Colors.amber,
                    Colors.cyan,
                    Colors.purple
                  ],
                  onChange: (Color selectedColor) {},
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Size',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewSection() {
    return Wrap(
      spacing: 5,
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Wrap(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
            Text('3.4'),
          ],
        ),
        TextButton(onPressed: () {}, child: const Text('Reviews')),
        const WishButton(),
      ],
    );
  }

  Widget _buildCounter() {
    return ItemCount(
      initialValue: _counterValue,
      minValue: 1,
      maxValue: 20,
      color: AppColors.primaryColor,
      onChanged: (value) {
        _counterValue = value as int;
        setState(() {});
      },
      decimalPlaces: 0,
    );
  }
}
