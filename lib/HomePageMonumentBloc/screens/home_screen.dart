import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/MonumentBloc/blocs/home/monument.dart';
import 'package:travelapp/screens/errorPage.dart';
import 'package:travelapp/screens/monumentDetails.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Color(0xFFCEAF41),
            ),
          );
        } else if (state is LoadDataFail) {
          return Text(state.error);
        } else {
          data = (state as LoadDataSuccess).data['monuments'];
          // print(data);
          return Container(child: _buildMonumentWidget());
        }
      },
    );
  }

  Widget _buildMonumentWidget() {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 1,
        //   //childAspectRatio: 1,
        // ),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          var item = data[index];
          var id = item['id'];
          var heroImg = item['details']['mt_heroImg'][0];
          var name = item["name"];
          var location = item["location_name"];
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
          //print(rating);
          //var avgRating =
          // item['reviews_aggregate']['aggregate']['avg']['rating'];
          //print(location);
          // print(galleryImage);
          // print(item['details']['mt_heroImg']);
          return Padding(
            padding: EdgeInsets.only(left: 5, right: 5, top: 1),
            child: GestureDetector(
                onTap: () {
                  galleryImage[2] == 0
                      ? Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => ErrorPage()))
                      : Navigator.of(context).push(MaterialPageRoute(
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
                },
                child: Stack(children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        begin: FractionalOffset.bottomCenter,
                        end: FractionalOffset.topCenter,
                        stops: [0.0, 1.0],
                        // center: Alignment.bottomCenter,
                        // radius: 1.0,
                        colors: <Color>[Colors.black87, Colors.white],
                        tileMode: TileMode.mirror,
                      ).createShader(bounds);
                    },
                    child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 7.0, horizontal: 7.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: FadeInImage.assetNetwork(
                                fadeInDuration: Duration(milliseconds: 1),
                                placeholder: 'images/emptyBookmark.JPG',
                                image: item['details']['mt_heroImg'][0],
                                fit: BoxFit.cover,
                              )),
                        )),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
                    padding: EdgeInsets.all(10.0),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 85,
                              ),
                              Text(
                                  '${item['name'].toString()[0].toUpperCase()}${item['name'].toString().substring(1)}',
                                  style: white17w600),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                      '${item['location_name'].toString()[0].toUpperCase()}${item['location_name'].toString().substring(1)}',
                                      style: white14w400),
                                  Text(' • ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'OpenSans',
                                          fontWeight: FontWeight.bold)),
                                  Text(eraName,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'OpenSans',
                                          fontWeight: FontWeight.w400))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ])),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
