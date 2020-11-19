import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
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
          return Scaffold(
              body: CircularProgressIndicator(
                  backgroundColor: Color(0xFFCEAF41)));
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
              backgroundColor: Colors.white,
              body: _buildMonumentWidget());
        }
      },
    );
  }

  List<int> _selectedID = [];
  Widget _buildMonumentWidget() {
    if (data.length == 0) {
      return Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Image.asset(
              'images/emptyReviews.JPG',
              scale: 2,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "'You haven't posted any reviews yet",
              style: TextStyle(fontSize: 14, color: Color(0xFF565656)),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      );
    }
    if (data.length == null) {
      return Center(
        child: Text("'You haven't posted any reviews yet"),
      );
    } else {
      return Container(
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                //var item = data[index]['monument'];
                //var rating = int.parse(data[index]['rating']);
                String date = data[index]['updated_at'];
                int i = 10;
                String finalDate =
                    date.substring(0, i) + ',' + date.substring(i + 1, 18);
                print('date = ' + finalDate);
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
                          data[index]['monument']['location_name'],
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
                              'Posted ' +
                                  Jiffy(finalDate, "yyyy-MM-dd,hh:mm:s")
                                      .fromNow() +
                                  ' ago',
                              style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  color: Colors.grey.shade500),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            new EditPage(
                                              comment: data[index]['comment'],
                                              rating: data[index]['rating'],
                                              id: data[index]['id'],
                                            )));
                              },
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
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
                                                          style:
                                                              deleteButtonText,
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

class EditPage extends StatefulWidget {
  EditPage({this.comment, this.id, this.rating});
  final String comment;
  final int rating;
  final int id;

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController updateComment = new TextEditingController();
  TextEditingController updateRating = new TextEditingController();
  String comment;
  String rating;
  @override
  void initState() {
    // TODO: implement initState
    comment = widget.comment;
    rating = widget.rating.toString();

    updateComment = new TextEditingController(text: widget.comment);
    updateRating = new TextEditingController(text: widget.rating.toString());
    super.initState();
  }

  final formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        bottomOpacity: 4,
        backgroundColor: Colors.white,
        title: Text('Edit Review', style: largeTitleFontStyle),
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
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: updateComment,
                onChanged: (String str) {
                  setState(() {
                    comment = str;
                  });
                },
                decoration: InputDecoration(
                    labelText: "Update Comment",
                    labelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400])),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400])),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black))),
                validator: (value) =>
                    value.isEmpty ? 'Please enter your review' : null,
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: updateRating,
                onChanged: (String str) {
                  setState(() {
                    rating = str;
                  });
                },
                maxLength: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixText: "0/5 ",
                    labelText: 'Update Rating',
                    labelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400])),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400])),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black))),
                validator: (value) =>
                    value.isEmpty ? 'Please enter your rating' : null,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(top: 0, left: 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    )),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () async {
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
                                      child: Text('Add Review',
                                          style: titleFontStyle),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      child: Container(
                                        width: double.infinity,
                                        child: Text(
                                            'Are you sure you want to edit this comment?',
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
                                            child: Text('CANCEL',
                                                style: cancelButtonText),
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                                HomeBloc()
                                                  ..add(FetchHomeData(
                                                      updateReview,
                                                      variables: {
                                                        "reviewId": widget.id,
                                                        "comment": comment,
                                                        "rating": rating
                                                      }));
                                                Navigator.of(context).pop();
                                                setState(() {});
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                'CONFIRM',
                                                style: TextStyle(
                                                    color:
                                                        Colors.green.shade500,
                                                    fontFamily: 'OpenSans'),
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
                  },
                  color: Color(0xFFE5CE7E),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "UPDATE",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
