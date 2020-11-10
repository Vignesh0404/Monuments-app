import 'package:equatable/equatable.dart';
import 'dart:convert';

abstract class HomeStatesMonument extends Equatable {
  HomeStatesMonument();

  @override
  List<Object> get props => null;
}

class Loading extends HomeStatesMonument {
  Loading() : super();
}

class LoadDataSuccess extends HomeStatesMonument {
  final dynamic data;

  LoadDataSuccess(this.data) : super();

  @override
  // List<Object> get props => data;
  // List<Object> get props => data['monuments'];
  List<Object> get props => [data];
  // List<Object> get props => json.decode(data.toString());
  // Map<String,dynamic> get props => data;

}

class LoadDataFail extends HomeStatesMonument {
  final dynamic error;

  LoadDataFail(this.error) : super();

  @override
  List<Object> get props => error;
}
