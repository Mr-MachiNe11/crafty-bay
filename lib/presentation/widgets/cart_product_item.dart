import 'package:crafty_bay/presentation/utility/app_colors.dart';
import 'package:crafty_bay/presentation/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class CartProductItem extends StatefulWidget {
  const CartProductItem({super.key});

  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  int _counterValue = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      surfaceTintColor: Colors.white,
      child: Row(
        children: [
          _buildProductImage(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _buildProductDetails(),
                  _buildPriceAndCounter(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        AssetsPath.shoePng,
        width: 100,
      ),
    );
  }

  Widget _buildProductDetails() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nike Shoe 213234KG34',
                maxLines: 1,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis),
              ),
              _buildColorAndSize(),
            ],
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_outline_sharp))
      ],
    );
  }

  Widget _buildColorAndSize() {
    return const Wrap(
              spacing: 18,
              children: [
                Text(
                  'Color: Red',
                  style: TextStyle(color: Colors.black54),
                ),
                Text(
                  'Size: XL',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            );
  }

  Widget _buildPriceAndCounter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '\$100',
          style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
        ItemCount(
          initialValue: _counterValue,
          minValue: 1,
          maxValue: 20,
          color: AppColors.primaryColor,
          onChanged: (value) {
            _counterValue = value as int;
            setState(() {});
          },
          decimalPlaces: 0,
        )
      ],
    );
  }
}
