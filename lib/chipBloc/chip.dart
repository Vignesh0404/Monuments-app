import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/chipBloc/blocs/home/chip.dart';
import 'package:travelapp/chipBloc/blocs/simple_delegate.dart';
import 'package:travelapp/chipBloc/screens/home_screen.dart';
import 'package:travelapp/queries.dart';

// void main() {
//   Bloc.observer = MySimpleBlocObserver();
//   runApp(MyApp2());
// }


class ChipTags extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc()..add(FetchHomeData(searchPageQueryChip)),
        child: HomeScreen(),
      ),
    );
  }
}