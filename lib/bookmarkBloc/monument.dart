import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/bookmarkBloc/blocs/home/monument.dart';
import 'package:travelapp/bookmarkBloc/blocs/simple_delegate.dart';
import 'package:travelapp/bookmarkBloc/screens/home_screen.dart';
import 'package:travelapp/queries.dart';

// void main() {
//   Bloc.observer = MySimpleBlocObserver();
//   runApp(MyApp2());
// }


class Monument1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child:Container(
      child: BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc()..add(FetchHomeData(bookmarkQuery)),
        child: HomeScreen(),
      ),
    ));
  }
}