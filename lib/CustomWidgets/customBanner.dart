import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customBanner({required String imagePath, required String text, required double height, required double width}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.asset(imagePath,fit: BoxFit.cover,),
      ),
      const SizedBox(height: 10.0,),
      Text(text, style: GoogleFonts.sen(fontSize: 32.0,color: Colors.white))
    ],
  );
}
