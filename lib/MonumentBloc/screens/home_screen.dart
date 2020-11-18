import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/MonumentBloc/blocs/home/monument.dart';
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
          return Column(children: [
            SizedBox(height: 20),
            SizedBox(
                height: 65,
                width: 65,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFFCEAF41)),
                  ),
                )),
            SizedBox(
              height: 20,
            )
          ]);
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
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          var item = data[index];
          var name = item['name'];
          var heroImg = item['details']['mt_heroImg'][0];
          var location = item["location_name"];
          var video = item['details']['mt_video'];
          var galleryImage = item['details']['mt_gallery'];
          var openFrom = item['details']['mt_openFrom'];
          var openTill = item['details']['mt_openTill'];
          var numberType = item['details']['mt_numberType'];
          var mapLocation = item['details']['mt_mapLocation'];
          var desc = item['details']['mt_description'];
          var phoneNum = item['details']['phoneNumber'];
          var eraName = item['era']['name'];
          // print(item['details']['mt_heroImg']);
          return GestureDetector(
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
                print('Monument ' + item['name'].toString() + ' clicked');
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
                      margin:
                          EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Container(
                        height: 300,
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
                  margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
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
                                    style: white14w400)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ]));
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
