import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/dimens.dart';

class CustomField extends StatelessWidget {
  const CustomField({required this.controller, required this.label, super.key, required this.icon, required this.obsText});
  final TextEditingController controller;
  final bool obsText;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: D.horizontalPadding*0.7, vertical: D.verticalPadding*0.4),
        child: Container(decoration: BoxDecoration(
        color: C.backgroundColor,
        borderRadius: BorderRadius.circular(15)
        ),
        height: 48,
          child:Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: TextFormField(
              controller: controller,
              validator: _validator,
              keyboardType: TextInputType.name,
              style: const TextStyle(
                color: C.buttonColor,
                fontSize: D.inputFieldFontSize*0.8,
              ),
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              obscureText: obsText,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                border:InputBorder.none ,
                errorStyle: const TextStyle(fontSize: 0.1),
                prefixIcon: Icon(
                  icon,
                  size: D.iconSize,
                  color: C.buttonColor,
                ),
                hintText: label,
                hintStyle: TextStyle(color: C.buttonColor,
                  fontSize: D.inputFieldFontSize,)
              ),
            ),
          )
      )
    );
  }

  String? _validator(String? name) => name!.isEmpty ? "" : null;
}

class CustomField1 extends CustomField {
  CustomField1({required super.controller, required super.label, required super.icon, required super.obsText});

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
        color: C.backgroundColor,
        borderRadius: BorderRadius.circular(15)
    ),
        height: 50,
        child:TextFormField(
          controller: controller,
          validator: _validator,
          keyboardType: TextInputType.name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: D.inputFieldFontSize*0.85,
          ),
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.next,
          obscureText: obsText,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            border:InputBorder.none ,
            errorStyle: const TextStyle(fontSize: 0.1),
            hintText: label,
          ),
        )
    );
  }

  String? _validator(String? name) => name!.isEmpty ? "" : null;
}

class PhoneField extends CustomField{
  PhoneField({required super.controller, required super.label, required super.icon, required super.obsText});

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: D.horizontalPadding*0.7, vertical: D.verticalPadding*0.5),
        child: Container(decoration: BoxDecoration(
            color: C.backgroundColor,
            borderRadius: BorderRadius.circular(15)
        ),
            height: 50,
            child:Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: TextFormField(
                controller: controller,
                validator: _validator,
                keyboardType: TextInputType.phone,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: D.inputFieldFontSize*0.85,
                ),
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                obscureText: obsText,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  border:InputBorder.none ,
                  errorStyle: const TextStyle(fontSize: 0.1),
                  prefixIcon: Icon(
                    icon,
                    size: D.iconSize,
                    color: C.buttonColor,
                  ),
                  hintText: label,
                ),
              ),
            )
        )
    );
  }

  String? _validator(String? name) => name!.isEmpty ? "" : null;
}