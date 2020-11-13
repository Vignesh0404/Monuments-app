import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/eraBasedMonuments/screens/home_screen.dart';
import 'package:travelapp/MonumentBloc/blocs/home/monument.dart';
import 'package:travelapp/MonumentBloc/blocs/simple_delegate.dart';
import 'package:travelapp/Queries1.dart';

// void main() {
//   Bloc.observer = MySimpleBlocObserver();
//   runApp(MyApp2());
// }

class EraBasedMonuments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: BlocProvider<HomeBloc>(
          create: (BuildContext context) =>
              HomeBloc()..add(FetchHomeData(eraBasedMonuments)),
          child: HomeScreen(),
        ),
      ),
    );
  }
}
