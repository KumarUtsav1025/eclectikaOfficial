import 'package:auto_size_text/auto_size_text.dart';
import 'package:eclectika23_official_app/Constants/colors.dart';
import 'package:eclectika23_official_app/CustomWidgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class TeamMainScreen extends StatefulWidget {
  const TeamMainScreen({Key? key}) : super(key: key);

  @override
  _TeamMainScreenState createState() => _TeamMainScreenState();
}

class _TeamMainScreenState extends State<TeamMainScreen> {
  double screenHeight = 0;
  double screenWidth = 0;

  bool startAnimation = false;
  List<String> imageList= [
    "asset/menu/IMG_20230109_232416.jpg",
    "asset/menu/IMG20221230105957.jpg",
    "asset/menu/IMG_20211220_162846.jpg",
    "asset/menu/Snapchat-638023064.jpg",
    "asset/menu/Krishna Agrawal_official.jpg",
    "asset/menu/IMG_20230110_003536-01.jpeg",
    "asset/menu/IMG_20221008_230040.jpg",
    "asset/menu/1670776276642.jpg",
    "asset/menu/havilah3.jpg",
    "asset/menu/shruti3.jpg",
    "asset/menu/Screenshot_2023-01-09-22-55-25-21_6012fa4d4ddec268fc5c7112cbb265e7.jpg",
    "asset/menu/IMG_20220402_105113.jpg",
    "asset/menu/IMG-20192939.jpeg",
    "asset/menu/1671904128344.jpg",
    "asset/menu/IMG_20211019_142559_514.jpg",
    "asset/menu/95805.jpeg",
    "asset/menu/WhatsApp Image 2023-02-03 at 23.56.02.jpg",
  ];

  List<String> texts3= [
    "Event Management",
    "Event Management",
    "Event Management",
    "Public Relations",
    "Event Management",
    "Event Management",
    "Creatives",
    "Creatives",
    "Creatives",
    "Documnent",
    "Sponsorship",
    "Sponsorship",
    "Sponsorship",
    "Public Relations",
    "Public Relations",
    "Public Relations",
    "Technical",
  ];
  List<String> texts2 = [
    "CSE",
    "CIVIL",
    "META",
    "CSE",
    "Bio-med",
    "CIVIL",
    "MECH",
    "CHEM",
    "CHEM",
    "CHEM",
    "META",
    "CHEM",
    "CIVIL",
    "BT",
    "EE",
    "EE",
    "IT",
  ];
  List<String> texts = [
    "R.Vamshi",
    "B.Saketh",
    "Majji Yaswanth Sai",
    "Gowtham kilaru",
    "Krishna Agrawal",
    "Sathwik reddy ",
    "Ashwin Sudhir Umale",
    "Govind",
    "Havilah",
    "Shruti",
    "Pawan ",
    "Rashi Sahu",
    "Yash Samarth",
    "Suraj",
    "Umakant",
    "K S Laasya",
    "Vivek kumar",
  ];
  List<String> texts4 = [
    "8668873065",
    "9550123649",
    "9691988661",
    "6372048153",
    "9893143930",
    "7093675886",
    "8982690492",
    "7386386675",
    "8688989980",
    "8349428617",
    "9902073785",
    "9479283088",
    "8085204422",
    "9399761604",
    "7089997141",
    "8790799404",
    "9413091835",
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
          child: GradientText("About Us",
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
            onPressed: ()=>ZoomDrawer.of(context)!.toggle(), 
            icon: Icon(Icons.menu)
          ),
        ),
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
              const SizedBox(height: 30,),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: texts.length,
                itemBuilder: (context, index) {
                  return item(index);
                },
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
      height: 120,
      width: screenWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 200)),
      transform: Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
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
                CircleAvatar(
                  foregroundImage: AssetImage(imageList[index]),
                  radius: 50,
                ),
                SizedBox(width: 20,),
                Column(
                  children: [
                    SizedBox(height: 25,),
                    AutoSizeText.rich(
                        TextSpan(
                          text: "${texts[index]}",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.w500,), // default text style
                        ),
                        minFontSize: 0,
                        stepGranularity: 0.1,
                      ),
                      AutoSizeText.rich(
                        TextSpan(
                          text: "${texts2[index]}",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.w500,), // default text style
                        ),
                        minFontSize: 0,
                        stepGranularity: 0.1,
                      ),
                    AutoSizeText.rich(
                        TextSpan(
                          text: "${texts3[index]}",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.w500,), // default text style
                        ),
                        minFontSize: 0,
                        stepGranularity: 0.1,
                      ),
                    AutoSizeText.rich(
                        TextSpan(
                          text: "${texts4[index]}",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.w500,), // default text style
                        ),
                        minFontSize: 0,
                        stepGranularity: 0.1,
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