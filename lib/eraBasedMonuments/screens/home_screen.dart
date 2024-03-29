import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/MonumentBloc/blocs/home/monument.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var data;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStatesMonument>(
      builder: (BuildContext context, HomeStatesMonument state) {
        if (state is Loading) {
          return LinearProgressIndicator();
        } else if (state is LoadDataFail) {
          return Text(state.error);
        } else {
          data = (state as LoadDataSuccess).data['era'];
          // print(data);

          return Text(data.toString());

          // return Container(child: _buildMonumentWidget());
        }
      },
    );
  }

  
  @override
  void dispose() {
    super.dispose();
  }
}
