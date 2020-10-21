import 'package:flutter/material.dart';
import 'package:travelapp/screens/styles.dart';
import 'package:travelapp/screens/editprofile.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _feedback = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              ListTile(
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              ListTile(
                title: Text('A Long Name', style: appBarTextStyle),
                trailing: FlatButton(
                    color: Color(0xFFCEAF41),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {
                      print('Edit Profile clicked');
                      Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      EditProfile()));
                    },
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    )),
              ),
              ListTile(
                onTap: () {
                  print('Bookmarks clicked');
                },
                dense: true,
                leading: Icon(
                  Icons.bookmark_border,
                  color: Colors.black,
                  size: 36,
                ),
                title: Text(
                  'My Bookmarks',
                  style: titleFontStyle,
                ),
                subtitle: Text(
                  '4 added',
                  style: subtitleFontStyle,
                ),
              ),
              ListTile(
                onTap: () {
                  print('Reviews clicked');
                },
                dense: true,
                leading: Icon(
                  Icons.list,
                  color: Colors.black,
                  size: 36,
                ),
                title: Text(
                  'My Reviews',
                  style: titleFontStyle,
                ),
                subtitle: Text(
                  '3 added',
                  style: subtitleFontStyle,
                ),
              ),
              ListTile(
                onTap: () {
                  print('Downloads clicked');
                },
                dense: true,
                leading: Icon(
                  Icons.file_download,
                  color: Colors.black,
                  size: 36,
                ),
                title: Text(
                  'My Downloads',
                  style: titleFontStyle,
                ),
                subtitle: Text(
                  '2 added',
                  style: subtitleFontStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15, left: 15),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              ListTile(
                dense: true,
                leading: Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.black,
                  size: 36,
                ),
                title: Text(
                  'We would love to hear from you',
                  style: titleFontStyle,
                ),
                subtitle: Text(
                  'Share your feedback and suggestions about the app',
                  style: subtitleFontStyle,
                ),
              ),
              ListTile(
                leading: Text(''),
                title: TextField(
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
                leading: Icon(
                  Icons.star_border,
                  color: Colors.black,
                  size: 36,
                ),
                title: Text(
                  'Love the app?',
                  style: titleFontStyle,
                ),
                subtitle: Text(
                  'Rate us on the Play Store',
                  style: subtitleFontStyle,
                ),
              ),
              ListTile(
                onTap: () {
                  print('Share clicked');
                },
                dense: true,
                leading: Icon(
                  Icons.share,
                  color: Colors.black,
                  size: 36,
                ),
                title: Text(
                  'Spread the word!',
                  style: titleFontStyle,
                ),
                subtitle: Text(
                  'Share the app with friends',
                  style: subtitleFontStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15, left: 15),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              ListTile(
                onTap: () {
                  print('Logout clicked');
                },
                dense: true,
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.black,
                  size: 36,
                ),
                title: Text(
                  'Log out',
                  style: titleFontStyle,
                ),
              ),
              ListTile(
                onTap: () {
                  print('App Version clicked');
                },
                dense: true,
                leading: Icon(
                  Icons.info_outline,
                  color: Colors.grey,
                  size: 36,
                ),
                title: Text(
                  'App Version v0.01',
                  style: greytitleFontStyle,
                ),
              ),
              Container(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
