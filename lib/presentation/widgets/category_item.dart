import 'package:crafty_bay/data/models/category.dart';
import 'package:crafty_bay/presentation/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/utility/app_colors.dart';
import 'package:crafty_bay/presentation/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
            () => ProductListScreen(categoryName: category.categoryName ?? '', categoryId: '',));
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8)),
            child: NetworkImageWidget(
              url: category.categoryImg ?? '',
              height: 50,
              width: 50,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            category.categoryName ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 16,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4),
          )
        ],
      ),
    );
  }
}
