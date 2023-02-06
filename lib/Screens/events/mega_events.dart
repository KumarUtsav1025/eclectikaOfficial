import 'package:eclectika23_official_app/CustomWidgets/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';
import '../../Modals/events.dart';
import 'network.dart';

List<Widget> eventList=[];

Future<void> eventTabs() async{
  EventNetwork eventNetwork = EventNetwork();
  List events  = await eventNetwork.getEventDetails();
  events.forEach((element) {
    eventList.add(
      FancyCard(
        image: Image.network(element.link),
        title: element.name,
      ),
    );
  });
}



class MegaEventScreen extends StatefulWidget {

  MegaEventScreen({super.key});

  @override
  State<MegaEventScreen> createState() => _MegaEventScreenState();
}

class _MegaEventScreenState extends State<MegaEventScreen> {
  @override
  void initState(){
    eventTabs();
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
      body: FutureBuilder(
        future: ,
        builder: (context){},
      ),
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