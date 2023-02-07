import 'package:eclectika23_official_app/Constants/colors.dart';
import 'package:eclectika23_official_app/CustomWidgets/customText.dart';
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
        title: Padding(
          padding: const EdgeInsets.only(left: 15,),
          child: GradientText("MegaEvents",
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
        child:StackedCardCarousel(
          items: fancyCard(context),
        ),),
    );
  }
}

