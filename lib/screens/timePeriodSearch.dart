import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
//import 'package:travelapp/EraBasedMonuments/screens/home_screen.dart';
import 'package:travelapp/HomePageMonumentBloc/Monument.dart';
import 'package:travelapp/eraBasedMonuments/eraBasedMonument.dart';

class TimePeriodSearch extends StatefulWidget {
  TimePeriodSearch({this.colorCode, this.desc, this.id, this.name});
  final int id;
  final String name;
  final String desc;
  final String colorCode;

  @override
  _TimePeriodSearchState createState() => _TimePeriodSearchState();
}

class _TimePeriodSearchState extends State<TimePeriodSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(_convertToColor(widget.colorCode.toString())),
        leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 28,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text(
          widget.name,
          style: TextStyle(
              fontFamily: "OpenSans",
              color: Colors.white,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(left: 13, right: 13, bottom: 18, top: 20),
              child: Column(
                children: <Widget>[
                  Container(width: double.infinity, child: Text(widget.desc)),
                  SizedBox(
                    height: 15,
                  ),

                  // HomeScreen()
                ],
              ),
            ),
            EraBasedMonuments()
            // Monument()
          ],
        ),
      ),
    );
  }
}

int _convertToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return int.parse(hexColor, radix: 16);
}
