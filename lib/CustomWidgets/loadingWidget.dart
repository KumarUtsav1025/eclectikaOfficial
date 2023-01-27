import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../Constants/colors.dart';
import '../Constants/strings.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:[
          Image.asset("${S.carousel}5.png"),
          const SizedBox(
            height: 100,
            child: LoadingIndicator(
                indicatorType: Indicator.pacman, /// Required, The loading type of the widget
                colors: [Colors.brown, Colors.yellow, Colors.amber, ],       /// Optional, The color collections
                strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
                backgroundColor: Colors.transparent,      /// Optional, Background of the widget
                pathBackgroundColor: Colors.transparent   /// Optional, the stroke backgroundColor
            ),
          )
        ],
      ),
    );
  }
}
