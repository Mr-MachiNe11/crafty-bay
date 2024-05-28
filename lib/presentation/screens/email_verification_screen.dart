import 'package:crafty_bay/presentation/screens/otp_verification_screen.dart';
import 'package:crafty_bay/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 160,
                ),
                const AppLogo(),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Welcome Back',
                  style: textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Please Enter Your Email address',
                  style: textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: 'Email'),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => OtpVerificationScreen(
                          email: _emailController.text.trim()));
                    },
                    child: const Text('Next')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    super.dispose();
  }
}
