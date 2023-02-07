import 'package:eclectika23_official_app/Constants/colors.dart';
import 'package:eclectika23_official_app/CustomWidgets/customText.dart';
import 'package:eclectika23_official_app/CustomWidgets/eventCards.dart';
import 'package:flutter/material.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

import '../../Constants/eventsList.dart';

class MiniEventScreen extends StatelessWidget {
  MiniEventScreen({super.key});

  List<Widget> fancyCard(){
    List<Widget> fancyCards = [];
    L.miniEvents.forEach((element){fancyCards.add(
      EventCard(event: element)
    );
    });
    return fancyCards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
        title: Padding(
          padding: const EdgeInsets.only(left: 15,),
          child: GradientText("MiniEvents",
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
      ),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/welcomeCarousel/5.png"),fit: BoxFit.cover)),
        child: ListView(
            padding: const EdgeInsets.all(8),
            children: fancyCard(),
        ),
      ),
    );
  }
}

