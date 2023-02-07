import 'package:auto_size_text/auto_size_text.dart';
import 'package:eclectika23_official_app/Screens/MadAds/MadAds.dart';
import 'package:eclectika23_official_app/Screens/events/events_main_screen.dart';
import 'package:eclectika23_official_app/Screens/events/events_screen.dart';
import 'package:eclectika23_official_app/Screens/gallery/gallery_screen.dart';
import 'package:eclectika23_official_app/Screens/sponsors/sponsors_screen.dart';
import 'package:eclectika23_official_app/Screens/team/team_screen.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color(0xff000000),
              ),
            ),
          SafeArea(
            child: Container(
              width: 200.0,
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        child: AutoSizeText.rich(
                        TextSpan(
                          text: "Eclectika",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight:FontWeight.bold,
                              color: Color(0xffFFEBC1),
                          ), // default text style
                        ),
                        minFontSize: 0,
                        stepGranularity: 0.1,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: ((context) {
                            return EventsScreen();
                          })));
                        },
                        child: Container(
                          height: 40,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Color(0xffD7A86E),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: Offset(4, 4),
                              ),
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: Offset(-4, -4),
                              ),
                            ],
                          ),
                          child: const Center(
                              child: Text(
                            "Events",
                            style: TextStyle(
                                color: Color(0xffFFEBC1),
                                fontWeight: FontWeight.bold,
                                fontSize: 23),
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ), GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: ((context) {
                            return MadAdsScreen();
                          })));
                        },
                        child: Container(
                          height: 40,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Color(0xffD7A86E),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: Offset(4, 4),
                              ),
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: Offset(-4, -4),
                              ),
                            ],
                          ),
                          child: const Center(
                              child: Text(
                            "MadAds",
                            style: TextStyle(
                                color: Color(0xffFFEBC1),
                                fontWeight: FontWeight.bold,
                                fontSize: 23),
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ), GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: ((context) {
                            return GalleryScreen();
                          })));
                        },
                        child: Container(
                          height: 40,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Color(0xffD7A86E),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: Offset(4, 4),
                              ),
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: Offset(-4, -4),
                              ),
                            ],
                          ),
                          child: const Center(
                              child: Text(
                            "Gallery",
                            style: TextStyle(
                                color: Color(0xffFFEBC1),
                                fontWeight: FontWeight.bold,
                                fontSize: 23),
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: ((context) {
                            return SponsorsScreen();
                          })));
                        },
                        child: Container(
                          height: 40,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Color(0xffD7A86E),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: Offset(4, 4),
                              ),
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: Offset(-4, -4),
                              ),
                            ],
                          ),
                          child: const Center(
                              child: Text(
                            "Sponsors",
                            style: TextStyle(
                                color: Color(0xffFFEBC1),
                                fontWeight: FontWeight.bold,
                                fontSize: 23),
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: ((context) {
                            return TeamScreen();
                          })));
                        },
                        child: Container(
                          height: 40,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Color(0xffD7A86E),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: Offset(4, 4),
                              ),
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: Offset(-4, -4),
                              ),
                            ],
                          ),
                          child: const Center(
                              child: Text(
                            "About Us",
                            style: TextStyle(
                                color: Color(0xffFFEBC1),
                                fontWeight: FontWeight.bold,
                                fontSize: 23),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
