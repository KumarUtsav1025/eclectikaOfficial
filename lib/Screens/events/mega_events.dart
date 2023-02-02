import 'package:flutter/material.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class MegaEventScreen extends StatelessWidget {
  MegaEventScreen({super.key});

  final List<Widget> fancyCards = <Widget>[
    FancyCard(
      image: Image.asset("asset/menu/events.png"),
      title: "Say hello to planets!",
    ),
    FancyCard(
      image: Image.asset("asset/menu/events.png"),
      title: "Don't be sad!",
    ),
    FancyCard(
      image: Image.asset("asset/menu/events.png"),
      title: "Go for a walk!",
    ),
    FancyCard(
      image: Image.asset("asset/menu/events.png"),
      title: "Try teleportation!",
    ),
    FancyCard(
      image: Image.asset("asset/menu/events.png"),
      title: "Enjoy your coffee!",
    ),
    FancyCard(
      image: Image.asset("asset/menu/events.png"),
      title: "Play with your cat!",
    ),
  ];

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
        items: fancyCards,
      ),),
    );
  }
}

class FancyCard extends StatelessWidget {
  const FancyCard({
    super.key,
    required this.image,
    required this.title,
  });

  final Image image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              width: 250,
              height: 250,
              child: image,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
            OutlinedButton(
              child: const Text("Learn more"),
              onPressed: () => print("Button was tapped"),
            ),
          ],
        ),
      ),
    );
  }
}