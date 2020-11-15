import 'package:flutter/material.dart';
import 'package:travelapp/HomePageMonumentBloc/Monument.dart';
import 'package:travelapp/userReviewsBloc/bookmark.dart';

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
        body: Monument(),
      ),
    );
  }
}
