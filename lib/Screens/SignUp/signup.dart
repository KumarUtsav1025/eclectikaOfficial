import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../CustomWidgets/button.dart';
import '../../CustomWidgets/frostedGlass.dart';
import '../../CustomWidgets/loadingWidget.dart';
import '../../CustomWidgets/screen_background.dart';
import '../../CustomWidgets/textfield.dart';
import '../../constants/colors.dart';
import '../../constants/dimens.dart';
import '../../constants/strings.dart';
import 'cubit/signUpCubit.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocConsumer<SignupCubit, SignupState>(
            listener: (context, state) {
              if (state is SignupError) {
                emailController.clear();
                passwordController.clear();
                confPasswordController.clear();
                nameController.clear();
                phoneController.clear();
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message, style: TextStyle(color: C.gradientColor3),),backgroundColor: C.fieldColor,));
              }
              else if (state is SignupSuccess) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("SignUp Successful", style: TextStyle(color: C.gradientColor3),),backgroundColor: C.fieldColor,));
                Navigator.pushReplacementNamed(context, S.routeLogin);
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  const ScreenBackground(),
                  if (state is SignupLoading)
                    _buildLoading(context)
                  else
                    _buildScreen(height, width, context),
                ],
              );
            }
        )
    );
  }

  Widget _buildLoading(BuildContext context) {
    return const LoadingScreen();
  }


  Widget _buildScreen(double height, double width, BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Center(child: Image.asset("${S.carousel}5.png"),),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(onPressed: () {
                    Navigator.pop(context);
                  },
                    icon: const Icon(Icons.arrow_back_outlined,
                      size: 32.0,
                    ),),
                ),
                SizedBox(height: 50,),
                Center(
                  child: Container(
                    height: height * 0.66,
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0),
                    child: FrostedGlassBox(
                      theWidth: width,
                      theChild: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: D.horizontalPadding *
                                      0.8),
                              child: Text("Create Account",
                                style: GoogleFonts.roboto(fontSize: 30,
                                    color: C.gradientColor3,
                                    letterSpacing: 0.01,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            CustomField(controller: nameController,
                              label: 'Name',
                              obsText: false,
                              icon: Icons.person,),
                            CustomField(controller: phoneController,
                              label: 'Phone Number',
                              obsText: false,
                              icon: Icons.phone,),
                            CustomField(controller: emailController,
                              label: 'Email',
                              obsText: false,
                              icon: Icons.email,),
                            CustomField(controller: passwordController,
                              label: 'Password',
                              obsText: true,
                              icon: Icons.password,),
                            CustomField(
                              controller: confPasswordController,
                              label: 'Confirm Password',
                              obsText: true,
                              icon: Icons.password,),
                            const SizedBox(
                              height: D.horizontalPadding * 0.5,),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: FormButton(
                                  title: 'Sign up',
                                  fillColor: C.backgroundColor,
                                  borderColor: C.gradientColor3,
                                  onClick: () {
                                    _signup(context);
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: D.horizontalPadding),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Already have an account? ',
                                  style: const TextStyle(
                                      color: C.gradientColor3,
                                      fontSize: 16),
                                  children: <TextSpan>[
                                    TextSpan(text: 'Login',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator
                                                .pushReplacementNamed(
                                                context, S.routeLogin);
                                          },
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: C.gradientColor)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
  void _signup(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    if (_formKey.currentState!.validate() && passwordController.text==confPasswordController.text) {
      cubit.signup(
        emailController.text,
        passwordController.text,
        nameController.text,
        phoneController.text,
      );
    }
    else if(passwordController.text!=confPasswordController.text){
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Confirm Password does not match Password",style: TextStyle(color: C.gradientColor3),),backgroundColor: C.fieldColor,));
    }
    else{
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Fill Form Cautiously!",style: TextStyle(color: C.gradientColor3),),backgroundColor: C.fieldColor,));
    }
  }
}







