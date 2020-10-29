import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/screens/login.dart';
import 'package:travelapp/screens/styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

enum AppState {
  free,
  picked,
  cropped,
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _loginName = TextEditingController();
  final TextEditingController _loginEmail = TextEditingController();
  final TextEditingController _loginPassword = TextEditingController();
  double radius = 45;
  double iconSize = 20;
  double distance = 20;

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  AppState state;
  File imageFile;

  Future<Null> _pickImage() async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      _cropImage();
      setState(() {
        state = AppState.picked;
      });
    }
  }

  Future<Null> _cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
              ]
            : [
                CropAspectRatioPreset.square,
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Pick Image',
            toolbarColor: Colors.yellow,
            toolbarWidgetColor: Colors.black,
            hideBottomControls: true,
            initAspectRatio: CropAspectRatioPreset.square,
            showCropGrid: true,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
      imageFile = croppedFile;
      setState(() {
        state = AppState.cropped;
      });
    }
  }

  void _clearImage() {
    imageFile = null;
    setState(() {
      state = AppState.free;
    });
  }

  @override
  void initState() {
    super.initState();
    state = AppState.free;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.only(top: 24, right: 15, left: 15),
          child: Column(children: <Widget>[
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                Widget>[
              
              Stack(
                  alignment: Alignment.center,
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      child: Center(
                          child: imageFile != null
                              // ? Image.file(imageFile)
                              ? CircleAvatar(
                                  radius: 45.0,
                                  backgroundImage: FileImage(imageFile),
                                  backgroundColor: Colors.transparent,
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.grey[200],
                                  radius: 45.0,
                                  child: Icon(
                                    Icons.person,
                                    size: 60,
                                    color: Colors.white,
                                  ),
                                )),
                    ),
                    Positioned(
                        top: -(iconSize + radius) + distance,
                        right: -(radius - distance) + iconSize / 2,
                        bottom: iconSize,
                        left: radius,
                        child: GestureDetector(
                            onTap: () {
                              if (state == AppState.free)
                                _pickImage();
                              else if (state == AppState.picked)
                                _cropImage();
                              else if (state == AppState.cropped) _clearImage();
                            },
                            child: (state == AppState.free)
                                ? Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.green,
                                    size: iconSize,
                                  )
                                : Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.green,
                                    size: iconSize,
                                  )))
                  ]),
              TextField(
                obscureText: _obscureText,
                controller: _loginPassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: _obscureText ? Color(0xFFCFCFCF) : Colors.black87,
                    ),
                    onPressed: _toggle,
                  ),
                  labelText: 'Password',
                  labelStyle: loginFormStyle,
                  focusedBorder: greyBorder,
                  enabledBorder: greyBorder,
                  border: greyCirclularBorder,
                ),
              ),
              Container(
                height: 50,
              ),
              FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  color: Color(0xFFCEAF41),
                  // color: Colors.black87,
                  onPressed: () {},
                  child: Center(
                      child: Padding(
                          padding: EdgeInsets.only(top: 14, bottom: 15),
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          )))),
            ]),
            Container(height: 30),
            Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "Registered User? ",
                            style: blackTextStyle,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new Login()));
                            },
                            child: Text(
                              "Log in!",
                              style: goldTextStyle,
                            ),
                          )
                        ]),
                  ),
                  Container(
                    height: 36,
                  )
                ])
          ])),
    )));
  }
}
