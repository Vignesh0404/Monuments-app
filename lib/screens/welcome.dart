import 'package:flutter/material.dart';
import 'styles.dart';

class Welcome extends StatefulWidget {
  Welcome({Key key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 24, right: 15, left: 15),
            child: Text(
              'Log In',
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('images/loginLogo.png'),
              ),
            ),
          ),
          SizedBox(
            height: 360,
          ),
          Center(
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                  //shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                  onPressed: () {},
                  color: Color(0xFFCEAF41),
                  child: Center(
                      child: Padding(
                          padding: EdgeInsets.only(top: 14, bottom: 15),
                          child: Text(
                            'LOG IN VIA EMAIL',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'OpenSans',
                            ),
                          )))),
            ),
          ),
          SizedBox(
            height: 30,
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
    ));
  }
}
