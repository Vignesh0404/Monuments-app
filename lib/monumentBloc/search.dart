import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/MonumentBloc/blocs/home/monument.dart';
import 'package:travelapp/MonumentBloc/blocs/simple_delegate.dart';
import 'package:travelapp/MonumentBloc/screens/search_screen.dart';
import 'package:travelapp/queries.dart';

// void main() {
//   Bloc.observer = MySimpleBlocObserver();
//   runApp(MyApp2());
// }

class SearchTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SearchTabState();
}

class SearchTabState extends State<SearchTab> {
  Map<String, String> variables;
  SearchTab(variables) {
    this.variables = variables;
  }

  final TextEditingController _searchText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      _searchBar(),
      Container(
        // child: BlocProvider<HomeBloc>(
        //   create: (BuildContext context) => HomeBloc()..add(FetchHomeData(basicSearch,variables:{"text":"chennai"})),
        //   child: SearchScreen(),
        // ),
        // child: BlocListener(
        //   listener: (context,state){

        //   },
        child: BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc()
            ..add(FetchHomeData(basicSearch, variables: {"text": "chennai"})),
        ),
      )
      // )
    ]));
  }

  Widget _searchBar() {
    return Container(
      color: Colors.white,
      child: Material(
        elevation: 5,
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _searchText,
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.go,
                onChanged: (text) {
                  setState(() {
                    print(text);
                    FetchHomeData(basicSearch,
                        variables: {"text": _searchText.toString()});
                  });
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    hintText: "Search"),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  icon: (_searchText.text.isEmpty)
                      ? Icon(Icons.search)
                      : Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      if (_searchText.text.isNotEmpty) _searchText.text = '';
                    });
                  },
                ))
          ],
        ),
      ),
    );
    // Text(_searchText.text);
  }
}
