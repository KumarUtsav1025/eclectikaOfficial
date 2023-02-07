import 'package:eclectika23_official_app/CustomWidgets/customText.dart';
import 'package:eclectika23_official_app/CustomWidgets/profile_card.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class ContactAppScreen extends StatefulWidget {
  const ContactAppScreen({super.key});

  @override
  State<ContactAppScreen> createState() => _ContactAppScreenState();
}

class _ContactAppScreenState extends State<ContactAppScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  @override
  Widget build(BuildContext context) {
  screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff000000),
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
        title: Padding(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: GradientText("App-Team",
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
        ),),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/welcomeCarousel/5.png"),
                fit: BoxFit.cover,
              )
            ),
          ),
          SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth / 20,
          ),
          child: Column(
            children: [
              const SizedBox(height: 40,),
              ProfileCard(name: "Kumar Utsav",domain: "Associate Coordinator",post: "App Developer",number: "7250241229",profileimage: "https://media.licdn.com/dms/image/C4D03AQEolcSpLuu4bg/profile-displayphoto-shrink_400_400/0/1657438458806?e=1681344000&v=beta&t=tyQxoL72IO46pbgA1UUU6lcOM6uhjAbDu9Xnp0hc6cY",),
              const SizedBox(height: 40,),
              ProfileCard(name: "Arko Bandyopadhyay",domain: "Associate Coordinator",post: "App Developer",number: "8349214046",profileimage: "https://media.licdn.com/dms/image/C4E03AQGkyx83xBup2w/profile-displayphoto-shrink_400_400/0/1636546357019?e=1681344000&v=beta&t=KqQRHV3yPVvsjeMrVkuyjhb8ZowDYxzae-eX48JD0r0",),
            ],
          ),
        ),
      ),
        ],
      ),
    );
  }
}
