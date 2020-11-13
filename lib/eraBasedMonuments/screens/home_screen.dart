import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/MonumentBloc/blocs/home/monument.dart';
import 'package:travelapp/screens/monumentDetails.dart';
import 'package:travelapp/screens/styles.dart';
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
          data = (state as LoadDataSuccess).data['era'];
          // print(data);
          return Text(data.toString());
          
          // return Container(child: _buildMonumentWidget());
        }
      },
    );
  }

  Widget _buildMonumentWidget() {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          var item = data[index];
          return Text(item);
          // Padding(
          //   padding: EdgeInsets.only(left: 12, right: 12, top: 1),
          //   child: GestureDetector(
          //     onTap: () {},
          //     child: Container(
          //       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 1.0),
          //       padding: EdgeInsets.all(10.0),
          //       //height: 30,
          //       width: double.infinity,
          //       decoration: BoxDecoration(
          //           boxShadow: [BoxShadow(blurRadius: 1)],
          //           image: DecorationImage(
          //               image: NetworkImage(item['details']['mt_heroImg']),
          //               fit: BoxFit.cover,
          //               colorFilter: new ColorFilter.mode(
          //                   Colors.black.withOpacity(0.3),
          //                   BlendMode.hardLight)),
          //           borderRadius: BorderRadius.circular(5.0)),
          //       child: Column(
          //         children: <Widget>[
          //           Align(
          //               alignment: Alignment.topRight,
          //               child: Container(
          //                 height: 35,
          //                 width: 35,
          //                 decoration: BoxDecoration(
          //                     shape: BoxShape.circle,
          //                     color: Colors.grey.shade300),
          //                 child: IconButton(
          //                     alignment: Alignment.topLeft,
          //                     icon: Icon(
          //                       FlutterIcons.bookmark_border_mdi,
          //                       color: Colors.black,
          //                       size: 20,
          //                     ),
          //                     onPressed: null),
          //               )),
          //           SizedBox(
          //             height: 70,
          //           ),
          //           Align(
          //             alignment: Alignment.bottomLeft,
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: <Widget>[
          //                 Text(item['name'],
          //                     style: TextStyle(
          //                         color: Colors.white,
          //                         fontSize: 17,
          //                         fontFamily: 'OpenSans',
          //                         fontWeight: FontWeight.bold)),
          //                 SizedBox(
          //                   height: 7,
          //                 ),
          //                 Row(
          //                   children: <Widget>[
          //                     Text(item['details']['mt_location'],
          //                         style: TextStyle(
          //                             color: Colors.white,
          //                             fontSize: 14,
          //                             fontFamily: 'OpenSans',
          //                             fontWeight: FontWeight.w400)),
          //                     Text(' • ',
          //                         style: TextStyle(
          //                             color: Colors.white,
          //                             fontSize: 14,
          //                             fontFamily: 'OpenSans',
          //                             fontWeight: FontWeight.bold)),
          //                     Text(item['era']['name'],
          //                         overflow: TextOverflow.ellipsis,
          //                         style: TextStyle(
          //                             color: Colors.white,
          //                             fontSize: 12,
          //                             fontFamily: 'OpenSans',
          //                             fontWeight: FontWeight.w400))
          //                   ],
          //                 )
          //               ],
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
