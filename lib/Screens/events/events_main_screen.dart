import 'package:eclectika23_official_app/CustomWidgets/button.dart';
import 'package:eclectika23_official_app/Screens/events/mega_events.dart';
import 'package:eclectika23_official_app/Screens/events/mini_event_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/colors.dart';
import '../../Constants/strings.dart';

class EventMainScreen extends StatefulWidget {
  const EventMainScreen({Key? key}) : super(key: key);

  @override
  _EventMainScreenState createState() => _EventMainScreenState();
}

class _EventMainScreenState extends State<EventMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
        title: Text(
          'Events',
          style: TextStyle(fontSize: 40, color: Color(0xffFFEBC1)),
        ),
        leading: IconButton(
            onPressed: () => ZoomDrawer.of(context)!.toggle(),
            icon: Icon(Icons.menu)),
      ),
      body: Column(
        children: [
          Container(
            child: Image.asset("asset/menu/events_dinosaur.webp"),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Color(0xff000000)),
              child: Column(
                children: [
                  const SizedBox(height: 55,),
                  FormButton(title: 'Mega Events',
                      fillColor: C.backgroundColor,
                      borderColor: C.buttonColor,
                      onClick: (){
                        Navigator.pushNamed(context, S.routeMegaEvents);
                      }
                  ),
                  const SizedBox(height: 5,),
                    FormButton(title: 'Mini Events',
                              fillColor: C.backgroundColor,
                              borderColor: C.buttonColor,
                              onClick: (){
                                Navigator.pushNamed(context, S.routeMiniEvents);
                              }
                    ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
