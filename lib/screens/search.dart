import 'package:flutter/material.dart';
import 'package:travelapp/MonumentBloc/Monument.dart';
import 'package:travelapp/MonumentBloc/search.dart';
import 'package:travelapp/screens/styles.dart';
import 'package:travelapp/eraBloc/era.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchText = TextEditingController();
    Widget searchIcon = SvgPicture.asset('images/searchTabIcon.svg');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true, // Don't show the leading button
              titleSpacing: 7,
              elevation: 0,
              backgroundColor: Colors.white,
              title: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchTab()),
                  );
                },
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    height: 48,
                    child: Material(
                      elevation: 5,
                      child: ListTile(
                        dense: true,
                        title: Text(
                          'Search',
                          style: loginFormStyle,
                        ),
                        trailing: 
                          searchIcon,
                      ),
                    )),
              ),
            ),
            resizeToAvoidBottomInset: false,
            // resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Container(height: 10),
                    // Padding(
                    //   padding: EdgeInsets.all(5),
                    //   child: Text(
                    //     'Search by Most Popular Tags',
                    //     style: titleFontStyle,
                    //   ),
                    // ),
                    // Container(
                    //     child: Wrap(children: <Widget>[
                    //   returnChip('Basic Chip'),
                    //   returnChip('Chip which is long'),
                    //   returnChip('Chennai'),
                    //   returnChip('Mahabalipuram'),
                    //   returnChip('Chip'),
                    //   returnChip('300'),

                    //   ///Add more Chips Dynammically
                    // ])),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Most Viewed Monuments',
                        style: largeTitleFontStyle18,
                      ),
                    ),
                    // _searchBar(),
                    Monument(),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Search by Era',
                        style: largeTitleFontStyle18,
                      ),
                    ),
                    Era(),
                  ],
                ),
              ),
            )));
  }

  Widget returnChip(String chipName) {
    return Padding(
        padding: EdgeInsets.only(right: 5),
        child: GestureDetector(
            onTap: () {
              print('Chip ' + chipName + ' clicked');
            },
            child: Chip(
              label: Text(
                chipName,
                overflow: TextOverflow.ellipsis,
                style: normalTextStyle600,
              ),
              backgroundColor: const Color(0xFFF4F4F4),
            )));
  }

  Widget _searchBar() {
    return Container(
      color: Colors.white,
      child: Material(
        elevation: 5,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchTab()),
            );
          },
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  'Search..',
                ),
              ),
              Spacer(),
              Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    icon: (_searchText.text.isEmpty)
                        ? searchIcon
                        : Icon(Icons.close),
                    onPressed: () {
                      if (_searchText.text.isNotEmpty) _searchText.text = '';
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
