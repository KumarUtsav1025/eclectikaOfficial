import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/strings.dart';

class BannerSlider extends StatelessWidget {
  BannerSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    List<Widget> listBanners = [
      customBanner(imagePath: '${S.carousel}1.png', text: '${S.text[0]}', height: height, width: width),
      customBanner(imagePath: '${S.carousel}2.png', text: '${S.text[1]}', height: height, width: width),
    ];
    return BannerCarousel(
      customizedIndicators: const IndicatorModel.animation(width: 20, height: 5, spaceBetween: 2, widthAnimation: 50),
      height: height*0.68,
      activeColor: Colors.amberAccent,
      disableColor: Colors.white,
      animation: true,
      borderRadius: 10,
      width: width*0.9,
      indicatorBottom: true,
      customizedBanners: listBanners,
    );
  }
}


Widget customBanner({required String imagePath, required String text, required double height, required double width}){
  return Column(
  children: [
    ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset(imagePath,fit: BoxFit.cover,),
    ),
    const SizedBox(height: 10.0,),
    Text(text, style: GoogleFonts.sen(fontSize: 32.0,color: Colors.white))
  ],
  );
}