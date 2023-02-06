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
        title: Text(
          'Mini Events',
          style: TextStyle(fontSize: 40, color: Color(0xffFFEBC1)),
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

