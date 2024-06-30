import 'package:crafty_bay/data/models/product_details_model.dart';
import 'package:crafty_bay/presentation/screens/review_screen.dart';
import 'package:crafty_bay/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay/presentation/utility/app_colors.dart';
import 'package:crafty_bay/presentation/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/presentation/widgets/color_picker.dart';
import 'package:crafty_bay/presentation/widgets/item_counter.dart';
import 'package:crafty_bay/presentation/widgets/product_image_carousel_slider.dart';
import 'package:crafty_bay/presentation/widgets/size_picker.dart';
import 'package:crafty_bay/presentation/widgets/wish_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        /*leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios_sharp)),*/
      ),
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        if (productDetailsController.inProgress) {
          return CenteredCircularProgressIndicator();
        }
        if (productDetailsController.errorMessage.isNotEmpty) {
          return Center(
            child: Text(productDetailsController.errorMessage),
          );
        }

        ProductDetailsModel productDetails =
            productDetailsController.productDetailsModel;

        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductImageCarouselSlider(
                      images: [
                        productDetails.img1 ?? '',
                        productDetails.img2 ?? '',
                        productDetails.img3 ?? '',
                        productDetails.img4 ?? '',
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                productDetails.product?.title ?? '',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black.withOpacity(0.65)),
                              )),
                              const ItemCounter(),
                            ],
                          ),
                          _buildReviewSection(),
                          const Text(
                            'Color',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          /*ColorPicker(
                            colors: const [
                              Colors.black,
                              Colors.red,
                              Colors.amber,
                              Colors.cyan,
                              Colors.purple
                            ],
                            onChange: (Color selectedColor) {},
                          ),*/
                          SizePicker(
                              sizes: productDetails.color?.split(',') ?? [],
                              onChange: (String s) {}),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Size',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizePicker(
                              sizes: productDetails.size?.split(',') ?? [],
                              onChange: (String s) {}),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Description',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(productDetails.product?.shortDes ?? ''),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(productDetails.des ?? ''),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildAddToCartSection(),
          ],
        );
      }),
    );
  }

  Widget _buildAddToCartSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(16),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPriceSection(),
          SizedBox(
            width: 120,
            child: ElevatedButton(
                onPressed: () {}, child: const Text('Add to cart')),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Price',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        Text(
          '\$1200',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: AppColors.primaryColor),
        ),
      ],
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
        TextButton(
            onPressed: () {
              Get.to(const ReviewScreen());
            },
            child: const Text('Reviews')),
        const WishButton(),
      ],
    );
  }
}
