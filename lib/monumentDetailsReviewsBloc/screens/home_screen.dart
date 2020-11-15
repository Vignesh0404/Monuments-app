import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/bookmarkBloc/blocs/home/bookmark.dart';
import 'package:travelapp/queries.dart';
import 'package:travelapp/screens/styles.dart';
import 'package:jiffy/jiffy.dart';
import '../../Queries1.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.id, this.name});
  final int id;
  final String name;

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
          return LinearProgressIndicator();
        } else if (state is LoadDataFail) {
          return Scaffold(body: Text(state.error));
        } else {
          data = (state as LoadDataSuccess).data['reviews'];
          // data = (state as LoadDataSuccess).data;
          print(data);
          // print(data);
          // return Container();
          return _buildMonumentWidget();
        }
      },
    );
  }

  Widget _buildMonumentWidget() {
    if (data.length == 0) {
      return Center(
        child: Column(
          children: <Widget>[
            Text('no reviews for the monument'),
            SizedBox(
              height: 5,
            )
          ],
        ),
      );
    }
    if (data.length == null) {
      return Center(
        child: Text('no reviews for the monument'),
      );
    } else {
      return SizedBox(
        height: 200,
        child: ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              var rating = data[index]['rating'].toString();
              return Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Reviews And Ratings', style: blackTextStyle),
                        Spacer(),
                        Container(
                          height: 25,
                          width: 25,
                          decoration: greenReviewBox,
                          child: Center(
                              child: Text(
                            '4.8',
                            style: white12,
                          )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 25.0,
                          backgroundImage:
                              NetworkImage('https://via.placeholder.com/150'),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              data[index]['user']['username'],
                              style: blackTextStyle,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(data[index]['updated_at'], style: grey14w400)
                          ],
                        ),
                        Spacer(),
                        Container(
                          height: 25,
                          width: 25,
                          decoration: greenReviewBox,
                          child: Center(
                              child: Text(
                            data[index]['rating'].toString(),
                            style: white12,
                          )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 55.0),
                      child: Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey.shade400),
                    ),
                    SizedBox(height: 10),
                    Text(
                      data[index]['comment'],
                      style: subtitleFontStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            }),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}

/* 

Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('Reviews And Ratings', style: blackTextStyle),
                      Spacer(),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: greenReviewBox,
                        child: Center(
                            child: Text(
                          '4.8',
                          style: white12,
                        )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 25.0,
                        backgroundImage:
                            NetworkImage('https://via.placeholder.com/150'),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Venky',
                            style: blackTextStyle,
                          ),
                          Text("8 days ago", style: grey14w400)
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: greenReviewBox,
                        child: Center(
                            child: Text(
                          '5.0',
                          style: white12,
                        )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55.0),
                    child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey.shade400),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Mandagapatu was known for its Proin gravida nibh vel velit auctor aliquet. Aenesollicitudin, lorem quis bibendauctor, nisi elit consequat ipsum, nec. Read more...',
                    style: subtitleFontStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              );

              */
