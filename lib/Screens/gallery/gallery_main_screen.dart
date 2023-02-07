import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:eclectika23_official_app/Constants/colors.dart';
import 'package:eclectika23_official_app/Constants/eventsList.dart';
import 'package:eclectika23_official_app/CustomWidgets/customCardsb.dart';
import 'package:eclectika23_official_app/CustomWidgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class GalleryMainScreen extends StatefulWidget {
  const GalleryMainScreen({Key? key}) : super(key: key);

  @override
  _GalleryMainScreenState createState() => _GalleryMainScreenState();
}

class _GalleryMainScreenState extends State<GalleryMainScreen> {
  final AppinioSwiperController controller = AppinioSwiperController();
  List<Widget> fancyCard(BuildContext context){
    List<Widget> fancyCards = [];
    L.galleryEvents.forEach((element){fancyCards.add(
      FancyCardb(
        image: Image.asset(element["Image"].toString()),
        text: element["Name of the events"].toString(),
      ),
    );
    });
    return fancyCards;
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
        title: Padding(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: GradientText("Gallery",
              gradient: const LinearGradient(
                colors: [
                  C.vintageBackdrop2,
                  Color(0xffCA965C),
                  Color(0xff876445),
                  Color(0xffCA965C),
                  Color(0xff876445),
                  Color(0xffCA965C),
                  Color(0xff876445),
                  C.vintageBackdrop2,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
        ),
        leading: IconButton(
          onPressed: () => ZoomDrawer.of(context)!.toggle(),
          icon: Icon(Icons.menu),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("asset/welcomeCarousel/2.png"),
                  fit: BoxFit.cover),
            ),
            child: StackedCardCarousel(
              items: fancyCard(context),
             ),),
        ],
      ),
    );
  }
}
