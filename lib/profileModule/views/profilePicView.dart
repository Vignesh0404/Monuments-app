// part of 'travelapp/profileModule/Streams/profilePicStream.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({this.document});
  final List<DocumentSnapshot> document;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
              height: 80,
              child: new ListView.builder(
                itemCount: document.length,
                itemBuilder: (BuildContext context, int i) {
                  String photoUrl = document[i]['photo'].toString();
                  print(photoUrl);
                  return ListTile(
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        radius: 36.0,
                        backgroundImage: (photoUrl == null)
                            ? Text(photoUrl)
                            // Icon(
                            //     Icons.person_outline,
                            //     color: Colors.black,
                            //   )
                            : NetworkImage(photoUrl),
                        backgroundColor: Color(0xFFCEAF41),
                      ),
                    ),
                  );
                },
              )),
        )
      ],
    );
  }
}
