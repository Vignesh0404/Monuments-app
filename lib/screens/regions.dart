import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Regions extends StatefulWidget {
  Regions({Key key}) : super(key: key);

  @override
  _RegionsState createState() => _RegionsState();
}

class _RegionsState extends State<Regions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text('Regions'),
      ),
    );
  }
}
