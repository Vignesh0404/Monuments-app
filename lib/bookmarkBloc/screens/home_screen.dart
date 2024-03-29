import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelapp/bookmarkBloc/blocs/home/bookmark.dart';
import 'package:travelapp/queries.dart';
import 'package:travelapp/screens/monumentDetails.dart';
import 'package:travelapp/screens/styles.dart';

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
          return Scaffold(
            appBar: _appBar(),
            body: Center(
              child: SizedBox(
                height: 65,
                width:65,
                child:CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFCEAF41)),
              ),
            ),)
          );
        } else if (state is LoadDataFail) {
          return Scaffold(body: Text(state.error));
        } else {
          data = (state as LoadDataSuccess).data['bookmark'];
          // data = (state as LoadDataSuccess).data;
          print(data);
          // print(data);
          // return Container();
          return Scaffold(appBar: _appBar(), body: _buildMonumentWidget());
        }
      },
    );
  }

  int _selectedCount = 0;
  bool _manageClicked = false;
  void handleClick(String value) {
    setState(() {
      _manageClicked = !_manageClicked;
    });
  }

  TextStyle descStyle = TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color(0xFF565656));

  TextStyle desc = TextStyle(
      fontFamily: 'OpenSans', fontSize: 14, fontWeight: FontWeight.w400);
  List<bool> _selected = List.generate(100, (i) => false);
  List<int> _selectedID = [];
  Widget _buildMonumentWidget() {
    if (data.length == _selectedID.length) {
      // print('Empty');
      return _emptyBookmark();
    }
    if (data.toString() != "[]") {
      return Container(
          child: ListView.builder(
        // physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          var item = data[index]['monument'];

          var id = item['id'];
          var heroImg = item['details']['mt_heroImg'][0];
          var name = item['details']["mt_name"];
          var location = item['details']["mt_location"];
          var eraName = item['era']['name'];
          var video = item['details']['mt_video'];
          var galleryImage = item['details']['mt_gallery'];
          var openFrom = item['details']['mt_openFrom'];
          var openTill = item['details']['mt_openTill'];
          var numberType = item['details']['mt_numberType'];
          var mapLocation = item['details']['mt_mapLocation'];
          var desc = item['details']['mt_description'];
          var phoneNum = item['details']['phoneNumber'];
          var rating = item['reviews_aggregate']["aggregate"]['avg']['rating'];
          // print(item);
          // print(item);
          // print(_selected);
          if (!_selectedID.contains(data[index]['id']))
            return GestureDetector(
                // onTap: () {
                //   Navigator.of(context).push(new MaterialPageRoute(
                //       builder: (BuildContext context) => new MonumentReview()));
                //   // print('Monument ' + item['id'].toString() + ' clicked');
                // },
                child: Container(
              color: _selected[index] ? Colors.grey[200] : null,
              child: ListTile(
                  trailing: (_selectedCount != 0 || _manageClicked == true)
                      ? ((_selected[index])
                          ? Icon(
                              Icons.check_box,
                              color: Colors.deepOrange,
                            )
                          : Icon(Icons.check_box_outline_blank))
                      : null,
                  leading: Container(
                      height: 60,
                      width: 90,
                      decoration: BoxDecoration(
                          image: (item['details']['mt_heroImg'] != null &&
                                  item['details']['mt_heroImg'].length != 0 &&
                                  item['details']['mt_heroImg'].toString() !=
                                      "[null]")
                              ? DecorationImage(
                                  image: NetworkImage(
                                      item['details']['mt_heroImg'][0]),
                                  fit: BoxFit.cover)
                              : DecorationImage(
                                  image:
                                      // NetworkImage(item['details']['mt_heroImg'][0]),
                                      NetworkImage(
                                          'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                  fit: BoxFit.cover))),
                  isThreeLine: true,
                  title: RichText(
                      text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text:
                            '${item['details']['mt_name'].toString()[0].toUpperCase()}${item['details']['mt_name'].toString().substring(1)}',
                        style: titleFontStyle),
                  ])),
                  subtitle: (item['details']['mt_description'] != null)
                      ? RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text:
                                    '${item['details']['mt_location'].toString()[0].toUpperCase()}${item['details']['mt_location'].toString().substring(1)}',
                                style: descStyle),
                            TextSpan(
                                text: ' • ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFF565656))),
                            TextSpan(
                                text:
                                    '${item['era']['name'].toString()[0].toUpperCase()}${item['era']['name'].toString().substring(1)}',
                                style: descStyle),
                            TextSpan(text: '\n'),
                            TextSpan(
                                text:
                                    '${item['details']['mt_description'].toString()[0].toUpperCase()}${item['details']['mt_description'].toString().substring(1)}',
                                style: descStyle)
                          ]),
                          maxLines: 2,
                        )
                      : RichText(
                          maxLines: 2,
                          text: TextSpan(children: [
                            TextSpan(
                                text:
                                    '${item['details']['mt_location'].toString()[0].toUpperCase()}${item['details']['mt_location'].toString().substring(1)}',
                                style: descStyle),
                            TextSpan(
                                text: ' • ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFF565656))),
                            TextSpan(
                                text:
                                    '${item['era']['name'].toString()[0].toUpperCase()}${item['era']['name'].toString().substring(1)}',
                                style: descStyle),
                            TextSpan(text: '\n')
                          ])),
                  onTap: () {
                    if (_selectedCount == 0 && _manageClicked == false) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => MonumentDetails(
                              name: name,
                              id: id,
                              //index: item,
                              heroImg: heroImg,
                              location: location,
                              eraName: eraName,
                              video: video,
                              galleryImage: galleryImage,
                              // openFrom: openFrom,
                              // openTill: openTill,
                              // numberType: numberType,
                              // mapLocation: mapLocation,
                              desc: desc,
                              rating: rating
                              // phonNum: phoneNum,
                              )));
                    }
                    setState(() {
                      if (_selectedCount != 0 || _manageClicked == true) {
                        if (_selected[index] == true) {
                          _selected[index] = false;
                          _selectedCount--;
                        } else {
                          _selectedCount++;
                          _selected[index] = true;
                        }
                      }
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      if (_selected[index] == false) {
                        _selected[index] = true;
                        _selectedCount++;
                      }
                    });
                  }),
            ));
          else
            return Container();
        },
      ));
    } else
      return _emptyBookmark();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _emptyBookmark() {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          SvgPicture.asset('images/emptyBookmark.svg'),
          Text("You haven't added any bookmarks yet")
        ]));
  }

  Widget showDeleteAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            child: Container(
              height: 165,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text('Confirm Delete', style: titleFontStyle),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        width: double.infinity,
                        child: Text(
                            'Are you sure you want to delete the bookmark?',
                            style: grey14w400),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Row(
                        children: <Widget>[
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('CANCEL', style: cancelButtonText),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          GestureDetector(
                              onTap: () {
                                _showForDelete();
                                _selectedCount = 0;
                                _selected = List.generate(100, (i) => false);
                                Navigator.of(context).pop();
                                HomeBloc()
                                  ..add(FetchHomeData(deleteMultipleBookmarks,
                                      variables: {"bookmarkId": _selectedID}));
                                setState(() {});
                              },
                              child: Text(
                                'DELETE',
                                style: deleteButtonText,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 15)
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _appBar() {
    return AppBar(
      elevation: 0,
      bottomOpacity: 4,
      backgroundColor: Colors.white,
      actions: <Widget>[
        (_selectedCount == 0)
            ? PopupMenuButton<String>(
                onSelected: handleClick,
                itemBuilder: (BuildContext context) {
                  return {(!_manageClicked) ? 'Manage' : 'Cancel'}
                      .map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              )
            : Container(),
      ],
      title: (_selectedCount == 0)
          ? Row(
              children: <Widget>[
                Text(
                  'My Bookmarks',
                  style: largeTitleFontStyle,
                ),
              ],
            )
          : Row(
              children: <Widget>[
                Text('$_selectedCount'),
                Spacer(),
                GestureDetector(
                  child: Icon(Icons.delete, color: Colors.deepOrange),
                  onTap: () {
                    // print(_selected.toString());

                    return showDeleteAlert(context);
                  },
                ),
                SizedBox(width:15.5)
              ],
            ),
      titleSpacing: 0,
      leading: (_manageClicked || _selectedCount != 0)
          ? GestureDetector(
              child: Icon(
                Icons.close,
                color: Colors.black,
              ),
              onTap: () {
                for (int i = 0; i < _selected.length; i++) _selected[i] = false;
                setState(() {
                  _selectedCount = 0;
                  _manageClicked = false;
                });
              },
            )
          : GestureDetector(
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
    );
  }

  void _showForDelete() {
    for (int i = 0; i < data.length; i++) {
      if (_selected[i] == true) _selectedID.add(data[i]['id']);
    }
    print('List to be deleted' + _selectedID.toString());
  }
}
