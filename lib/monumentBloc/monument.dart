import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/MonumentBloc/blocs/home/monument.dart';
import 'package:travelapp/MonumentBloc/blocs/simple_delegate.dart';
import 'package:travelapp/MonumentBloc/screens/home_screen.dart';
import 'package:travelapp/queries.dart';

// void main() {
//   Bloc.observer = MySimpleBlocObserver();
//   runApp(MyApp2());
// }


class Monument extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc()..add(FetchHomeData(searchPageQueryMonument)),
        child: HomeScreen(),
      ),
    );
  }
}