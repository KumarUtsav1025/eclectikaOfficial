import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String domain;
  final String post;
  final String number;
  final String profileimage;
  const ProfileCard(
      {Key? key,
      required this.name,
      required this.domain,
      required this.post,
      required this.number,
      required this.profileimage,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: SizedBox(
      height: 250,
      width: 350,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 180,
              width: 350,
              decoration: BoxDecoration(
                color: Color(0xffD7A86E),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),

          //use the positioned widget to place

          Positioned(
            top: 0,
            right: 40,
            child: Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                  color: Colors.green, shape: BoxShape.circle),
              child: CircleAvatar(
                foregroundImage: NetworkImage(profileimage),
                radius: 30,
              ),
            ),
          ),

          Positioned(
            top: 65,
            left: 40,
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700),
            ),
          ),

          Positioned(
            top: 100,
            left: 40,
            child: Text(
              domain,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500),
            ),
          ),

          Positioned(
            top: 120,
            left: 40,
            child: Text(
              post,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500),
            ),
          ),

          Positioned(
            bottom: 55,
            left: 20,
            child: SizedBox(
              width: 300,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.phone),
                    AutoSizeText.rich(
                        TextSpan(
                          text: number,
                         style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500), // default text style
                        ),
                        minFontSize: 0,
                        stepGranularity: 0.1,
                    ),
                  ],
                ),
              ]),
            ),
          ),
          const Positioned(
            right: 40,
            top: 85,
            child: Center(
              child: Text(
                "View Profile",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          )
        ],
      ),
    ),);
  }
}
