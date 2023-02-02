import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

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
    "Microsoft",
    "Amazon",
    "Adobe",
    "Flipkart",
    "Netfix",
    "Facebook",
    "Samsung",
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
          backgroundColor:Color(0xff000000),
          title: Text('Sponsors',style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w500,
              color: Color(0xffFFEBC1),
            ),),
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
                image: AssetImage("asset/menu/sponsors_jungle2.jpg"),
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
                  ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: texts.length,
                    itemBuilder: (context, index) {
                      return item(index);
                    },
                  ),
                  const SizedBox(height: 50,),
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
      height: 70,
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
        color: Color(0xff3C2317),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // CircleAvatar(
          //   child: Image.asset("assets/dinosaur_ready.png"),
          // ),
          Align(
          alignment: Alignment.center,
          child: Text(
            "${texts[index]}",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Color(0xffFFEBC1),
            ),
          ),),
        ],
      ),
    );
  }

}