import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/bookmarkBloc/blocs/home/bookmark.dart';
import 'package:travelapp/bookmarkBloc/screens/home_screen.dart';
import 'package:travelapp/queries.dart';

// void main() {
//   Bloc.observer = MySimpleBlocObserver();
//   runApp(MyApp2());
// }


class Bookmark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc()..add(FetchHomeData(bookmarkList)),
        child: HomeScreen(),
    );
  }
}