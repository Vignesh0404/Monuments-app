import 'package:flutter/material.dart';
import 'package:travelapp/MonumentBloc/search.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/MonumentBloc/blocs/home/monument.dart';
import 'package:travelapp/MonumentBloc/blocs/simple_delegate.dart';
import 'package:travelapp/MonumentBloc/screens/search_screen.dart';
import 'package:travelapp/queries.dart';

class SearchTry extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchState();
}

class _SearchState extends State<SearchTry> {
  final TextEditingController _searchText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      // Container(
      //   color: Colors.white,
      //   child: Material(
      //     elevation: 5,
      //     child: Row(
      //       children: <Widget>[
      //         Expanded(
      //           child: TextField(
      //             controller: _searchText,
      //             cursorColor: Colors.black,
      //             keyboardType: TextInputType.text,
      //             textInputAction: TextInputAction.go,
      //             onChanged: (text) {
      //               setState(() {
      //                 // print(text);

      //               });
      //             },
      //             decoration: InputDecoration(
      //                 border: InputBorder.none,
      //                 contentPadding: EdgeInsets.symmetric(horizontal: 15),
      //                 hintText: "Search"),
      //           ),
      //         ),
      //         Padding(
      //             padding: const EdgeInsets.only(right: 8.0),
      //             child: IconButton(
      //               icon: (_searchText.text.isEmpty)
      //                   ? Icon(Icons.search)
      //                   : Icon(Icons.close),
      //               onPressed: () {
      //                setState(() {
      //                   if (_searchText.text.isNotEmpty) _searchText.text = '';
      //                });
      //               },
      //             ))
      //       ],
      //     ),
      //   ),
      // ),
      // Text(_searchText.text),
      //   SingleChildScrollView(child:Container(
      //   child: BlocProvider<HomeBloc>(
      //     create: (BuildContext context) => HomeBloc()..add(FetchHomeData(basicSearch,variables: {"text":_searchText.text.toString()})),
      //     child: SearchScreen(),
      //   ),
      // )),
      // Container(child:FetchHomeData(basicSearch,variables: variables),),
      // SearchTab({"text":_searchText.text.toString()}),
    ]));
  }
}
