import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/blocTrycopy/blocs/home/home.dart';
import 'package:travelapp/blocTrycopy/services/graphql_service.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  GraphQLService service;

  HomeBloc() : super(Loading()) {
    service = GraphQLService();
  }

  // @override
  // HomeStates get initialState => Loading();

  @override
  Stream<HomeStates> mapEventToState(HomeEvents event) async* {
    if (event is FetchHomeData) {
      yield* _mapFetchHomeDataToStates(event);
    }
  }

  Stream<HomeStates> _mapFetchHomeDataToStates(FetchHomeData event) async* {
    final query = event.query;
    final variables = event.variables ?? null;

    try {
      final result = await service.performMutation(query, variables: variables);

      if (result.hasException) {
        print('graphQLErrors: ${result.exception.graphqlErrors.toString()}');
        print('clientErrors: ${result.exception.clientException.toString()}');
        yield LoadDataFail(result.exception.graphqlErrors[0]);
      } else {
        print(result.data);
        yield LoadDataSuccess(result.data);
      }
    } catch (e) {
      print(e);
      yield LoadDataFail(e.toString());
    }
  }
}
