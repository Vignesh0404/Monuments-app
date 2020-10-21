import 'package:flutter/material.dart';
import 'styles.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 24, right: 15, left: 15),
        child: Stack(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: Text(
                'Log In',
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0),
              )),
              SizedBox(
                height: 75,
              ),
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
              SizedBox(
                height: 25,
              ),
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
              SizedBox(
                height: 19,
              ),
              GestureDetector(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Forgot Password?',
                    style: normalTextStyle,
                  ),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              FlatButton(
                  color: Color(0xFFCEAF41),
                  // color: Colors.black87,
                  onPressed: () {},
                  child: Center(
                      child: Padding(
                          padding: EdgeInsets.only(top: 14, bottom: 15),
                          child: Text(
                            'LOG IN',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          )))),
              SizedBox(
                height: 260,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Yet to register?', style: blackTextStyle),
                    GestureDetector(
                      onTap: () {},
                      child: Text(' Sign up!', style: goldTextStyle),
                    )
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    ));
  }
}
