import 'package:crafty_bay/presentation/screens/create_new_review_screen.dart';
import 'package:crafty_bay/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {}, icon: const Icon(Icons.people)),
                              const Text("Name")
                            ],
                          ),
                          const Text(
                              "hello i flutter developer saiful.i make e commerce mobile appp")
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {}, icon: const Icon(Icons.people)),
                              const Text("Name")
                            ],
                          ),
                          const Text(
                              "hello i flutter developer saiful.i make e commerce mobile appp")
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(onPressed: () {}, icon: Icon(Icons.people)),
                              Text("Name")
                            ],
                          ),
                          Text(
                              "hello i flutter developer saiful.i make e commerce mobile appp")
                        ],
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(onPressed: () {}, icon: Icon(Icons.people)),
                              Text("Name")
                            ],
                          ),
                          Text(
                              "hello i flutter developer saiful.i make e commerce mobile appp")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildCreateReviewSanction()
          ],
        ),
      ),
    );
  }
  Widget _buildCreateReviewSanction() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTotalReviews(),
          SizedBox(
            child: FloatingActionButton(onPressed: (){
              Get.to(CreateNewReviewScreen());
            },child: Icon(Icons.add),),
          )
        ],
      ),
    );
  }

  Widget _buildTotalReviews() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reviews (1000)",
          style: TextStyle(fontSize: 16,
              color: Colors.grey, fontWeight: FontWeight.bold),
        ),

      ],
    );
  }
}
