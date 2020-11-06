import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/chipBloc/blocs/home/chip.dart';
import 'package:travelapp/services/graphql_service.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStatesChip> {
  GraphQLService service;

  HomeBloc() : super(Loading()) {
    service = GraphQLService();
  }

  // @override
  // HomeStates get initialState => Loading();

  @override
  Stream<HomeStatesChip> mapEventToState(HomeEvents event) async* {
    if (event is FetchHomeData) {
      yield* _mapFetchHomeDataToStates(event);
    }
  }

  Stream<HomeStatesChip> _mapFetchHomeDataToStates(FetchHomeData event) async* {
    final query = event.query;
    final variables = event.variables ?? null;

    try {
      final result = await service.performMutation(query, variables: variables);

      if (result.hasException) {
        print('graphQLErrors: ${result.exception.graphqlErrors.toString()}');
        print('clientErrors: ${result.exception.clientException.toString()}');
        yield LoadDataFail(result.exception.graphqlErrors[0]);
      } else {
        // print(result.data);
        yield LoadDataSuccess(result.data);
      }
    } catch (e) {
      print(e);
      yield LoadDataFail(e.toString());
    }
  }
}
