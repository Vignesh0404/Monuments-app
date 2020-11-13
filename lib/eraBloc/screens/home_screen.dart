import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/eraBloc/blocs/home/era.dart';
import 'package:travelapp/screens/styles.dart';
import 'package:travelapp/screens/timePeriodSearch.dart';

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
    return BlocBuilder<HomeBloc, HomeStatesEra>(
      builder: (BuildContext context, HomeStatesEra state) {
        if (state is Loading) {
          return Text('Loading..');
        } else if (state is LoadDataFail) {
          return Text(state.error);
        } else {
          data = (state as LoadDataSuccess).data['era'];

          return Container(child: _buildEraWidget());
        }
      },
    );
  }

  Widget _buildEraWidget() {
    return Container(
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 4)),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          var item = data[index];
          var id = item['id'];
          var name = item['name'];
          var desc = item['description'];
          var colorCode = item['color_code'];
          return GestureDetector(
              onTap: () {
                print(item['id'].toString() + ' clicked');
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => TimePeriodSearch(
                          id: id,
                          name: name,
                          desc: desc,
                          colorCode: colorCode,
                        )));
              },
              child: Container(
                  // height: 70,
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(
                          _convertToColor(item['color_code'].toString()))),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(item['name'].toString(), style: white17w600),
                      ],
                    ),
                  )));
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
