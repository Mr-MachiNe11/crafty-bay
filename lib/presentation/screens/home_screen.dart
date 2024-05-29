
import 'package:crafty_bay/presentation/utility/assets_path.dart';
import 'package:crafty_bay/presentation/widgets/app_bar_icon_button.dart';
import 'package:crafty_bay/presentation/widgets/home_carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildSearchTextField(),
              const SizedBox(
                height: 16,
              ),
              const HomeCarouselSlider(),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField _buildSearchTextField() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: Colors.grey.shade200,
        filled: true,
        prefixIcon: const Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.appNavLogoSvg),
      actions: [
        AppBarIconButton(
          icon: Icons.person,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        AppBarIconButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        AppBarIconButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
