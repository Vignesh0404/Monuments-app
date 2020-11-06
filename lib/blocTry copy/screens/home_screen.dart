import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/blocTry copy/blocs/home/home.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List data = [];
  var data;
  @override
  void initState() {
    super.initState();
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('GraphQL Demo'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStates>(
      builder: (BuildContext context, HomeStates state) {
        if (state is Loading) {
          return Scaffold(
            appBar: _buildAppBar(),
            body: LinearProgressIndicator(),
          );
        } else if (state is LoadDataFail) {
          return Scaffold(
            appBar: _buildAppBar(),
            body: Center(child: Text(state.error)),
          );
        } else {
          // data = (state as LoadDataSuccess).data['characters']['results'];
          data = (state as LoadDataSuccess).data['users'];

          return Scaffold(
            appBar: _buildAppBar(),
            body: _buildBody(),
          );
        }
      },
    );
  }

  Widget _buildBody() {
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          var item = data[0];
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Text(item['auth0_id']),
              title: Text(item['username']),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}