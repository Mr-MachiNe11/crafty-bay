import 'package:crafty_bay/presentation/utility/app_colors.dart';
import 'package:crafty_bay/presentation/utility/assets_path.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: Colors.white,
      child: SizedBox(
        width: 150,
        child: Column(
          children: [
            _buildProductImageContainer(),
            _buildProductDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImageContainer() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      width: 150,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(AssetsPath.shoePng),
      ),
    );
  }


  Widget _buildProductDetails() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductTitle(),
          _buildProductPriceRating(),
        ],
      ),
    );
  }

  Widget _buildProductTitle() {
    return const Text(
      'Nike Sport Shoe 320K Special Edition',
      maxLines: 2,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 13,
        color: Colors.grey,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildProductPriceRating() {
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 5,
      children: [
        _buildProductPrice(),
        _buildProductRating(),
        _buildFavoriteIcon(),
      ],
    );
  }

  Widget _buildProductPrice() {
    return const Text(
      '\$30',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryColor,
      ),
    );
  }

  Widget _buildProductRating() {
    return const Wrap(
      children: [
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 20,
        ),
        Text('3.4')
      ],
    );
  }

  Widget _buildFavoriteIcon() {
    return Card(
      color: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Padding(
        padding: EdgeInsets.all(2.0),
        child: Icon(
          Icons.favorite_outline,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }
}


