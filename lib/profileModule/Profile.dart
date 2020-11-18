import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp/screens/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/loginModule/authentication/authentication.dart';
import 'package:travelapp/profileModule/streams/profilePicStream.dart';
import 'package:travelapp/profileModule/streams/profileNameStream.dart';
import 'package:travelapp/bookmarkBloc/bookmark.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:travelapp/userReviewsBloc/bookmark.dart';
import 'dart:math' as math;

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _feedback = TextEditingController();
  String token = '';
  @override
  void initState() {
    getToken();
    super.initState();
  }

  Widget build(BuildContext context) {
    final user = context.bloc<AuthenticationBloc>().state.user;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(),
          //padding: EdgeInsets.only(top: 13, right: 15, left: 15),
          child: ListView(
            children: <Widget>[
              Container(
                height: 15,
              ),
              ProfilePicStream(),
              ProfileNameStream(),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => Bookmark()));
                  print('Bookmarks clicked');
                },
                dense: true,
                title: Row(children: [
                  Icon(
                    Icons.bookmark_border,
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'My Bookmarks',
                    style: titleFontStyle,
                  ),
                ]),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => MyReviews()));
                  print('Reviews clicked');
                },
                dense: true,

                title: Row(children: [
                  SizedBox(width:3),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationX(math.pi),
                    child: FaIcon(FontAwesomeIcons.alignLeft,size:20,color: Colors.black,)
                    // Icon(
                    //   Icons.notes_rounded,
                    //   color: Colors.black,
                    //   size: 24,
                    // ),
                  ),
                  SizedBox(width: 13),
                  Text(
                    'My Reviews',
                    style: titleFontStyle,
                  ),
                ]),
              ),
              ListTile(
                onTap: () {
                  print('Downloads clicked');
                },
                dense: true,

                title: Row(
                  children: [
                    Transform.rotate(
                    alignment: Alignment.center,
                    // transform: Matrix4.rotationY(math.pi),
                      angle: 90 * math.pi / 180,

                    child: 
                    Icon(
                      Icons.login_rounded,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'My Downloads',
                      style: titleFontStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15, left: 15),
                child: Divider(
                  color: Color(0xFFC4C4C4),
                ),
              ),
              ListTile(
                dense: true,
                // leading:
                title: Row(children: [
                  Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'We would love to hear from you',
                    style: titleFontStyle,
                  ),
                ]),
                subtitle: Row(children: [
                  SizedBox(width: 34),
                  Text(
                    'Share your feedback and suggestions about the app',
                    style: subtitleFontStyle,
                  ),
                ]),
              ),
              ListTile(
                // leading: Text(''),
                title: Container(
                  padding: EdgeInsets.only(left: 34),
                  child: TextField(
                    cursorColor: Colors.black,
                    onChanged: (text) => setState(() {
                      print(text);
                    }),
                    maxLines: 5,
                    controller: _feedback,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.all(8),
                      isDense: true,
                      labelStyle: loginFormStyle,
                      focusedBorder: greyBorder,
                      enabledBorder: greyBorder,
                      border: greyCirclularBorder,
                    ),
                  ),
                ),
                subtitle: Padding(
                  child: GestureDetector(
                    onTap: () {
                      _feedback.text.toString() == ''
                          ? print('Empty Submit Clicked')
                          : print('Non-empty submit clicked');
                    },
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(
                          color: _feedback.text.toString() == ''
                              ? Colors.grey
                              : Colors.black),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                ),
              ),
              ListTile(
                onTap: () {
                  print('Play Store rate clicked');
                },
                dense: true,
                title: Row(
                  children: [
                    Icon(
                      Icons.star_border,
                      color: Colors.black,
                      size: 24,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Love the app?',
                      style: titleFontStyle,
                    ),
                  ],
                ),
                subtitle: Row(children: [
                  SizedBox(
                    width: 34,
                  ),
                  Text(
                    'Rate us on the Play Store',
                    style: subtitleFontStyle,
                  ),
                ]),
              ),
              ListTile(
                onTap: () {
                  print('Share clicked');
                },
                dense: true,
                title: Row(children: [
                  Icon(
                    Icons.share_outlined,
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Spread the word!',
                    style: titleFontStyle,
                  ),
                ]),
                subtitle: Row(children: [
                  SizedBox(
                    width: 34,
                  ),
                  Text(
                    'Share the app with friends',
                    style: subtitleFontStyle,
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15, left: 15),
                child: Divider(
                  color: Color(0xFFC4C4C4),
                ),
              ),
              // Text(token),
              ListTile(
                onTap: () {
                  context
                      .bloc<AuthenticationBloc>()
                      .add(AuthenticationLogoutRequested());
                  print('Logout clicked');
                },
                dense: true,
                title: Row(children: [
                  Icon(
                    Icons.logout,
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Log out',
                    style: titleFontStyle,
                  ),
                ]),
              ),
              ListTile(
                  onTap: () {
                    print('App Version clicked');
                  },
                  dense: true,
                  title: Row(children: [
                    Icon(
                      Icons.info_outline,
                      color: Colors.grey,
                      size: 24,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'App Version v0.01',
                      style: greytitleFontStyle,
                    ),
                  ])),
              Container(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getToken() async {
    String authToken =
        await firebase_auth.FirebaseAuth.instance.currentUser.getIdToken();
    var user = await firebase_auth.FirebaseAuth.instance.currentUser
        .getIdTokenResult();
    setState(() {
      print(user.toString());
      token = authToken;
      int n = token.length;
      print(n);
      print('-------');
      print(token);
      return;
    });
    return;
  }
}
