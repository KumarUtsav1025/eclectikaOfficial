import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:eclectika23_official_app/CustomWidgets/screen_background.dart';
import 'package:eclectika23_official_app/Screens/MadAds/youtubePlayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../../Constants/MadAdsLinks.dart';
import '../../Constants/colors.dart';
import '../../Constants/strings.dart';
import '../../CustomWidgets/button.dart';
import '../../CustomWidgets/customText.dart';

class MadAdsScreen extends StatelessWidget {
  const MadAdsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.only(left: 15,),
          child: GradientText("Mad Ads",
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
      ),
      backgroundColor: C.vintageBackdrop4,
      body: SafeArea(
        child: Stack(
          children: [
            const ScreenBackground(),
            DefaultTabController(
              length: 4,
              child: Column(
                children: <Widget>[
                  ButtonsTabBar(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                    backgroundColor: C.vintageBackdrop3,
                    unselectedBackgroundColor: C.vintageBackdrop1,
                    labelStyle:
                    const TextStyle(color: C.vintageBackdrop1, fontWeight: FontWeight.bold),
                    unselectedLabelStyle: const TextStyle(
                        color: C.vintageBackdrop3, fontWeight: FontWeight.bold),
                    borderWidth: 1,
                    unselectedBorderColor: C.vintageBackdrop3,
                    radius: 200,
                    tabs: const [
                      Tab(
                        icon: Icon(Icons.slow_motion_video),
                        text: "2023",
                      ),
                      Tab(
                        icon: Icon(Icons.slow_motion_video),
                        text: "2020",
                      ),
                      Tab(
                        icon: Icon(Icons.slow_motion_video),
                        text: "2019",
                      ),
                      Tab(
                        icon: Icon(Icons.slow_motion_video),
                        text: "2018",
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ListView(
                            children: videoTabs(year: "2023")
                        ),
                        ListView(
                            children: videoTabs(year: "2020")
                        ),
                        ListView(
                            children: videoTabs(year: "2019")
                        ),
                        ListView(
                            children: videoTabs(year: "2018")
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<VideoTab> videoTabs({required String year}){
  List<VideoTab> videoList = [];
  madAds[year]?.forEach((element) {
    videoList.add(VideoTab(img: element['img'], link: element['link'], desc:element['description'], title: element['title']));
  });
  return videoList;
}

class VideoTab extends StatelessWidget {
  String img;
  String link;
  String title;
  String desc;


  VideoTab({required this.img, required this.link, required this.desc, required this.title});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.all(10),
      color: C.vintageBackdrop2,
      padding: const EdgeInsets.all(10.0),
      height: height*0.4,
      width: width,
      child: Stack(
        children: [
          Image.network(img,fit: BoxFit.cover,),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>YoutubeMadAds(link: link)));
                  },
                    child: Icon(Icons.play_arrow_rounded, color: C.vintageBackdrop2,size: 80.0,),
                ),
              ),
              Text(title,
                maxLines: 1,
                style: GoogleFonts.roboto(color: C.primaryColor,
                  fontSize: 25, letterSpacing: 0.01, fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(desc,maxLines: 2,),
              )
            ],
          ),

        ],
      ),
    );
  }
}
