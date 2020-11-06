import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelapp/profileModule/editProfile/editprofile.dart';
import 'package:travelapp/screens/styles.dart';

class ProfileName extends StatelessWidget {
  const ProfileName({this.document});
  final List<DocumentSnapshot> document;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
              height: 70,
              child: new ListView.builder(
                itemCount: document.length,
                itemBuilder: (BuildContext context, int i) {
                  String name = document[i]['name'].toString();
                  return ListTile(
                    title: Text(name, style: appBarTextStyle),
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
                  );
                },
              )),
        )
      ],
    );
  }
}
