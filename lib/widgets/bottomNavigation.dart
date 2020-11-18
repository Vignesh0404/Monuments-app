import 'package:flutter/material.dart';
import 'package:travelapp/MonumentBloc/search.dart';
import 'package:travelapp/profileModule/Profile.dart';
import 'package:travelapp/screens/monuments.dart';
import 'package:travelapp/screens/search.dart';
import 'package:travelapp/screens/styles.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;
  final List<Widget> children = [
    Monuments(),
    SearchTab(),
    // Bookmark(),
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
                    FlutterIcons.map_ent,
                    color: Color(0xFFCEAF41),
                  ),
                  title: Text(
                    'Regions',
                    style: normalTextStyle,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search_rounded,
                    color: Color(0xFF777672),
                  ),
                  activeIcon: Icon(
                    Icons.search_rounded,
                    color: Color(0xFFCEAF41),
                  ),
                  title: Text(
                    'Search',
                    style: normalTextStyle,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline_rounded,
                    size: 26,
                    color: Color(0xFF777672),
                  ),
                  activeIcon: Icon(
                    Icons.person_outline_rounded,
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
