import 'package:eclectika23_official_app/Screens/menupage_screens.dart';
import 'package:eclectika23_official_app/Screens/team/team_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  final _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        controller: _drawerController,
        style: DrawerStyle.defaultStyle,
        duration: const Duration(milliseconds: 500),
        menuBackgroundColor:Color(0xff000000),
        menuScreen: MenuPage(),
        mainScreen: TeamMainScreen(),
        borderRadius: 24.0,
        angle: 0.0,
        showShadow: true,
        slideWidth: MediaQuery.of(context).size.width *(0.65),
      ),
    );
  }
}
