import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/MonumentBloc/blocs/home/monument.dart';
import 'package:travelapp/screens/monumentDetails.dart';
import 'package:flutter_icons/flutter_icons.dart';

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
          return LinearProgressIndicator();
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
          //print(location);
          // print(galleryImage);
          // print(item['details']['mt_heroImg']);
          return Padding(
            padding: EdgeInsets.only(left: 12, right: 12, top: 1),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MonumentDetails(
                          name: name,
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
                          // phonNum: phoneNum,
                        )));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 1.0),
                padding: EdgeInsets.all(10.0),
                //height: 30,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 1)],
                    image: DecorationImage(
                        image: NetworkImage(heroImg),
                        fit: BoxFit.cover,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.3),
                            BlendMode.hardLight)),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Column(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade300),
                          child: IconButton(
                              alignment: Alignment.topLeft,
                              icon: Icon(
                                FlutterIcons.bookmark_border_mdi,
                                color: Colors.black,
                                size: 20,
                              ),
                              onPressed: null),
                        )),
                    SizedBox(
                      height: 70,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: <Widget>[
                              Text(location,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w400)),
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
              ),
            ),
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
