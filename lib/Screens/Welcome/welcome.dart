import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../CustomWidgets/button.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text("ESOW",
                      style: GoogleFonts.bebasNeue(fontSize: 64),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, bottom: 20.0),
                    child: Text("Electronic Safety Of Women",
                      style: GoogleFonts.caveat(fontSize: 18, height: 0.1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0,),
                    child: Text("Let's Get Started",
                      style: GoogleFonts.cabin(
                          fontSize: 28, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Row(
                    children: [
                      CustomButton(title: "Sign up", fillColor: C.backgroundColor,
                        borderColor: C.gradientColor2,
                        onClick: () {
                          Navigator.pushNamed(context, S.routeSignup);
                        },
                      ),
                      CustomButton(title: "Log in", fillColor: C.backgroundColor,
                        borderColor: C.gradientColor2,
                        onClick: () {
                          Navigator.pushNamed(context, S.routeLogin);
                        },),
                    ],
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}







