import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../Constants/strings.dart';


class EventCard extends StatelessWidget {
  final Map<String, String> event;

  const EventCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ratio = MediaQuery.of(context).size.aspectRatio;
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 22.5),
            child: Container(
              decoration: BoxDecoration(
                color: C.vintageBackdrop2,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Stack(
                  children: [
                    ExpansionTile(
                      title: Container(
                        //To decrease bottom of card
                        height: ratio > 0.5 ? 150 : 170,
                        margin: EdgeInsets.only(left: ratio > 0.5 ? 110 : 130),
                        padding: EdgeInsets.only(bottom: 40, top: 19),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              event["Name of the events"].toString(),
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 18,
                                color: C.vintageBackdrop4,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height:10,),
                            AutoSizeText(
                              "Time:" + "\t" * 3 + "${event["Name of the events"].toString()}",
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 13,
                                color: C.vintageBackdrop4,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            AutoSizeText(
                              "Venue:" + "\t" + "${event["Venue"].toString()}",
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 15,
                                color: C.vintageBackdrop4,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child:
                          Text(
                            event["Description "].toString(),
                            style: TextStyle(color: C.vintageBackdrop4,),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: -6,
          height: ratio > 0.5 ? 190 : 210,
          width: ratio > 0.5 ? 140 : 160,
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: Offset(0.0, 5),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    backgroundImage: AssetImage(S.face),
                    radius: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
