import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/eraBasedMonuments/screens/home_screen.dart';
import 'package:travelapp/MonumentBloc/blocs/home/monument.dart';
import 'package:travelapp/MonumentBloc/blocs/simple_delegate.dart';
import 'package:travelapp/Queries1.dart';

// void main() {
//   Bloc.observer = MySimpleBlocObserver();
//   runApp(MyApp2());
// }

class EraBasedMonuments extends StatelessWidget {
  var data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc()
          ..add(FetchHomeData(eraBasedMonuments, variables: {"id": 26})),
        child: BlocBuilder<HomeBloc, HomeStatesMonument>(
          builder: (BuildContext context, HomeStatesMonument state) {
            if (state is Loading) {
              return LinearProgressIndicator();
            } else if (state is LoadDataFail) {
              return Text(state.error);
            } else {
              data = (state as LoadDataSuccess).data['era'];
              // print(data);

              //return Text(data.toString());

              return Container(child: _buildMonumentWidget());
            }
          },
        ));
  }

  Widget _buildMonumentWidget() {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          var item = data[index];
          //var id = item['name'].toString();
          return Text(item.toString());
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
}
