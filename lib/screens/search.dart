import 'package:flutter/material.dart';
import 'package:travelapp/MonumentBloc/Monument.dart';
import 'package:travelapp/screens/styles.dart';
import 'package:travelapp/eraBloc/era.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool _displaySearch = false;
  final TextEditingController _searchText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                    // Replace this container with your Map widget
                    Container(),
                    Container(
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
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 15),
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
                                    if (_searchText.text.isNotEmpty)
                                      _searchText.text = '';
                                  },
                                ))
                          ],
                        ),
                      ),
                    ),
                    Container(height: 15),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Search by Most Popular Tags',
                        style: titleFontStyle,
                      ),
                    ),
                    Container(
                        child: Wrap(children: <Widget>[
                      returnChip('Basic Chip'),
                      returnChip('Chip which is long'),
                      returnChip('Chennai'),
                      returnChip('Mahabalipuram'),
                      returnChip('Chip'),
                      returnChip('300'),

                      ///Add more Chips Dynammically
                    ])),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Search by Most Viewed Monuments',
                        style: titleFontStyle,
                      ),
                    ),
                    Monument(),

                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Search by Era',
                        style: titleFontStyle,
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
}
