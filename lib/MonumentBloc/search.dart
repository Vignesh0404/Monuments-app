import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/MonumentBloc/blocs/home/monument.dart';
import 'package:travelapp/MonumentBloc/blocs/simple_delegate.dart';
import 'package:travelapp/MonumentBloc/screens/search_screen.dart';
import 'package:travelapp/queries.dart';
import 'package:travelapp/screens/styles.dart';

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

  var data;
  TextEditingController _searchText = TextEditingController();
  HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
        create: (BuildContext context) => homeBloc
          ..add(FetchHomeData(basicSearch,
              variables: {"text": _searchText.text})),
        child: BlocBuilder<HomeBloc, HomeStatesMonument>(
            builder: (BuildContext context, HomeStatesMonument state) {
          if (state is Loading) {
            return SafeArea(
                child: Scaffold(
                    backgroundColor: Color(0xFFEBEBEB),
                    body: Column(children: [
                      _searchBar(state),
                      // LinearProgressIndicator(),
                    ])
                    // appBar: _searchBar(),
                    ));
          } else if (state is LoadDataFail) {
            return Text(state.error);
          } else {
            data = (state as LoadDataSuccess).data['monuments'];

            // print(data);
            return SafeArea(
                child: Scaffold(
                    backgroundColor: Color(0xFFEBEBEB),
                    body: SingleChildScrollView(
                        child: Column(children: [
                      _searchBar(state),
                      // _getData(state),
                      // Text(data.toString()),
                      _buildMonumentWidget(),
                    ]))));
          }
        }));
  }

  Widget _buildMonumentWidget() {
    if (data.length == 0 && _searchText.text != "")
      return Center(child: Text('No results found for "${_searchText.text}"'));
    if (data.length == 0 && _searchText.text == "")
      return Center(child: Text('Enter text for searching'));
    return Container(
        child: Card(
      margin: EdgeInsets.only(right: 5, left: 5),
      child: ListView.separated(
        // physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 1,
          color: Colors.black45,
        ),

        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          var item = data[index];
          return GestureDetector(
              onTap: () {
                print('Monument ' + item['name'].toString() + ' clicked');
              },
              child: ListTile(
                // dense: true,
                leading: Container(
                    height: 90,
                    width: 70,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        (item['details']['mt_heroImg'] != null &&
                                item['details']['mt_heroImg'].length != 0 &&
                                item['details']['mt_heroImg'].toString() !=
                                    "[null]")
                            ? item['details']['mt_heroImg'][0]
                            : 'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                      ),
                    )),
                title: Text(item['name'].toString(), style: titleFontStyle),
                subtitle: Text(
                    item['location_name'].toString()
                    // +item['monuments_x_tags'].toString()
                    ,
                    style: subtitleFontStyle),
              ));
        },
      ),
    ));
  }

  Widget _searchBar(HomeStatesMonument state) {
    return Container(
      margin: EdgeInsets.all(5),
      color: Colors.white,
      child: Material(
        elevation: 5,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: TextField(
                controller: _searchText,
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.go,
                onChanged: (text) {
                  setState(() {
                    // print(text.toString());
                    // print('---------------');
                    // print('------------');
                    print(homeBloc
                      ..add(FetchHomeData(basicSearch,
                          variables: {"text": _searchText.text})));
                    // print('************');
                    data = (state as LoadDataSuccess).data['monuments'];
                    // print(data);
                    // print('------------');
                    // var data1 = (LoadDataSuccess);
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

                      print(homeBloc
                        ..add(FetchHomeData(basicSearch,
                            variables: {"text": _searchText.text})));
                      // print('************');
                      data = (state as LoadDataSuccess).data['monuments'];
                    });
                  },
                ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
