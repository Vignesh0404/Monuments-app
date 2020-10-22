import 'package:flutter/material.dart';
import 'package:travelapp/screens/monumentDetails.dart';
import 'package:travelapp/screens/myReviews.dart';
import 'styles.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Monuments extends StatefulWidget {
  Monuments({Key key}) : super(key: key);

  @override
  _MonumentsState createState() => _MonumentsState();
}

class _MonumentsState extends State<Monuments> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'Monuments',
            style: appBarTextStyle,
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  FlutterIcons.bookmark_border_mdi,
                  color: Colors.black,
                  size: 28,
                ),
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new MyReviews()));
                })
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 1),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new MonumentDetails()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 1.0),
              padding: EdgeInsets.all(10.0),
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 1)],
                  //border: Border.all(width: 0.5),
                  image: DecorationImage(
                      image: AssetImage('images/shoreTemple.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.hardLight)),
                  //color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                children: <Widget>[
                  Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade300),
                        child: IconButton(
                            alignment: Alignment.topLeft,
                            icon: Icon(
                              FlutterIcons.bookmark_border_mdi,
                              color: Colors.black,
                              size: 20,
                            ),
                            onPressed: null),
                      )),
                  SizedBox(
                    height: 70,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Shore Temple',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: <Widget>[
                            Text('Mahabalipuram',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w400)),
                            Text(' • ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.bold)),
                            Text('300 CE - 630 CE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w400))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
