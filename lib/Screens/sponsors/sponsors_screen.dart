import 'package:eclectika23_official_app/Screens/menupage_screens.dart';
import 'package:eclectika23_official_app/Screens/sponsors/sponsors_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class SponsorsScreen extends StatefulWidget {
  const SponsorsScreen({super.key});

  @override
  State<SponsorsScreen> createState() => _SponsorsScreenState();
}

class _SponsorsScreenState extends State<SponsorsScreen> {
  final _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        controller: _drawerController,
        style: DrawerStyle.defaultStyle,
        duration: const Duration(milliseconds: 500),
        menuBackgroundColor: Color(0xff000000),
        menuScreen: MenuPage(),
        mainScreen: SponsorsMainScreen(),
        borderRadius: 24.0,
        angle: 0.0,
        showShadow: true,
        slideWidth: MediaQuery.of(context).size.width *(0.65),
      ),
    );
  }
}
