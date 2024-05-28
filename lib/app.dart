import 'package:crafty_bay/presentation/screens/splash_screen.dart';
import 'package:crafty_bay/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: AppColors.primaryColor,
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: AppColors.primaryColor),
        textTheme: _textTheme(),
        inputDecorationTheme: _inputDecorationTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromWidth(double.maxFinite),
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }

  TextTheme _textTheme() => const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(fontSize: 16, color: Colors.blueGrey),
      );

  InputDecorationTheme _inputDecorationTheme() => InputDecorationTheme(
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
        prefixIconColor: Colors.grey,
        border: _outlineInputBorder,
        enabledBorder: _outlineInputBorder,
        focusedBorder: _outlineInputBorder,
        errorBorder: _outlineInputBorder.copyWith(
            borderSide: const BorderSide(
          color: Colors.red,
        )),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      );
  final OutlineInputBorder _outlineInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primaryColor),
  );
}
