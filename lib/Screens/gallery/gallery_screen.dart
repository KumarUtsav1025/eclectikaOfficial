import 'package:eclectika23_official_app/Screens/events/events_main_screen.dart';
import 'package:eclectika23_official_app/Screens/gallery/gallery_main_screen.dart';
import 'package:eclectika23_official_app/Screens/menupage_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
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
        mainScreen: GalleryMainScreen(),
        borderRadius: 24.0,
        angle: 0.0,
        showShadow: true,
        slideWidth: MediaQuery.of(context).size.width *(0.65),
      ),
    );
  }
}