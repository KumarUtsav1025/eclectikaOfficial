import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/strings.dart';

class ImageSlide extends StatelessWidget {
  const ImageSlide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 450.0,
        viewportFraction: 0.95,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(milliseconds: 4000),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.easeInOut,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
      ),
      items: [1,2,3,4,].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("${S.carousel}${i}.png"),
                Text(S.text[i-1],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.comfortaa(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}