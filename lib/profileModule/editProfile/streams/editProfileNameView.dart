import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelapp/profileModule/editProfile/editprofile.dart';
import 'package:travelapp/screens/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/loginModule/authentication/authentication.dart';

class EditProfileName extends StatefulWidget {
  EditProfileName({this.document});
  List<DocumentSnapshot> document;
  @override
  State<StatefulWidget> createState() =>
      EditProfileNameState(document: this.document);
}

class EditProfileNameState extends State<EditProfileName> {
  EditProfileNameState({this.document});
  List<DocumentSnapshot> document;
  TextEditingController _loginName =
      TextEditingController(text: ("Just a text"));
  // final String oldLoginName = "Just a text";

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  bool _showSaveChanges = false;
  bool check = false;
  String emailID;
  // bool _emailpass = true;
  void initState() {
    check = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.bloc<AuthenticationBloc>().state.user;
    emailID = user.email;
    return Column(children: [
      Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
                height: 70,
                child: new ListView.builder(
                  itemCount: document.length,
                  itemBuilder: (BuildContext context, int i) {
                    String name = document[i]['name'].toString();
                    if (check == false) {
                      _loginName.text = name;
                      check = true;
                    }
                    return ListTile(
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
                          // print(text);
                          // print(name);
                          setState(() {
                            if (_loginName.text == name)
                              _showSaveChanges = false;
                            else
                              _showSaveChanges = true;
                            if (_loginName.text == '') _showSaveChanges = false;
                          });
                        },
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
      Container(
        height: 10,
      ),
      _showSaveChanges ? displaySaveButton() : Container(height: 48)
    ]);
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
              _updateUsername();
            },
            child: Center(
                child: Padding(
                    padding: EdgeInsets.only(top: 14, bottom: 15),
                    child: Text(
                      'SAVE CHANGES',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )))));
  }

  void _updateUsername() async {
    await users.doc(emailID).update({"name": _loginName.text});
    setState(() {
      _showSaveChanges = false;
    });
  }
}
