import 'package:flutter/material.dart';
import 'package:travelapp/widgets/bottomNavigation.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigation();
  }
}
