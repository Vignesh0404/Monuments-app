import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class HomeStates extends Equatable {
  HomeStates();

  @override
  List<Object> get props => null;
}

class Loading extends HomeStates {
  Loading() : super();
}

class LoadDataSuccess extends HomeStates {
  final dynamic data;
  LoadDataSuccess(this.data) : super();
  @override
  List<Object> get props => data;
}
class LoadDataFail extends HomeStates {
  final dynamic error;

  LoadDataFail(this.error) : super();

  @override
  List<Object> get props => error;
}