import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/loginModule/sign_up/sign_up.dart';
import 'package:formz/formz.dart';
import 'package:travelapp/screens/styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Sign Up Failure')),
              );
          }
        },
        child: SafeArea(
            child: Scaffold(
                body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 26),
              _ProfilePicture(),
              const SizedBox(height: 26),
              _NameInput(),
              const SizedBox(height: 16),
              _EmailInput(),
              const SizedBox(height: 16.0),
              _Password(),
              const SizedBox(height: 16.0),
              _ConfirmPassword(),
              const SizedBox(height: 16.0),
              _SignUpButton(),
              const SizedBox(height: 16.0),
              _LoginButton(),
            ],
          ),
        ))));
  }
}

class _ProfilePicture extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePictureState();
}

enum AppState {
  free,
  picked,
  cropped,
}

class _ProfilePictureState extends State<_ProfilePicture> {
  double radius = 45;
  double iconSize = 20;
  double distance = 20;
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
    return Stack(
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
        ]);
  }
}

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_nameInput_textField'),
          onChanged: (name) => context.bloc<SignUpCubit>().nameChanged(name),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Name',
            labelStyle: loginFormStyle,
            focusedBorder: greyBorder,
            enabledBorder: greyBorder,
            border: greyCirclularBorder,
          ),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_emailInput_textField'),
          onChanged: (email) => context.bloc<SignUpCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            errorText: state.email.invalid ? 'Enter valid email' : null,
            labelText: 'Email',
            labelStyle: loginFormStyle,
            focusedBorder: greyBorder,
            enabledBorder: greyBorder,
            border: greyCirclularBorder,
          ),
        );
      },
    );
  }
}

class _Password extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PasswordInput();
}

class _PasswordInput extends State<_Password> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.bloc<SignUpCubit>().passwordChanged(password),
          obscureText: _obscureText,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _obscureText ? Color(0xFFCFCFCF) : Colors.black87,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            errorText: state.password.invalid
                ? 'Password must contain min 8 characters'
                : null,
            labelText: 'Password',
            labelStyle: loginFormStyle,
            focusedBorder: greyBorder,
            enabledBorder: greyBorder,
            border: greyCirclularBorder,
          ),
        );
      },
    );
  }
}

class _ConfirmPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ConfirmPasswordInput();
}

class _ConfirmPasswordInput extends State<_ConfirmPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmedPassword != current.confirmedPassword,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_confirmedPasswordInput_textField'),
          onChanged: (confirmPassword) => context
              .bloc<SignUpCubit>()
              .confirmedPasswordChanged(confirmPassword),
          obscureText: _obscureText,
          decoration: InputDecoration(
            errorText: state.confirmedPassword.invalid
                ?'Passwords do not match'
                : null,
            // errorStyle: ,
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _obscureText ? Color(0xFFCFCFCF) : Colors.black87,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            labelText: 'Confirm Password',
            labelStyle: loginFormStyle,
            focusedBorder: greyBorder,
            enabledBorder: greyBorder,
            border: greyCirclularBorder,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: FractionalOffset.bottomCenter,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text('Registered User?', style: blackTextStyle),
          GestureDetector(
            // key: const Key('loginForm_createAccount_flatButton'),
            child: Text(' Log in!', style: goldTextStyle),
            onTap: () => Navigator.of(context).pop(),
            // onTap: () => Navigator.of(context).push<void>(SignUpPage.route()),
          )
        ]));
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : FlatButton(
                key: const Key('signUpForm_continue_raisedButton'),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 14, bottom: 15),
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                color: Color(0xFFCEAF41),
                onPressed: state.status.isValidated
                    ? () => context.bloc<SignUpCubit>().signUpFormSubmitted()
                    : null,
              );
      },
    );
  }
}