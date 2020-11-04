import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/blocTry/blocs/home/home.dart';
import 'package:travelapp/blocTry/blocs/simple_delegate.dart';
import 'package:travelapp/blocTry/screens/home_screen.dart';
import 'package:travelapp/blocTry/services/graphql_service.dart';
import 'package:graphql/client.dart';


void main() {
  // BlocSupervisor.delegate = MySimpleBlocDelegate();

  runApp(MyApp2());
}

String query = r'''
query MyQuery {
  users {
    auth0_id
    username
  }
}''';

class MyApp2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyApp2();

}

class _MyApp2 extends State<MyApp2> {
  GraphQLClient _client;
  var op ;
  _MyApp2() {
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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    performQuery(query);
    return Text('\n\n'+op.toString()+'output');
    // var performQuery =  GraphQLService.performQuery(query);
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: BlocProvider<HomeBloc>(
        // create: (BuildContext context) => HomeBloc()..add(FetchHomeData(query)),
    //     child: HomeScreen(),
    //   ),
    // );
  }
  Future<QueryResult> performQuery(String query,
      {Map<String, dynamic> variables}) async {

    QueryOptions options =
        QueryOptions(documentNode: gql(query), variables: variables);

    final result = await _client.query(options);
    setState(() {
      // print(op.data);
      op = result;
    });
    // op = result;

    return result;
  }

}