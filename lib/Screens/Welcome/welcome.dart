import 'dart:ui';
import 'package:eclectika23_official_app/CustomWidgets/screen_background.dart';
import 'package:eclectika23_official_app/Screens/Welcome/network.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../CustomWidgets/button.dart';
import '../../CustomWidgets/customBanner.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';

class Welcome extends StatelessWidget {
  Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    List<Widget> listBanners = [
      customBanner(imagePath: '${S.carousel}1.png', text: '${S.text1[0]}', height: height, width: width),
      customBanner(imagePath: '${S.carousel}2.png', text: '${S.text1[1]}', height: height, width: width),
    ];

    return Scaffold(
        backgroundColor: Colors.black54,
        body: Stack(
          children: [
            const ScreenBackground(),
            InitialPage(height: height, listBanners: listBanners),
          ],
        )
    );
  }
}

class InitialPage extends StatefulWidget {
  const InitialPage({
    Key? key,
    required this.height,
    required this.listBanners,
  }) : super(key: key);

  final double height;
  final List<Widget> listBanners;

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int current =0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.0,),
            Center(
              child: Text("ECLECTIKA'23",
                style: GoogleFonts.bebasNeue(fontSize: 64,color: C.buttonColor),
              ),
            ),
            SizedBox(height: 5.0,),
            SizedBox(
              height: widget.height*0.73,
              child: PageView(
                onPageChanged: (int index){
                  current = index;
                },
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: widget.listBanners,
              ),
            ),
            //Bottom buttons
            Row(
              children: [
                CustomButton(title: "Skip", fillColor: C.backgroundColor,
                  borderColor: C.buttonColor,
                  onClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FinalPage()),
                    );
                  },
                ),
                CustomButton(title: "Next", fillColor: C.backgroundColor,
                  borderColor: C.buttonColor,
                  onClick: () {
                    if (_pageController.hasClients) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                      );
                    }
                    if(current>=1){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FinalPage()),
                      );
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



class FinalPage extends StatelessWidget {
  FinalPage({Key? key}) : super(key: key);
  SkipLogin skipLogin = SkipLogin();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const ScreenBackground(),
          SafeArea(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 15.0,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset('${S.carousel}5.png',fit: BoxFit.cover,),
                ),
                const SizedBox(height: 15.0,),
                Text("ECLECTIKA", style: GoogleFonts.sen(fontSize: 38.0,color: C.primaryColor, fontWeight: FontWeight.bold)),
                Center(child: Text("The Cultural Event at NIT Raipur", style: GoogleFonts.sen(fontSize: 20.0,color: Colors.white))),
                const SizedBox(height: 25.0,),
                Center(child: Text("---Register to Continue---", style: GoogleFonts.sen(fontSize: 18.0,color: Colors.white))),
                const SizedBox(height: 5.0,),
                Row(
                  children: [
                    FormButton1(title: 'Signup',
                        fillColor: C.backgroundColor,
                        borderColor: C.buttonColor,
                        onClick: (){
                          Navigator.pushReplacementNamed(context, S.routeSignup);
                        }
                    ),
                    FormButton1(title: 'Login',
                        fillColor: C.backgroundColor,
                        borderColor: C.buttonColor,
                        onClick: (){
                          Navigator.pushReplacementNamed(context, S.routeLogin);
                        }
                    ),
                  ],
                ),
                FormButton(title: 'Continue as Guest',
                    fillColor: C.backgroundColor,
                    borderColor: C.buttonColor,
                    onClick: () async {
                      await skipLogin.welcome(emailAddress: "dinosaur@eclectika.com", password: "dinosaur2023");
                      Navigator.pushReplacementNamed(context, S.routeSplash);
                    }
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}






