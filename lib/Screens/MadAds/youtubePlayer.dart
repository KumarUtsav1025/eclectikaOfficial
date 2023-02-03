import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../Constants/colors.dart';
import '../../CustomWidgets/customText.dart';

class YoutubeMadAds extends StatefulWidget {
  String link;
  YoutubeMadAds({Key? key, required this.link}) : super(key: key);

  @override
  _YoutubeMadAdsState createState() => _YoutubeMadAdsState(link: link);
}

class _YoutubeMadAdsState extends State<YoutubeMadAds> {

  String link;
  _YoutubeMadAdsState({required this.link});
  late YoutubePlayerController Control;

  @override
  void initState() {
    Control = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(link)!);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              ),
          ),
        ),
      ),
      backgroundColor: C.vintageBackdrop4,
      body: SafeArea(
        child: YoutubePlayerBuilder(player: YoutubePlayer(
          controller: Control,
        ),
          builder: (context,player)=>Center(
            child: player,
          ),
        ),
      ),
    );
  }

}