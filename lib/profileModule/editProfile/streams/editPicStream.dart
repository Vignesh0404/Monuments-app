import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/loginModule/authentication/authentication.dart';
import 'package:travelapp/profileModule/editProfile/streams/editPicView.dart';

class EditPicStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.bloc<AuthenticationBloc>().state.user;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .where("uid", isEqualTo: user.email)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return new Container(
              child: Text('Loading..'),
            );
          return EditPic(
            document: snapshot.data.docs,
          );
        });
  }
}