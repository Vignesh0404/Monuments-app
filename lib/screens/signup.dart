import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/screens/styles.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _loginName = TextEditingController();
  final TextEditingController _loginEmail = TextEditingController();
  final TextEditingController _loginPassword = TextEditingController();

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.only(top: 24, right: 15, left: 15),
            child: Stack(children: <Widget>[
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Sign up',
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0),
                    ),
                    Container(
                      height: 26,
                    ),
                    Center(
                        //TODO:Add the picture thingy
                        ),
                    TextField(
                      controller: _loginName,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: loginFormStyle,
                        focusedBorder: greyBorder,
                        enabledBorder: greyBorder,
                        border: greyCirclularBorder,
                      ),
                    ),
                    Container(
                      height: 26,
                    ),
                    //Email TextField
                    TextField(
                      controller: _loginEmail,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: loginFormStyle,
                        focusedBorder: greyBorder,
                        enabledBorder: greyBorder,
                        border: greyCirclularBorder,
                      ),
                    ),
                    Container(
                      height: 26,
                    ),
                    TextField(
                      obscureText: _obscureText,
                      controller: _loginPassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: _obscureText
                                ? Color(0xFFCFCFCF)
                                : Colors.black87,
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
                        color: Color(0xFFCEAF41),
                        // color: Colors.black87,
                        onPressed: () {},
                        child: Center(
                            child: Padding(
                                padding: EdgeInsets.only(top: 14, bottom: 15),
                                child: Text(
                                  'SIGN UP',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                )))),
                  ]),
              Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Registered User? ",
                              style: blackTextStyle,
                            ),
                            Text(
                              "Log in!",
                              style: goldTextStyle,
                            )
                          ]),
                    ),
                    Container(
                      height: 36,
                    )
                  ])
            ])));
  }
}
