import 'package:eclectika23_official_app/Screens/gallery/models.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final DataModel data;
  const DetailsScreen({Key? key, required this.data}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
        iconTheme: const IconThemeData(color: Color(0xffFFEBC1)),
        elevation: 0,
      ),
      body: Container(
        color: Color(0xff000000),
        child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            //we can add Text here...
            // child: Text(
            //   widget.data.title,
            //   style: const TextStyle(
            //       color: Colors.black87,
            //       fontSize: 25,
            //       fontWeight: FontWeight.bold),
            // ),
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Hero(
                  tag: widget.data.imageName,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff000000),
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage(
                              widget.data.imageName,
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
              )),
          // Expanded(
          //   flex: 1,
          //   child: Padding(
          //     padding: const EdgeInsets.only(bottom: 20),
          //     child: Text(
          //       "Price \$${widget.data.price}",
          //       style: const TextStyle(
          //           color: Colors.black54,
          //           fontSize: 24,
          //           fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ),
        ],
      ),
    ),);
  }
}
