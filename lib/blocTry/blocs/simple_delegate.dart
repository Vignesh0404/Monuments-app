import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MySimpleBlocDelegate extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('bloc: $bloc, transition: $transition');
  }
}