import 'package:eclectika23_official_app/Screens/face_of_eclectika/face_of_eclectika_main_screen.dart';
import 'package:eclectika23_official_app/Screens/menupage_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class FaceOfEclectikaScreen extends StatefulWidget {
  const FaceOfEclectikaScreen({super.key});

  @override
  State<FaceOfEclectikaScreen> createState() => _FaceOfEclectikaScreenState();
}

class _FaceOfEclectikaScreenState extends State<FaceOfEclectikaScreen> {
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
        mainScreen: FaceOfEclectikaMainScreen(),
        borderRadius: 24.0,
        angle: 0.0,
        showShadow: true,
        slideWidth: MediaQuery.of(context).size.width *(0.65),
      ),
    );
  }
}
