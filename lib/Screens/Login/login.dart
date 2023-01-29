import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../CustomWidgets/button.dart';
import '../../CustomWidgets/frostedGlass.dart';
import '../../CustomWidgets/loadingWidget.dart';
import '../../CustomWidgets/screen_background.dart';
import '../../CustomWidgets/textfield.dart';
import '../../Modals/global_state.dart';
import '../../constants/colors.dart';
import '../../constants/dimens.dart';
import '../../constants/strings.dart';
import 'cubit/loginCubit.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginError) {
              emailController.clear();
              passwordController.clear();
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message,style: TextStyle(color: C.gradientColor3),),backgroundColor: C.fieldColor,));
            }
            else if (state is LoginSuccess) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Login Successful",style: TextStyle(color: C.gradientColor3),),backgroundColor: C.fieldColor,));
              Navigator.pushReplacementNamed(context, S.routeSplash);
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                const ScreenBackground(),
                if (state is LoginLoading)
                  _buildLoading(context)
                else
                  _buildSuccess(height, width, context),
              ],
            );
          }
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return LoadingScreen();
  }

  void _login(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    if (_formKey.currentState!.validate()) {
      cubit.login(
        emailController.text,
        passwordController.text,
      );
    }
    else{
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Fill Form Cautiously",style: TextStyle(color: C.gradientColor3),),backgroundColor: C.fieldColor,));
    }
  }
  Widget _buildSuccess(double height, double width, BuildContext context) {
    return SafeArea(
          child: Stack(
            children: [
              Center(child: Image.asset("${S.carousel}5.png"),),
              Center(
                child: Container(
                  height: height*0.48,
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: FrostedGlassBox(
                    theWidth: width,
                    theChild: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: D.horizontalPadding*1.4,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: D.horizontalPadding*0.8),
                            child: Text("Welcome!",
                              style: GoogleFonts.roboto(color: C.primaryColor,
                                  fontSize: 30, letterSpacing: 0.01, fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: D.horizontalPadding*0.12,),
                          CustomField(controller: emailController, label:'Email', obsText: false, icon: Icons.email, ),
                          CustomField(controller: passwordController, label:'Password', obsText: true, icon: Icons.password,),
                          const SizedBox(height: D.horizontalPadding*0.4,),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: FormButton(
                                title: 'Log in',
                                fillColor: C.backgroundColor,
                                borderColor: C.gradientColor3,
                                onClick: (){
                                  _login(context);
                                }
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: D.horizontalPadding),
                            child: RichText(
                              text: TextSpan(
                                text: "Haven't registered yet? ",
                                style: const TextStyle( color: C.gradientColor3, fontSize: 16),
                                children: <TextSpan>[
                                  TextSpan(text: 'Sign up',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushReplacementNamed(context, S.routeSignup);
                                        },
                                      style: const TextStyle(fontWeight: FontWeight.bold, color: C.buttonColor)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 30.0,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton(onPressed: () {
                  Navigator.pop(context);
                },
                  icon: const Icon(Icons.arrow_back_outlined,
                    size: 32.0,
                  ),),
              ),
            ],
          ),
        );
  }
}







