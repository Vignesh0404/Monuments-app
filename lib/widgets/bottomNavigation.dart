import 'package:flutter/material.dart';
import 'package:travelapp/profileModule/Profile.dart';
import 'package:travelapp/screens/monuments.dart';
import 'package:travelapp/screens/myReviews.dart';
import 'package:travelapp/screens/regions.dart';
import 'package:travelapp/screens/search.dart';
import 'package:travelapp/screens/signup.dart';
import 'package:travelapp/screens/styles.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:travelapp/screens/videoplayer.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;
  final List<Widget> children = [
    Monuments(),
    SignUp(),
    // MyReviews(),
    // VideoPlayerApp(),
    // Regions(),
    // TimePeriodSearch(),
    Search(),
    Profile(),
  ];
  void OntappedBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: children[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            onTap: OntappedBar,
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(FlutterIcons.place_of_worship_faw5s,
                      color: Color(0xFF777672)),
                  activeIcon: Icon(
                    FlutterIcons.monument_faw5s,
                    color: Color(0xFFCEAF41),
                    //size: 23,
                  ),
                  title: Text(
                    '   Monuments',
                    style: normalTextStyle,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    FlutterIcons.map_ent,
                    color: Color(0xFF777672),
                  ),
                  activeIcon: Icon(
                    FlutterIcons.map_faw5s,
                    color: Color(0xFFCEAF41),
                  ),
                  title: Text(
                    'Regions',
                    style: normalTextStyle,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    FlutterIcons.search_location_faw5s,
                    color: Color(0xFF777672),
                  ),
                  activeIcon: Icon(
                    FlutterIcons.map_search_outline_mco,
                    color: Color(0xFFCEAF41),
                  ),
                  title: Text(
                    'Search',
                    style: normalTextStyle,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle,
                    size: 26,
                    color: Color(0xFF777672),
                  ),
                  activeIcon: Icon(
                    FlutterIcons.account_alert_outline_mco,
                    size: 26,
                    color: Color(0xFFCEAF41),
                  ),
                  title: Text(
                    'Profile',
                    style: normalTextStyle,
                  ))
            ]),
      ),
    );
  }
}
