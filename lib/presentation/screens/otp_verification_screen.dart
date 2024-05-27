import 'dart:async';

import 'package:crafty_bay/presentation/screens/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/utility/app_colors.dart';
import 'package:crafty_bay/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;

  const OtpVerificationScreen({super.key, required this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();

  var remainingTime = 100.obs;
  var isResendButtonVisible = false.obs;
  late Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startCountdownTimer();
  }

  void _startCountdownTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        isResendButtonVisible.value = true;
        _timer.cancel();
      }
    });
  }

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
                  height: 120,
                ),
                const AppLogo(),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Enter OTP Code',
                  style: textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'A 4 digit OTP code has been sent',
                  style: textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 24,
                ),
                _buildPinCodeField(),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => const CompleteProfileScreen());
                    },
                    child: const Text('Next')),
                const SizedBox(
                  height: 24,
                ),
                Obx(() => _buildResendCodeMessage()),
                Obx(() => Visibility(
                      visible: isResendButtonVisible.value,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Resend Code'),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResendCodeMessage() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
        children: [
          const TextSpan(text: 'This code will expire in '),
          TextSpan(
              text: '${remainingTime.value}s',
              style: const TextStyle(
                color: AppColors.primaryColor,
              )),
        ],
      ),
    );
  }

  Widget _buildPinCodeField() {
    return PinCodeTextField(
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      appContext: context,
      length: 4,
      obscureText: false,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 50,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.transparent,
        selectedFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      controller: _otpController,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _otpController.dispose();
    _timer.cancel();
    super.dispose();
  }
}
