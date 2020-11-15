import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/bookmarkBloc/blocs/home/bookmark.dart';
import 'package:travelapp/monumentDetailsReviewsBloc/screens/home_screen.dart';
import 'package:travelapp/Queries1.dart';

// void main() {
//   Bloc.observer = MySimpleBlocObserver();
//   runApp(MyApp2());
// }

class MonumentDetailsReview extends StatelessWidget {
  final int id;
  final String name;
  MonumentDetailsReview({this.id, this.name});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) =>
          HomeBloc()..add(FetchHomeData(fetchReview, variables: {"mID": id})),
      child: HomeScreen(
        id: id,
        name: name,
      ),
    );
  }
}
