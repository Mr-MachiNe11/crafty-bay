import 'package:crafty_bay/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8)),
          child: const Icon(
            Icons.desktop_windows_outlined,
            size: 48,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          'Electronics',
          style: TextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.4),
        )
      ],
    );
  }
}
