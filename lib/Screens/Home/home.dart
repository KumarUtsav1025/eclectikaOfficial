import 'package:eclectika23_official_app/CustomWidgets/button.dart';
import 'package:eclectika23_official_app/CustomWidgets/frostedGlass.dart';
import 'package:eclectika23_official_app/Screens/events/events_main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import '../../Constants/strings.dart';
import '../../CustomWidgets/customText.dart';
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
  final _advancedDrawerController = AdvancedDrawerController();
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
      body: BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
        if (state is HomeError) {
          print('oh no');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              state.message,
              style: const TextStyle(color: C.gradientColor3),
            ),
            backgroundColor: C.fieldColor,
          ));
        }
        if (state is HomeSuccess) {
          print('fuck');
          userProfile = state.userProfile;
        }
      }, builder: (context, state) {
        return Stack(
          children: [
            const ScreenBackground(),
            if (state is HomeLoading)
              _buildLoading(context)
            else
              _buildSuccess(context, width, height),
          ],
        );
      }),
    );
  }

  Widget _buildSuccess(BuildContext context, width, height) {
    return AdvancedDrawer(
      backdropColor: C.primaryColor,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Color(0xff0E0207),
          iconColor: Color(0xff0E0207),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  S.profile,
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.person,
                  size: 30,
                ),
                title: Text(userProfile!.name,
                    style: GoogleFonts.sen(
                        fontSize: 20.0,
                        color: C.vintageBackdrop4,
                        fontWeight: FontWeight.bold)),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.phone,
                  size: 30,
                ),
                title: Text(userProfile!.contactNumber,
                    style: GoogleFonts.sen(
                        fontSize: 20.0,
                        color: C.vintageBackdrop4,
                        fontWeight: FontWeight.bold)),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.email,
                  size: 30,
                ),
                title: Text(userProfile!.email,
                    style: GoogleFonts.sen(
                        fontSize: 20.0,
                        color: C.vintageBackdrop4,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 170,
              ),
              FormButton(
                  title: 'Contact App Team',
                  fillColor: C.backgroundColor,
                  borderColor: C.buttonColor,
                  onClick: () {
                    Navigator.pushNamed(context, S.routeContactTeam);
                  }),
              const Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: const Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
      child: Container(
        color: const Color(0xff0E0207),
        width: width,
        height: height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                    width: width,
                    height: height,
                    child: Center(child: Image.asset("${S.carousel}5.png"))),
                Container(
                    padding: const EdgeInsets.only(top: 200),
                    width: width,
                    height: height,
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: <Widget>[
                        MenuButton(
                            onTap: () =>
                                Navigator.pushNamed(context, S.routeEvents),
                            width: width,
                            tag: "Events",
                            imgPath: S.events),
                        MenuButton(
                            onTap: () =>
                                Navigator.pushNamed(context, S.routeSponsors),
                            width: width,
                            tag: "Sponsors",
                            imgPath: S.sponsor),
                        MenuButton(
                            onTap: () =>
                                Navigator.pushNamed(context, S.routeMadAds),
                            width: width,
                            tag: "Mad Ads",
                            imgPath: "${S.carousel}5.png"),
                        MenuButton(
                            onTap: () =>
                                Navigator.pushNamed(context, S.routeGallery),
                            width: width,
                            tag: "Gallery",
                            imgPath: S.gallery),
                        MenuButton(
                            onTap: () =>
                                Navigator.pushNamed(context, S.routeTeam),
                            width: width,
                            tag: "About Us",
                            imgPath: S.team),
                      ],
                    )),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: _handleMenuButtonPressed,
                            icon: ValueListenableBuilder<AdvancedDrawerValue>(
                              valueListenable: _advancedDrawerController,
                              builder: (_, value, __) {
                                return AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 250),
                                  child: Icon(
                                    value.visible ? Icons.clear : Icons.person,
                                    color: C.vintageBackdrop1,
                                    size: 30.0,
                                    key: ValueKey<bool>(value.visible),
                                  ),
                                );
                              },
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              print(FirebaseAuth.instance.currentUser);
                              Navigator.pushReplacementNamed(
                                  context, S.routeSplash);
                            },
                            icon: const Icon(
                              Icons.logout,
                              color: C.vintageBackdrop1,
                              size: 30.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FrostedGlassBox1(
                        theWidth: width,
                        theChild: Column(
                          children: [
                            GradientText("ECLECTIKA",
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
                            const SizedBox(
                              height: 5.0,
                            ),
                            RichText(
                              text: const TextSpan(
                                text: "Let's start the ",
                                style: TextStyle(
                                    color: Color(0xffCA965C), fontSize: 24),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Thunder',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: C.buttonColor)),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return const LoadingScreen();
  }

  void _getProfile(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    cubit.getUser();
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}

class videoPlayer extends StatelessWidget {
  const videoPlayer({
    Key? key,
    required VideoPlayerController controller,
  })  : _controller = controller,
        super(key: key);

  final VideoPlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    );
  }
}
