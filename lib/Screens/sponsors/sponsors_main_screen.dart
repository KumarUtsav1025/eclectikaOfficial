import 'package:eclectika23_official_app/Constants/colors.dart';
import 'package:eclectika23_official_app/CustomWidgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SponsorsMainScreen extends StatefulWidget {
  const SponsorsMainScreen({Key? key}) : super(key: key);

  @override
  _SponsorsMainScreenState createState() => _SponsorsMainScreenState();
}

class _SponsorsMainScreenState extends State<SponsorsMainScreen> {
  double screenHeight = 0;
  double screenWidth = 0;

  bool startAnimation = false;
  List<String> texts = [
    "Inside me",
    "Sparkcars",
    "LIC",
    "Press Information bureau",
    "Rebounce Raipur",
    "AB Classes",
    "Raag-The music academy",
    "Raag music cafe",
    "Sargam musicals",
    "Sjain",
    "जन धारा 24",
    "Swadesh News",
    "VIP News",
    "TV27News"
  ];
  List<String> imageList = [
    "asset/menu/inside_me5.jpg",
    "asset/menu/sparkcars2.jpg",
    "asset/menu/lic2.jpg",
    "asset/menu/pib2.jpg",
    "asset/menu/rebounce2.jpg",
    "asset/menu/ab_classes2.jpg",
    "asset/menu/raag_music_academy2.jpg",
    "asset/menu/raag_music_cafe2.jpg",
    "asset/menu/sargam_musicals2.jpg",
    "asset/menu/sjain.jpg",
    "asset/menu/jan_dhara.jpg",
    "asset/menu/swadesh_news.jpg",
    "asset/menu/vip_news.jpg",
    "asset/menu/tv24news.jpg",
  ];
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
        title: Padding(
          padding: const EdgeInsets.only(left: 15,),
          child: GradientText("Sponsors",
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
        leading: IconButton(
            onPressed: () => ZoomDrawer.of(context)!.toggle(),
            icon: Icon(Icons.menu)),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("asset/welcomeCarousel/5.png"),
              fit: BoxFit.cover,
            )),
          ),
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 20,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: texts.length,
                    itemBuilder: (context, index) {
                      return item(index);
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget item(int index) {
    return AnimatedContainer(
      height: 100,
      width: screenWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 200)),
      transform:
          Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth / 20,
      ),
      decoration: BoxDecoration(
        color: Color(0xffD7A86E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Center(child:CircleAvatar(
                  foregroundImage: AssetImage(imageList[index]),
                  radius: 40,
                ),),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: AutoSizeText.rich(
                        TextSpan(
                          text: texts[index],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight:
                                  FontWeight.bold), // default text style
                        ),
                        minFontSize: 0,
                        stepGranularity: 0.1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
