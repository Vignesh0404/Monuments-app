import 'package:equatable/equatable.dart';

abstract class HomeStatesChip extends Equatable {
  HomeStatesChip();

  @override
  List<Object> get props => null;
}

class Loading extends HomeStatesChip {
  Loading() : super();
}

class LoadDataSuccess extends HomeStatesChip {
  final dynamic data;

  LoadDataSuccess(this.data) : super();

  @override
  List<Object> get props => data['chip'];
}

class LoadDataFail extends HomeStatesChip {
  final dynamic error;

  LoadDataFail(this.error) : super();

  @override
  List<Object> get props => error;
}
