import 'package:flutter/material.dart';
import 'package:travelapp/screens/styles.dart';

class MyReviews extends StatefulWidget {
  MyReviews({Key key}) : super(key: key);

  @override
  _MyReviewsState createState() => _MyReviewsState();
}

class _MyReviewsState extends State<MyReviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1.0,
        bottomOpacity: 4,
        backgroundColor: Colors.white,
        title: Text(
          'My Reviews',
          style: largeTitleFontStyle
          ),
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
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Shore Temple',
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
                      '4.0',
                      style: TextStyle(color: Colors.white),
                    )),
                  )
                ],
              ),
              // SizedBox(height: 0.5),
              Text(
                'Mahabalipuram',
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
                    'Shore temple experience was absolutely Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat Read more... ',
                    style: TextStyle(
                        fontFamily: 'OpenSans', color: Colors.grey.shade600),
                  )),
              SizedBox(
                height: 22,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Posted 2 days ago',
                    style: TextStyle(
                        fontFamily: 'OpenSans', color: Colors.grey.shade500),
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
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 15),
                                      Padding(
                                        padding: EdgeInsets.only(left:15),
                                        child:Text(
                                      
                                        'Confirm delete',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black),
                                      ),),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left:15,right:15),
                                        child:Container(
                                        width: double.infinity,
                                        child: Text(
                                          'Are you sure you want to delete the review?',
                                          style: TextStyle(
                                              fontFamily: 'OpenSans',
                                              color: Colors.grey.shade400,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),),
                                      Spacer(),
                                      Padding(
                                        padding: EdgeInsets.only(right: 15.0),
                                        child:Row(
                                        children: <Widget>[
                                          Spacer(),
                                          Text(
                                            'CANCEL',
                                            style: TextStyle(
                                                color: Colors.grey.shade500,
                                                fontFamily: 'OpenSans'),
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Text(
                                            'DELETE',
                                            style: TextStyle(
                                                color: Colors.red.shade500,
                                                fontFamily: 'OpenSans'),
                                          )
                                        ],
                                      ),),
                                      SizedBox(height:15)
                                      
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
                          color: Colors.red.shade500, fontFamily: 'OpenSans'),
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
      ),
    );
  }
}
