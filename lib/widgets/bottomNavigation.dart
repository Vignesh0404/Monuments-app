import 'package:flutter/material.dart';
import 'package:travelapp/MonumentBloc/search.dart';
import 'package:travelapp/profileModule/Profile.dart';
import 'package:travelapp/screens/monuments.dart';
import 'package:travelapp/screens/search.dart';
import 'package:travelapp/screens/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  Widget searchIcon = SvgPicture.asset('images/searchIcon.svg',color:Color(0xFF777672));
  Widget monumentIcon = SvgPicture.asset('images/monumentIcon.svg',color:Color(0xFF777672));
  Widget regionsIcon = SvgPicture.asset('images/regionsIcon.svg',color:Color(0xFF777672));
  Widget searchIconActive = SvgPicture.asset('images/searchIcon.svg',color:Color(0xFFCEAF41));
  Widget profileIcon = SvgPicture.asset('images/profileIcon.svg',color:Color(0xFF777672));
  Widget monumentIconActive = SvgPicture.asset('images/monumentIcon.svg',color:Color(0xFFCEAF41));
  Widget regionsIconActive = SvgPicture.asset('images/regionsIcon.svg',color:Color(0xFFCEAF41));
  Widget profileIconActive = SvgPicture.asset('images/profileIcon.svg',color:Color(0xFFCEAF41));
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
                  icon: monumentIcon,
                  activeIcon: monumentIconActive,
                  title: Text(
                    '   Monuments',
                    style: normalTextStyle,
                  )),
              BottomNavigationBarItem(
                  icon: regionsIcon,
                  activeIcon: regionsIconActive,
                  title: Text(
                    'Regions',
                    style: normalTextStyle,
                  )),
              BottomNavigationBarItem(
                  icon: searchIcon,
                  activeIcon: searchIconActive,
                  title: Text(
                    'Search',
                    style: normalTextStyle,
                  )),
              BottomNavigationBarItem(
                  icon: profileIcon,
                  activeIcon: profileIconActive,
                  title: Text(
                    'Profile',
                    style: normalTextStyle,
                  ))
            ]),
      ),
    );
  }
}
