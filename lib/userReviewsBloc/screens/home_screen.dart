import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/bookmarkBloc/blocs/home/bookmark.dart';
import 'package:travelapp/queries.dart';
import 'package:travelapp/screens/styles.dart';

import '../../Queries1.dart';

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
          return Scaffold(body: LinearProgressIndicator());
        } else if (state is LoadDataFail) {
          return Scaffold(
              appBar: AppBar(
                elevation: 1.0,
                bottomOpacity: 4,
                backgroundColor: Colors.white,
                title: Text('My Reviews', style: largeTitleFontStyle),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              body: Text(state.error));
        } else {
          data = (state as LoadDataSuccess).data['reviews'];
          // data = (state as LoadDataSuccess).data;
          print(data);
          // print(data);
          // return Container();
          return Scaffold(
              appBar: AppBar(
                elevation: 1.0,
                bottomOpacity: 4,
                backgroundColor: Colors.white,
                title: Text('My Reviews', style: largeTitleFontStyle),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              body: _buildMonumentWidget());
        }
      },
    );
  }

  List<int> _selectedID = [];
  Widget _buildMonumentWidget() {
    return Container(
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              //var item = data[index]['monument'];
              //var rating = int.parse(data[index]['rating']);
              return Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            data[index]['monument']['name'],
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                fontSize: 15),
                          ),
                          Spacer(),
                          Container(
                            height: 30,
                            width: 32,
                            //color: Colors.lightGreen[500],
                            decoration: BoxDecoration(
                                color: Color(0xFF6ECA4B),
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Center(
                                child: Text(
                              data[index]['rating'].toString(),
                              style: TextStyle(color: Colors.white),
                            )),
                          )
                        ],
                      ),
                      // SizedBox(height: 0.5),
                      Text(
                        data[index]['monument']['location_name'] +
                            data[index]['id'].toString(),
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: double.infinity,
                          child: Text(
                            data[index]['comment'],
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                color: Colors.grey.shade600),
                          )),
                      SizedBox(
                        height: 22,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            data[index]['updated_at'],
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                color: Colors.grey.shade500),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              SizedBox(height: 15),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 15),
                                                child: Text('Confirm Delete',
                                                    style: titleFontStyle),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 15, right: 15),
                                                child: Container(
                                                  width: double.infinity,
                                                  child: Text(
                                                      'Are you sure you want to delete the review?',
                                                      style: grey14w400),
                                                ),
                                              ),
                                              Spacer(),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 15.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    Spacer(),
                                                    Text('CANCEL',
                                                        style:
                                                            cancelButtonText),
                                                    SizedBox(
                                                      width: 16,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        HomeBloc()
                                                          ..add(FetchHomeData(
                                                              deleteReview,
                                                              variables: {
                                                                "reviewId":
                                                                    data[index]
                                                                        ['id']
                                                              }));
                                                        Navigator.of(context)
                                                            .pop();
                                                        setState(() {});
                                                      },
                                                      child: Text(
                                                        'DELETE',
                                                        style: deleteButtonText,
                                                      ),
                                                    )
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
                            },
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                  color: Colors.red.shade500,
                                  fontFamily: 'OpenSans'),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey.shade400)
                    ],
                  ),
                ),
              );
            }));
  }

  @override
  void dispose() {
    super.dispose();
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
}
