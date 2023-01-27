import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Constants/dimens.dart';
import '../../Constants/strings.dart';
import '../../CustomWidgets/loadingWidget.dart';
import '../../CustomWidgets/screen_background.dart';
import '../../CustomWidgets/textfield.dart';
import '../../Modals/users.dart';
import '../../constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cubit/homeCubit.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  UserProfile? userProfile;
  @override
  void initState() {
    _getProfile(context);
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
              else if (state is SMSSuccess) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("SMS sent successfully!",style: TextStyle(color: C.gradientColor3),),backgroundColor: C.fieldColor,));
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
                  if (state is HomeLoading || state is ProfileLoading)
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
    return SafeArea(
      child: Text("Fuckk"),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return LoadingScreen();
  }

  void _getProfile(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    cubit.getUser();
  }
}







