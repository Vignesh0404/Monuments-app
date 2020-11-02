import 'package:flutter/material.dart';
import 'package:travelapp/screens/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';
import 'package:travelapp/photo.dart' as photo;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:travelapp/loginModule/authentication/authentication.dart';

File imageFile;
String url;
enum AppState {
  free,
  picked,
  cropped,
}

final CollectionReference users =
    FirebaseFirestore.instance.collection('users');

class EditPic extends StatefulWidget {
  EditPic({this.document});
  final List<DocumentSnapshot> document;
  @override
  EditPicState createState() => EditPicState(document: this.document);
}

class EditPicState extends State<EditPic> {
  List<DocumentSnapshot> document;
  EditPicState({this.document});

  AppState state;

  @override
  void initState() {
    super.initState();
    state = AppState.free;
  }

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
                  String photoUrl = document[i]['photo'].toString();
                  return ListTile(
                    title: GestureDetector(
                      onTap: () => _pickImage(),
                      child: Text(
                        'Update Photo',
                        style: titleFontStyle,
                      ),
                    ),
                    subtitle: Text(imageFile.toString()),
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: (imageFile==null)?NetworkImage(photoUrl):FileImage(imageFile),
                      backgroundColor: Colors.transparent,
                    ),
                  );
                },
              )),
        )
      ],
    );
  }

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
    final user = context.bloc<AuthenticationBloc>().state.user;
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
      photo.photo = imageFile;
      setState(() {
        updatePhoto(user.email, imageFile);
        state = AppState.cropped;
      });
    }
  }
}

Future updatePhoto(email, image) async {
  print(image.toString());
  FirebaseStorage storage = FirebaseStorage.instance;
  StorageReference reference = storage.ref().child("$email/");
  StorageUploadTask uploadTask = reference.putFile(image);

  StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

  // Waits till the file is uploaded then stores the download url
  url = await taskSnapshot.ref.getDownloadURL();
  print('Image URL:');

  print(url);
  print(
      '-----------------------------------------------------------------------------');
  updateWithImage(email, url);
}

Future updateWithImage(
    String emailid,
    //String phonenum,
    String photo) async {
  return await users.doc(emailid).update({
    'photo': photo,
  });
}
