import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/bookmarkBloc/blocs/home/bookmark.dart';
import 'package:travelapp/queries.dart';
import 'package:travelapp/screens/styles.dart';

import '../../Queries1.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.id});
  final int id;

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
                title: Text('Add Review', style: largeTitleFontStyle),
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
                title: Text('Add Review' + '' + widget.id.toString(),
                    style: largeTitleFontStyle),
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

  Widget _buildMonumentWidget() {
    return Container(
      child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            TextEditingController reviewComment = new TextEditingController();
            TextEditingController reviewRating = new TextEditingController();
            //String reviewComment;
            //int reviewRating;
            final formKey = new GlobalKey<FormState>();
            //var item = data[index]['monument'];
            //var rating = int.parse(data[index]['rating']);
            return Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Your Review",
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
                      controller: reviewComment,
                      validator: (value) =>
                          value.isEmpty ? 'Please enter your rating' : null,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          prefixText: "0/5 ",
                          labelText: "Your Rating",
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
                      controller: reviewRating,
                      validator: (value) =>
                          value.isEmpty ? 'Please enter your review' : null,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            padding: EdgeInsets.only(
                                                left: 15, right: 15),
                                            child: Container(
                                              width: double.infinity,
                                              child: Text(
                                                  'Are you sure you want to post this comment?',
                                                  style: grey14w400),
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 15.0),
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
                                                      Navigator.of(context)
                                                          .pop();
                                                      HomeBloc()
                                                        ..add(FetchHomeData(
                                                            insertReview,
                                                            variables: {
                                                              "monumentId": int
                                                                  .parse(widget
                                                                      .id
                                                                      .toString()),
                                                              "comment":
                                                                  reviewComment,
                                                              "rating": int.parse(
                                                                  reviewRating
                                                                      .toString())
                                                            }));
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      'CONFIRM',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .green.shade500,
                                                          fontFamily:
                                                              'OpenSans'),
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
                          "SUBMIT",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
