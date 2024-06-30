import 'package:crafty_bay/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ItemCounter extends StatefulWidget {
  const ItemCounter({super.key});

  @override
  State<ItemCounter> createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {

  int _counterValue = 1;
  @override
  Widget build(BuildContext context) {
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
