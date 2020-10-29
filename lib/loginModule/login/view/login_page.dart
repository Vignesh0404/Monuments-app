import 'package:travelapp/loginModule/authentication_repository/lib/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/loginModule/login/login.dart';
import 'package:travelapp/screens/styles.dart';

class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        title:
                Text('Log In',
                style: largeTitleFontStyle),),
      body: Padding(
        padding: const EdgeInsets.only(left:15.0,right:15,top:15),
        child: BlocProvider(
          create: (_) => LoginCubit(
            context.repository<AuthenticationRepository>(),
          ),
          child: LoginForm(),
        ),
      ),
    );
  }
}