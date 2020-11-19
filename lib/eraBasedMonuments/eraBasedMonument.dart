import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/MonumentBloc/blocs/home/monument.dart';
import 'package:travelapp/Queries1.dart';

// void main() {
//   Bloc.observer = MySimpleBlocObserver();
//   runApp(MyApp2());
// }

class EraBasedMonuments extends StatelessWidget {
  EraBasedMonuments({this.id});
  var data;
  final int id;

  @override
  Widget build(BuildContext context) {
    // var id = data['details']['mt_era'];
    return BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc()
          ..add(FetchHomeData(eraBasedMonuments, variables: {"id": id})),
        child: BlocBuilder<HomeBloc, HomeStatesMonument>(
          builder: (BuildContext context, HomeStatesMonument state) {
            if (state is Loading) {
              return CircularProgressIndicator(
                  backgroundColor: Color(0xFFCEAF41));
            } else if (state is LoadDataFail) {
              return Text(state.error);
            } else {
              data = (state as LoadDataSuccess).data['era'][0]['monuments'];

              // print(data);
              // print(data[0]['monuments'].length);
              // return Text(data.toString());

              return Container(child: _buildMonumentWidget());
            }
          },
        ));
  }

  Widget _buildMonumentWidget() {
    return Container(
      child: ListView.builder(
        // separatorBuilder: (BuildContext context, int index) => Divider(
        //   height: 1,
        //   color: Colors.black,
        // ),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          var item = data[index];

          print('idasda $id');
          //print(item['details']['mt_era']);
          //print(item['details']['mt_heroImg'].toString());
          //var id = item['name'].toString();
          return //Text(item['name'].toString());
              Padding(
            padding: EdgeInsets.only(left: 12, right: 12, top: 1),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 1.0),
                padding: EdgeInsets.all(10.0),
                //height: 30,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 1)],
                    image: (item['details']['mt_heroImg'] != null &&
                            item['details']['mt_heroImg'].length != 0 &&
                            item['details']['mt_heroImg'].toString() !=
                                "[null]")
                        ? DecorationImage(
                            image:
                                NetworkImage(item['details']['mt_heroImg'][0]),
                            fit: BoxFit.cover,
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.5),
                                BlendMode.hardLight))
                        : DecorationImage(
                            image:
                                // NetworkImage(item['details']['mt_heroImg'][0]),
                                NetworkImage(
                                    'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                            fit: BoxFit.cover,
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.5),
                                BlendMode.hardLight)),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 70,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(item['name'].toString(),
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
                              Text(item['details']['mt_location'].toString(),
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
                              Text(item['era']['name'].toString(),
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
}
