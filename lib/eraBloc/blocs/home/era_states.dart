import 'package:equatable/equatable.dart';

abstract class HomeStatesEra extends Equatable {
  HomeStatesEra();

  @override
  List<Object> get props => null;
}

class Loading extends HomeStatesEra {
  Loading() : super();
}

class LoadDataSuccess extends HomeStatesEra {
  final dynamic data;

  LoadDataSuccess(this.data) : super();

  @override
  List<Object> get props => data['era'];
}

class LoadDataFail extends HomeStatesEra {
  final dynamic error;

  LoadDataFail(this.error) : super();

  @override
  List<Object> get props => error;
}
