import 'package:flutter/material.dart';
import 'package:travelapp/screens/styles.dart';

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
                padding: EdgeInsets.all(15),
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
                    Text(
                      'Search by Most Popular Tags',
                      style: titleFontStyle,
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
                    Text(
                      'Search by Most Viewed Monuments',
                      style: titleFontStyle,
                    ),
                    Row(children: <Widget>[
                      returnMonument('images/shoreTemple.jpg', 'Shore Temple',
                          'Mahabalipuram'),
                      Container(width: 15),
                      returnMonument('images/shoreTemple.jpg', 'Shore Temple',
                          'Mahabalipuram'),
                    ]),
                    // Container(height:10),
                    Row(
                        // width: double.infinity,
                        children: <Widget>[
                          returnMonument('images/shoreTemple.jpg',
                              'Shore Temple', 'Mahabalipuram'),

                          Container(width: 15),
                          returnMonument('images/shoreTemple.jpg',
                              'Shore Temple', 'Mahabalipuram'),
                          // ),
                        ]),
                    Container(height: 5),
                    Text(
                      'Search by Era',
                      style: titleFontStyle,
                    ),
                    Row(children: <Widget>[
                      eraWidget('Upto 300 CE', Color(0xFFEED172)),
                      Container(width: 10),
                      eraWidget('300 CE - 630 CE', Color(0xFFE5CE7E)),
                    ]),
                    Row(children: <Widget>[
                      eraWidget('630 CE - 700 CE', Color(0xFFE3C563)),
                      Container(width: 10),
                      eraWidget('700 CE - 732 CE', Color(0xFFDABA50)),
                    ]),
                    Row(children: <Widget>[
                      eraWidget('732 CE - 846 CE', Color(0xFFCDAE4B)),
                      Container(width: 10),
                      eraWidget('846 CE - 1300 CE', Color(0xFFB49942)),
                    ]),
                    Row(children: <Widget>[
                      eraWidget('1300 CE - 1700 CE', Color(0xFFA08A40)),
                      Container(width: 10),
                      eraWidget('Post 1700 CE', Color(0xFF937F3E)),
                    ]),
                  ],
                ),
              ),
            )));
  }

  Widget eraWidget(String eraName, Color color) {
    return Expanded(
        child: GestureDetector(
          onTap: (){
            print(eraName+' clicked');
          },
          child:Container(
            height: 70,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 1.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0), color: color),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(eraName, style: white17w600),
                ],
              ),
            ))));
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

  Widget returnMonument(
      String imageAddress, String monumentName, String monumentLocation) {
    return Expanded(
        child: AspectRatio(
            aspectRatio: 1,
            child: GestureDetector(
                onTap: () {
                  print('Monument ' + monumentName + ' clicked');
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 1.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 1)],
                      image: DecorationImage(
                          image: AssetImage(imageAddress),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.3),
                              BlendMode.hardLight)),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(monumentName, style: white17w600),
                            SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: <Widget>[
                                Text(monumentLocation, style: white14w400)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))));
  }
}
