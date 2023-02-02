import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class EventMainScreen extends StatefulWidget {
  const EventMainScreen({Key? key}) : super(key: key);

  @override
  _EventMainScreenState createState() => _EventMainScreenState();
}

class _EventMainScreenState extends State<EventMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff000000),
          title: Text('Events',style: TextStyle(fontSize: 40,color: Color(0xffFFEBC1)),),
          leading: IconButton(
            onPressed: ()=>ZoomDrawer.of(context)!.toggle(), 
            icon: Icon(Icons.menu)
          ),
        ),
        body: Column(
          children: [
            Container(
              child: Image.asset("asset/menu/events_jurassic_park.png"),
            ),
            // Expanded(
            //   child: Container(
            //     decoration: BoxDecoration(color:Color(0xff000000)),
            //     child: Column(children: [
            //        Container(child: Row(children: [
            //         Container(
            //           height: MediaQuery.of(context).size.height*0.20,
            //           width: MediaQuery.of(context).size.width*0.2,
            //           child: Image.asset("assets/dinosaur_ready.png"),
            //         ),
            //         Container(
            //           decoration: BoxDecoration(border: Border.all(
            //             color: Color(0xffFFEBC1),
            //           )),
            //           child: Text("Mega Events"),
            //         )
            //        ],),)
            //     ]),
            //   )

            // ),
            Expanded(
              child: Container(
              decoration: BoxDecoration(color: Color(0xff000000)),
              child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.4,
                    child: ElevatedButton(
                      onPressed: (){}, 
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffD7A86E),
                        side: BorderSide(width:3, color:Colors.black87), //border width and color
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder( //to set border radius to button
                            borderRadius: BorderRadius.circular(40)
                        ),
                        padding: EdgeInsets.all(20), //content padding inside button
                      ),
                      child: const Text("MEGA EVENTS",style: TextStyle(fontSize: 30,color: Color(0xffFFEBC1)),)),
                    ),
                    SizedBox(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.4,
                    child: ElevatedButton(
                      onPressed: (){}, 
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffD7A86E),
                        side: BorderSide(width:3, color:Colors.black87), //border width and color
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder( //to set border radius to button
                            borderRadius: BorderRadius.circular(40)
                        ),
                        padding: EdgeInsets.all(20), //content padding inside button
                      ),
                      child: const Text("MINI EVENTS",style: TextStyle(fontSize: 30,color: Color(0xffFFEBC1)),)),
                    ),
                  ],
                ) ,
            ),),
          ],
        ),
    );
  }
}