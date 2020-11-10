import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/MonumentBloc/blocs/home/monument.dart';
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
          // print(item['details']['mt_heroImg']);
          return GestureDetector(
              onTap: () {
                print('Monument ' + item['name'].toString() + ' clicked');
              },
              child: Container(
                height: 30,
                margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 1)],
                    image: DecorationImage(
                        image: NetworkImage(item['details']['mt_heroImg'][0]),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3),
                            BlendMode.hardLight)),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(item['name'].toString(), style: white17w600),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: <Widget>[
                              Text(item['location_name'].toString(),
                                  style: white14w400)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }

  int _convertToColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
