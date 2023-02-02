import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eclectika23_official_app/Screens/gallery/details.dart';
import 'package:eclectika23_official_app/Screens/gallery/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter/material.dart';

class GalleryMainScreen extends StatefulWidget {
  const GalleryMainScreen({Key? key}) : super(key: key);

  @override
  _GalleryMainScreenState createState() => _GalleryMainScreenState();
}


class _GalleryMainScreenState extends State<GalleryMainScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff000000),
          title: Text('Gallery',style: TextStyle(fontSize: 40,color: Color(0xffFFEBC1)),),
          leading: IconButton(
            onPressed: ()=>ZoomDrawer.of(context)!.toggle(), 
            icon: Icon(Icons.menu),
          ),
        ),
      body: Stack(
          children: <Widget>[
            Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("asset/welcomeCarousel/2.png"),fit: BoxFit.cover),
              
            ),  
            child: Column(
              children: [
                //we need good quotes related Jurassic gallery
                const Padding(
              padding: EdgeInsets.all(40.0),
              // child: Center(
              //   child: Text("Welcome ...to Jurassic Gallery",
              //       style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           color: Color(0xff000000),
              //           fontSize: 35)),
              // ),
            ),
            AspectRatio(
              aspectRatio: 0.85,
              child: PageView.builder(
                  itemCount: dataList.length,
                  physics: const ClampingScrollPhysics(),
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return carouselView(index);
                  }),
            ),
              ],
            ),), 
          ],
      ),
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.038).clamp(-1, 1);
          print("value $value index $index");
        }
        return Transform.rotate(
          angle: pi * value,
          child: carouselCard(dataList[index]),
        );
      },
    );
  }

  Widget carouselCard(DataModel data) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Hero(
              tag: data.imageName,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(data: data)));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage(
                            data.imageName,
                          ),
                          fit: BoxFit.fill),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            color: Colors.black26)
                      ]),
                ),
              ),
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(top: 20),
        //   child: Text(
        //     data.title,
        //     style: const TextStyle(
        //         color: Colors.white,
        //         fontSize: 25,
        //         fontWeight: FontWeight.bold),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Text(
        //     "\$${data.price}",
        //     style: const TextStyle(
        //         color: Colors.white,
        //         fontSize: 16,
        //         fontWeight: FontWeight.bold),
        //   ),
        // )
      ],
    );
  }
}