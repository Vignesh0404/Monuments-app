import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/loginModule/login/login.dart';
import 'package:travelapp/loginModule/sign_up/sign_up.dart';
import 'package:formz/formz.dart';
import 'package:travelapp/screens/styles.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image.asset(
            //   'assets/bloc_logo_small.png',
            //   height: 120,
            // ),
            const SizedBox(height: 75.0),
            _EmailInput(),
            const SizedBox(height: 20.0),
            _Password(),
            const SizedBox(height: 20.0),
            _LoginButton(),
            // const SizedBox(height: 8.0),
            // _GoogleLoginButton(),
            const SizedBox(height: 45.0),
            _SignUpButton(),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) => context.bloc<LoginCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
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
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.bloc<LoginCubit>().passwordChanged(password),
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
            errorText: state.password.invalid?'Password must contain min 8 characters':null,
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

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        print("hi");
        print(state);
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : FlatButton(
                color: Color(0xFFCEAF41),
                key: const Key('loginForm_continue_raisedButton'),
                child: Center(
                    child: Padding(
                        padding: EdgeInsets.only(top: 14, bottom: 15),
                        child: Text(
                          'LOG IN',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ))),
                onPressed: state.status.isValidated
                    ? () => context.bloc<LoginCubit>().logInWithCredentials()
                    : null,
              );
      },
    );
  }
}

// TODO:Copy this to start page
// class _GoogleLoginButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return RaisedButton.icon(
//       key: const Key('loginForm_googleLogin_raisedButton'),
//       label: const Text(
//         'SIGN IN WITH GOOGLE',
//         style: TextStyle(color: Colors.white),
//       ),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
//       icon: const Icon(FontAwesomeIcons.google, color: Colors.white),
//       color: theme.accentColor,
//       onPressed: () => context.bloc<LoginCubit>().logInWithGoogle(),
//     );
//   }
// }

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text('Yet to register?', style: blackTextStyle),
      GestureDetector(
        key: const Key('loginForm_createAccount_flatButton'),
        child: Text(' Sign up!', style: goldTextStyle),
        onTap: () => Navigator.of(context).push<void>(SignUpPage.route()),
      )
    ]));
  }
}
