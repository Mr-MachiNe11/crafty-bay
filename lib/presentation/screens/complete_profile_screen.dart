import 'package:crafty_bay/presentation/screens/otp_verification_screen.dart';
import 'package:crafty_bay/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _shippingAddressController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  height: 24,
                ),
                const AppLogo(),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Complete Profile',
                  style: textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Get started with us with your details',
                  style: textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 24,
                ),
                _buildCompleteProfileForm(),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle the completion action here
                  },
                  child: const Text('Complete'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompleteProfileForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _firstNameController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person_outline),
              hintText: 'First Name',
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _lastNameController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: 'Last Name',
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _mobileController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.phone_android),
              hintText: 'Mobile',
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _cityController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.location_city),
              hintText: 'City',
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            maxLines: 3,
            controller: _shippingAddressController,
            decoration: const InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.only(bottom: 45),
                child: Icon(Icons.home),
              ),
              hintText: 'Shipping Address',
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileController.dispose();
    _cityController.dispose();
    _shippingAddressController.dispose();
    super.dispose();
  }
}
