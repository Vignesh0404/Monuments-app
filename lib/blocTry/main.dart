import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/blocTry/blocs/home/home.dart';
import 'package:travelapp/blocTry/blocs/simple_delegate.dart';
import 'package:travelapp/blocTry/screens/home_screen.dart';

void main() {
  // BlocSupervisor.delegate = MySimpleBlocDelegate();

  runApp(MyApp2());
}

String query = r'''
query SearchPage{
    tags(order_by: {monuments_x_tags_aggregate:{count:desc}},where:{monuments_x_tags:
    {monument:{details:{_contains:{mt_isActiveOnApp:"yes"}}, is_active:{_eq:true}}}}){
        id
        name
        monuments_x_tags_aggregate{
            aggregate{
                count
            }
        }
    }
    era(order_by:{order:asc}){
        id
        name
        description
        color_code
    }
    monuments(order_by:{view_count:desc},limit:4,where:{is_active:{_eq:true},
    details:{_contains:{mt_isActiveOnApp:"yes"}}}){
        id
        name
        view_count
        location_name
        details
        status
    }
}
''';

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