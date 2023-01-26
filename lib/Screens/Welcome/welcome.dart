import 'dart:ui';
import 'package:eclectika23_official_app/CustomWidgets/bannerSlider.dart';
import 'package:eclectika23_official_app/CustomWidgets/imageSlider.dart';
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
        backgroundColor: Colors.black54,
        body: Stack(
          children: [
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0,),
                  BannerSlider(),
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







