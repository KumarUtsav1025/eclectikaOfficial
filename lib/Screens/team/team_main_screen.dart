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

  List<String> texts3= [
    "(Technical)",
    "(Technical)",
    "(Technical)",
    "(PR & Marketing)",
    "(PR & Marketing)",
    "(Design)",
    "(Technical)",
    "(PR & Marketing)",
    "(Design)",
    "(Documenting)",
    "(PR & Marketing)",
    "(Design)",
  ];
  List<String> texts2 = [
    "Managar",
    "Managar",
    "Managar",
    "Managar",
    "Managar",
    "Managar",
    "Managar",
    "Managar",
    "Managar",
    "Managar",
    "Managar",
    "Managar",
  ];
  List<String> texts = [
    "Arko Bandyopadhyay",
    "Aditya Prasad",
    "Avyukt R Kumar",
    "Arpit Bhatnagar",
    "Sahil Verma",
    "Neeraj yadu",
    "Utsav Kumar",
    "Utpal Singh",
    "Vivek Kumar",
    "Rahul Agrawal",
    "Paras Singh",
    "Viraj Chandra",
  ];
  List<String> texts4 = [
    "arkobandyopadhyay36@gmail.com",
    "arkobandyopadhyay36@gmail.com",
    "arkobandyopadhyay36@gmail.com",
    "arkobandyopadhyay36@gmail.com",
    "arkobandyopadhyay36@gmail.com",
    "arkobandyopadhyay36@gmail.com",
    "arkobandyopadhyay36@gmail.com",
    "arkobandyopadhyay36@gmail.com",
    "arkobandyopadhyay36@gmail.com",
    "arkobandyopadhyay36@gmail.com",
    "arkobandyopadhyay36@gmail.com",
    "arkobandyopadhyay36@gmail.com",
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
          title: const Text('About Us',style: TextStyle(fontSize: 30,color: Color(0xffFFEBC1)),),
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
                image: AssetImage("assets/sponsors_jungle3.jpg"),
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
                  backgroundImage: AssetImage("asset/menu/human.jpg"),
                  radius: 50,
                ),
                SizedBox(width: 20,),
                Column(
                  children: [
                    SizedBox(height: 25,),
                    Text(
                      "${texts[index]}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "${texts2[index]}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "${texts3[index]}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "${texts4[index]}",
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
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