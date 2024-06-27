import 'package:crafty_bay/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.sizes, required this.onChange});

  final List<String> sizes;
  final Function(String) onChange;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.sizes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onChange(widget.sizes[index]);
            },
            child: Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                  color: _getSelectedBackgroundColor(index == selectedIndex),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                      color: _getSelectedTextColor(index == selectedIndex))),
              child: FittedBox(
                child: Text(
                  widget.sizes[index],
                  style: TextStyle(
                    color: _getSelectedTextColor(index == selectedIndex),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getSelectedTextColor(bool isSelected) {
    return isSelected ? Colors.white : Colors.black;
  }

  Color _getSelectedBackgroundColor(bool isSelected) {
    return isSelected ? AppColors.primaryColor : Colors.transparent;
  }
}
