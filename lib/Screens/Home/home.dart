import 'package:eclectika23_official_app/CustomWidgets/button.dart';
import 'package:eclectika23_official_app/CustomWidgets/frostedGlass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import '../../Constants/strings.dart';
import '../../CustomWidgets/loadingWidget.dart';
import '../../CustomWidgets/screen_background.dart';
import '../../Modals/users.dart';
import '../../constants/colors.dart';

import 'cubit/homeCubit.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late VideoPlayerController _controller;
  UserProfile? userProfile;

  @override
  void initState() {
    _getProfile(context);
    super.initState();
    _controller = VideoPlayerController.asset('asset/videos/intro.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.setVolume(0);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is HomeError) {
                print('oh no');
                ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message,style: TextStyle(color: C.gradientColor3),),backgroundColor: C.fieldColor,));
              }
              if(state is HomeSuccess) {
                print('fuck');
                  userProfile = state.userProfile;
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  const ScreenBackground(),
                  if (state is HomeLoading)
                    _buildLoading(context)
                  else
                    _buildSuccess(context, width, height),
                ],
              );
            }
        ),
    );
  }

  Widget _buildSuccess(BuildContext context, width, height){
    final List<String> entries = <String>[S.evnets, S.schedule, S.face, "${S.carousel}5.png"];
    final List<String> tag= <String>["Events", "Schedule", "Face of Eclectika", "About Us"];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
                width: width,
                height: height,
                child: Center(child: Image.asset("${S.carousel}5.png"))),
            Container(
              padding: EdgeInsets.only(top: 200),
              width: width,
              height: height,
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return MenuButton(width: width, imgPath:entries[index], tag: tag[index],
                    onTap: ()=>print("NAcho"),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){
                        //TODO: Add profile page
                      },
                        icon: Icon(Icons.person,color: C.vintageBackdrop1, size: 30.0,),),
                      IconButton(onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        print(FirebaseAuth.instance.currentUser);
                        Navigator.pushReplacementNamed(context, S.routeSplash);
                      },
                        icon: Icon(Icons.logout,color: C.vintageBackdrop1, size: 30.0,),),

                    ],
                  ),
                ),
                FrostedGlassBox1(
                    theWidth: width,
                    theChild: Column(
                      children: [
                        Text("ECLECTIKA'23", style: GoogleFonts.sen(fontSize: 40.0,color: C.vintageBackdrop1, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5.0,),
                        Align(alignment: Alignment.centerLeft ,child: Text("Let's start the", style: GoogleFonts.sen(fontSize: 30.0,color: C.gradientColor3, fontWeight: FontWeight.normal))),
                        Align(alignment: Alignment.centerLeft ,child: Text("Thunder.", style: GoogleFonts.sen(fontSize: 30.0,color: C.gradientColor, fontWeight: FontWeight.bold))),

                      ],
                    )),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLoading(BuildContext context) {
    return const LoadingScreen();
  }

  void _getProfile(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    cubit.getUser();
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







