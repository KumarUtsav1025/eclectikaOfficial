import 'package:custom_alert_dialog_box/custom_alert_dialog_box.dart';
import 'package:eclectika23_official_app/Screens/events/details.dart';
import 'package:flutter/material.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';
import '../../Constants/eventsList.dart';
import '../../CustomWidgets/customCards.dart';


class MegaEventScreen extends StatelessWidget {
  MegaEventScreen({super.key});

  @override
  List<Widget> fancyCard(BuildContext context){
    List<Widget> fancyCards = [];
    L.megaEvents.forEach((element){fancyCards.add(
      FancyCard(
        image: Image.asset(element["Image"].toString()),
        title: element["Name of the events"].toString(),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetailScreen(element: element)))
      ),
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
          'Mega Events',
          style: TextStyle(fontSize: 40, color: Color(0xffFFEBC1)),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/welcomeCarousel/5.png"),fit: BoxFit.cover)),
        child:StackedCardCarousel(
          items: fancyCard(context),
        ),),
    );
  }
}

