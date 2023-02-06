import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

import '../../Constants/colors.dart';



class EventDetailScreen extends StatelessWidget {
  EventDetailScreen({super.key, required this.element});
  Map<String, String> element;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
        title: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
              element["Name of the events"].toString(),
            style: TextStyle(fontSize: 40, color: Color(0xffFFEBC1)),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        color: C.vintageBackdrop2,
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(element["Image"].toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text("Description: ${element["Description "].toString()}", style: GoogleFonts.sen(fontSize: 18.0,color: C.vintageBackdrop4, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text("No. of Rounds: ${element["No. of Rounds"].toString()}", style: GoogleFonts.sen(fontSize: 18.0,color: C.vintageBackdrop4, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text("Venue: ${element["Venue"].toString()}", style: GoogleFonts.sen(fontSize: 18.0,color: C.vintageBackdrop4, fontWeight: FontWeight.bold)),
            ),
            Align(alignment:Alignment.centerLeft, child: Text("Time: ${element["Time"].toString()}", style: GoogleFonts.sen(fontSize: 18.0,color: C.vintageBackdrop4, fontWeight: FontWeight.bold))),
          ],
        ),
      ),
    );
  }
}

