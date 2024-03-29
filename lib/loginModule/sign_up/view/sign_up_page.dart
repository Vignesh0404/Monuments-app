import 'package:travelapp/loginModule/authentication_repository/lib/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/loginModule/sign_up/sign_up.dart';
import 'package:travelapp/screens/styles.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
          title: Text(
        'Sign Up',
        style: largeTitleFontStyle
      )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider<SignUpCubit>(
          create: (_) => SignUpCubit(
            context.repository<AuthenticationRepository>(),
          ),
          child: SignUpForm(),
        ),
      ),
    );
  }
}
