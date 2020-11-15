import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/bookmarkBloc/blocs/home/bookmark.dart';
import 'package:travelapp/addReviewBloc/screens/home_screen.dart';
import 'package:travelapp/Queries1.dart';

// void main() {
//   Bloc.observer = MySimpleBlocObserver();
//   runApp(MyApp2());
// }

class AddReview extends StatelessWidget {
  final int id;

  AddReview({this.id});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) =>
          HomeBloc()..add(FetchHomeData(eachUserReview)),
      child: HomeScreen(
        id: id,
      ),
    );
  }
}
