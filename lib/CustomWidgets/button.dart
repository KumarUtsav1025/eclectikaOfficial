import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/dimens.dart';
import '../Constants/strings.dart';
import '../constants/colors.dart';


class CustomButton extends StatelessWidget {
  String title;
  Color fillColor;
  Color borderColor;
  final VoidCallback? onClick;
  CustomButton({
    Key? key,
    required this.title,
    required this.fillColor,
    required this.borderColor,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      splashColor: C.gradientColor,
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.all(width*0.01),
        decoration: BoxDecoration(
            color: fillColor,
            border: Border.all(color: borderColor, width: 3.0),
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: [
              BoxShadow(
                color: borderColor,
                spreadRadius: 0.5,
                blurRadius: 5.0,
              )
            ]
        ),
        height: height*0.08,
        width: width*0.455,
        child: Center(
          child: Text(title,
            style: GoogleFonts.cabin(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: borderColor
            ),
          ),
        ),
      ),
    );
  }
}

class FormButton extends StatelessWidget {
  String title;
  Color fillColor;
  Color borderColor;
  final VoidCallback? onClick;
  FormButton({
    Key? key,
    required this.title,
    required this.fillColor,
    required this.borderColor,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onClick,
      splashColor: C.gradientColor,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal:width*0.045, vertical: 10),
        decoration: BoxDecoration(
            color: fillColor,
            border: Border.all(color: borderColor, width: 3.0),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: borderColor,
                spreadRadius: 0.5,
                blurRadius: 5.0,
              )
            ]
        ),
        height: height*0.075,
        width: width*0.8,
        child: Center(
          child: Text(title,
            style: GoogleFonts.cabin(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: borderColor
            ),
          ),
        ),
      ),
    );
  }
}

class FormButton1 extends StatelessWidget{
  String title;
  Color fillColor;
  Color borderColor;
  final VoidCallback? onClick;
  FormButton1({
    Key? key,
    required this.title,
    required this.fillColor,
    required this.borderColor,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onClick,
      splashColor: C.gradientColor,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal:width*0.045, vertical: 10),
        decoration: BoxDecoration(
            color: fillColor,
            border: Border.all(color: borderColor, width: 3.0),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: borderColor,
                spreadRadius: 0.5,
                blurRadius: 5.0,
              )
            ]
        ),
        height: height*0.075,
        width: width*0.4,
        child: Center(
          child: Text(title,
            style: GoogleFonts.cabin(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: borderColor
            ),
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  MenuButton({Key? key, required this.onTap ,required this.width, required this.tag, required this.imgPath}) : super(key: key);

  double width;
  String imgPath;
  String tag;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 130,
      width: width*0.8,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            width: width,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: C.primaryColor,
              borderRadius: BorderRadius.circular(10.0)
            ),
            height: 110,
            child: Padding(
              padding: EdgeInsets.only(left:120),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(alignment: Alignment.center,child: Text(tag, style: GoogleFonts.sen(fontSize: 25.0,color: C.vintageBackdrop4, fontWeight: FontWeight.bold))),
                  Align(alignment: Alignment.bottomRight,
                      child: GestureDetector(child: Icon(Icons.login),
                        onTap: onTap,
                      ),
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(imgPath),
          ),
        ],
      ),
    );
  }
}


class ProfileButton extends StatelessWidget {
  String title;
  Color fillColor;
  Color borderColor;
  IconData primaryIcon;
  IconData secondaryIcon;
  final VoidCallback? onClick;
  ProfileButton({
    Key? key,
    required this.title,
    required this.fillColor,
    required this.borderColor,
    required this.primaryIcon,
    required this.secondaryIcon,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onClick,
      splashColor: C.gradientColor,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal:width*0.045, vertical: 10),
        decoration: BoxDecoration(
            color: fillColor,
            border: Border.all(color: borderColor, width: 3.0),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: borderColor,
                spreadRadius: 0.5,
                blurRadius: 5.0,
              )
            ]
        ),
        height: height*0.075,
        width: width*0.75,
        child: Row(
          children: [
            Expanded(
              flex: 3,
                child: Icon(primaryIcon, color: borderColor, size: D.iconSize*0.92,),
            ),
            Expanded(
              flex: 7,
              child: Center(
                child: Text(title,
                  style: GoogleFonts.cabin(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: borderColor
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
                child: Icon(secondaryIcon, color: borderColor, size: D.iconSize*0.92,),
            )
          ],
        ),
      ),
    );
  }
}

