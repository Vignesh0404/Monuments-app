import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/MonumentBloc/blocs/home/monument.dart';
import 'package:travelapp/MonumentBloc/blocs/simple_delegate.dart';
import 'package:travelapp/MonumentBloc/screens/search_screen.dart';
import 'package:travelapp/queries.dart';

// void main() {
//   Bloc.observer = MySimpleBlocObserver();
//   runApp(MyApp2());
// }

class SearchTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SearchTabState();
}

class SearchTabState extends State<SearchTab> {
  Map<String, String> variables;
  SearchTab(variables) {
    this.variables = variables;
  }

  
  @override
  Widget build(BuildContext context) {
    return  BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc()..add(
            FetchHomeData(basicSearch,variables:{"text":"chennai"})
            ),
          child: SearchScreen()
    );
  }
  }
