import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:eclectika23_official_app/CustomWidgets/screen_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../Constants/colors.dart';
import '../../Constants/strings.dart';
import '../../CustomWidgets/button.dart';
import '../../CustomWidgets/customText.dart';

class MadAdsScreen extends StatelessWidget {
  const MadAdsScreen({Key? key}) : super(key: key);
  
  get controller => null;

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
              length: 2,
              child: Column(
                children: <Widget>[
                  ButtonsTabBar(
                    contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                    backgroundColor: C.vintageBackdrop3,
                    unselectedBackgroundColor: C.vintageBackdrop1,
                    labelStyle:
                    TextStyle(color: C.vintageBackdrop1, fontWeight: FontWeight.bold),
                    unselectedLabelStyle: TextStyle(
                        color: C.vintageBackdrop3, fontWeight: FontWeight.bold),
                    borderWidth: 1,
                    unselectedBorderColor: C.vintageBackdrop3,
                    radius: 200,
                    tabs: const [
                      Tab(
                        icon: Icon(Icons.slow_motion_video),
                        text: "Recents",
                      ),
                      Tab(
                        icon: Icon(Icons.slow_motion_video),
                        text: "Previous",
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ListView(
                          children: <Widget>[
                            //videoPlayer(controller: controller),
                            MenuButton(onTap: (){}, width: width, tag: "Events", imgPath: S.evnets),
                            MenuButton(onTap: (){}, width: width, tag: "Schedule", imgPath: S.evnets),
                            MenuButton(onTap: (){}, width: width, tag: "Face Of Eclectika", imgPath: S.evnets),
                            MenuButton(onTap: ()=>Navigator.pushNamed(context, S.routeMadAds), width: width, tag: "Mad Ads", imgPath: S.evnets),
                            MenuButton(onTap: (){}, width: width, tag: "Gallery", imgPath: S.evnets),
                            MenuButton(onTap: (){}, width: width, tag: "About Us", imgPath: S.evnets),
                          ],
                        ),
                        Center(
                          child: Icon(Icons.directions_transit),
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

class videoPlayer extends StatelessWidget {
  const videoPlayer({
    Key? key,
    required VideoPlayerController controller,
  }) : _controller = controller, super(key: key);

  final VideoPlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    );
  }
}
