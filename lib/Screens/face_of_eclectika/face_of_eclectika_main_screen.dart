import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class FaceOfEclectikaMainScreen extends StatefulWidget {
  const FaceOfEclectikaMainScreen({Key? key}) : super(key: key);

  @override
  _FaceOfEclectikaMainScreenState createState() => _FaceOfEclectikaMainScreenState();
}

class _FaceOfEclectikaMainScreenState extends State<FaceOfEclectikaMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Main Screen'),
          leading: IconButton(
            onPressed: ()=>ZoomDrawer.of(context)!.toggle(), 
            icon: Icon(Icons.menu)
          ),
        ));
  }
}