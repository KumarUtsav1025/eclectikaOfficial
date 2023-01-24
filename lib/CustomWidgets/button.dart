import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/dimens.dart';
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
        margin: EdgeInsets.all(width*0.04),
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
        height: height*0.1,
        width: width*0.418,
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
        width: width*0.415,
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

