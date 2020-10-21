import 'package:flutter/material.dart';
import 'package:travelapp/screens/styles.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool _showSaveChanges = true;
  bool _emailpass = true;
  final TextEditingController _loginName =
      TextEditingController(text: ("Just a text"));
  String oldLoginName = "Just a text";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: ListView(children: <Widget>[
              ListTile(
                leading: IconButton(
                  // padding: EdgeInsets.all(-1),
                  icon: Icon(Icons.arrow_back),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                title: Text('Edit Profile', style: largeTitleFontStyle),
              ),
              Container(height: 20),
              ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(
                    'Update Photo',
                    style: titleFontStyle,
                  )),
              Container(
                height: 10,
              ),
              ListTile(
                title: Text('Name', style: subtitleFontStyle),
                subtitle: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xFFCFCFCF),
                      )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2))),
                  controller: _loginName,
                  onChanged: (text) {
                    setState(() {
                      if (_loginName.text == oldLoginName)
                        _showSaveChanges = false;
                      else
                        _showSaveChanges = true;
                      if (_loginName.text == '') _showSaveChanges = false;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'Email',
                  style: subtitleFontStyle,
                ),
                subtitle: Text(
                  'Email from user',
                  style: blackTextStyle,
                ),
              ),
              Container(
                height: 20,
              ),
              ListTile(
                  title: GestureDetector(
                child: Text('Change Password?',
                    style: _emailpass ? blackTextStyle : greyTextStyle),
                onTap: () {
                  if (_emailpass) {
                    print('Reset Password Called');
                  }
                },
              )),
              _showSaveChanges ? displaySaveButton() : Container()
            ])));
  }

  Widget displaySaveButton() {
    return Padding(
        padding: EdgeInsets.only(right: 15, left: 15),
        child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            color: Color(0xFFCEAF41),
            onPressed: () {
              print('Save Changes clicked:' + _loginName.text);
            },
            child: Center(
                child: Padding(
                    padding: EdgeInsets.only(top: 14, bottom: 15),
                    child: Text(
                      'SAVE CHANGES',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )))));
  }
}
