import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key, this.elementId = ''});
  final String elementId;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            C.gradientColor3,
            C.gradientColor2,
            C.gradientColor,
            C.fieldColor,
            C.gradientColor,
            C.gradientColor2,
            C.gradientColor3,
          ],
        ),
      ),
      child: null,
    );
  }
}


class ScreenBackground1 extends StatelessWidget {
  const ScreenBackground1({super.key, this.elementId = ''});
  final String elementId;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff0E0207),
    );
  }
}
