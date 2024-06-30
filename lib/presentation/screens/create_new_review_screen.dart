import 'package:crafty_bay/presentation/screens/review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewReviewScreen extends StatefulWidget {
  const CreateNewReviewScreen({super.key});

  @override
  State<CreateNewReviewScreen> createState() => _CreateNewReviewScreenState();
}

class _CreateNewReviewScreenState extends State<CreateNewReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Review'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: "First Name"),
            ),
            const SizedBox(
              height: 18,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Last Name"),
            ),
            const SizedBox(
              height: 18,
            ),
            TextFormField(
              maxLines: 6,
              decoration: const InputDecoration(hintText: "Write Review"),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(const ReviewScreen());
                },
                child: const Text("Submit"))
          ],
        ),
      ),
    );
  }
}
