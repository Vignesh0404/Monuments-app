import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/blocTry copy/blocs/home/home.dart';
import 'package:travelapp/blocTry copy/blocs/simple_delegate.dart';
import 'package:travelapp/blocTry copy/screens/home_screen.dart';
import 'package:travelapp/blocTry copy/services/graphql_service.dart';

void main() {
  // BlocSupervisor.delegate = MySimpleBlocDelegate();
  Bloc.observer = MySimpleBlocObserver();
  // MySimpleBlocDelegate();
  runApp(MyApp2());
}

// String query = r'''
//   query {
//     characters(page: 1) {
//       results {
//         id
//         name
//         status
//       }
//     }
//   }
// ''';

String query = r'''
query MyQuery {
  users {
    auth0_id
    username
  }
}''';

class MyApp2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc()..add(FetchHomeData(query)),
        child: HomeScreen(),
      ),
    );
  }
}
