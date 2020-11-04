import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/blocTry/blocs/home/home.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List data = [];

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
          data = (state as LoadDataSuccess).data['characters']['results'];
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
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          var item = data[index];
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Text(item['id']),
              title: Text(item['name']),
              trailing: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: item['status'] == 'Dead'
                      ? Colors.red.withOpacity(0.3)
                      : item['status'] == 'Alive'
                          ? Colors.green.withOpacity(0.3)
                          : Colors.amber.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: Text(
                  item['status'],
                  style: TextStyle(
                      color: item['status'] == 'Dead'
                          ? Colors.red
                          : item['status'] == 'Alive'
                              ? Colors.green
                              : Colors.amber),
                ),
              ),
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