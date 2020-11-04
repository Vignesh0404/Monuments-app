import 'package:graphql/client.dart';

class GraphQLService {
  GraphQLClient _client;
  
  GraphQLService() {
    // String token = await _firebaseAuth.currentUser.getTokenId();
    var token = '';
    HttpLink link = HttpLink(uri: 'https://dev-monuments.nfndev.com/v1/graphql',headers: {
      // 'Authenticator':'Bearer '+ token,
      // 'Authorization':'Bearer '+ token,
      'Content-Type': 'application/json',
      'x-hasura-admin-secret':'Remember001',
      // 'Accept': 'application/json',
    });
    print(link);
    _client = GraphQLClient(link: link, cache: InMemoryCache());

  }

  Future<QueryResult> performQuery(String query,
      {Map<String, dynamic> variables}) async {

    QueryOptions options =
        QueryOptions(documentNode: gql(query), variables: variables);

    final result = await _client.query(options);

    return result;
  }

  Future<QueryResult> performMutation(String query,
      {Map<String, dynamic> variables}) async {
    MutationOptions options =
        MutationOptions(documentNode: gql(query), variables: variables);

    final result = await _client.mutate(options);

    print(result);

    return result;
  }
}