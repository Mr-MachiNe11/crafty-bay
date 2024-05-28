import 'package:crafty_bay/presentation/utility/assets_path.dart';
import 'package:crafty_bay/presentation/widgets/app_bar_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
      body: const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(16)),
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
      const SizedBox(width: 8,),
      AppBarIconButton(
        icon: Icons.call,
        onTap: () {},
      ),
      const SizedBox(width: 8,),
      AppBarIconButton(
        icon: Icons.notifications_active_outlined,
        onTap: () {},
      ),
      const SizedBox(width: 8,),

    ],
  );
  }
}
