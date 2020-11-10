import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/MonumentBloc/blocs/home/Monument.dart';
import 'package:travelapp/screens/styles.dart';
import 'package:travelapp/queries.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var data;
  @override
  void initState() {
    super.initState();
  }
final TextEditingController _searchText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStatesMonument>(
      builder: (BuildContext context, HomeStatesMonument state) {
        if (state is Loading) {
          return Scaffold(body:LinearProgressIndicator(),
          // appBar: _searchBar(),
          );
        } else if (state is LoadDataFail) {
          return Text(state.error);
        } else {
          data = (state as LoadDataSuccess).data['monuments'];
          
          // print(data);
          return Scaffold(body:SingleChildScrollView(child:Column(children: [
            _searchBar(),
            // _getData(state),
            // Text(data.toString()),
            _buildMonumentWidget() ,
          ]))); 
          // appBar: 
          // );
        }
      },
    );
  }

  Widget _getData(HomeStatesMonument state){
    data = (state as LoadDataSuccess).data['monuments'];
    print('****************');
    print(data);
    print('****************');
    return Text(data.toString(),style: TextStyle(color:Colors.red),);
  }

  Widget _buildMonumentWidget() {
    return Container(
      child: ListView.builder(
        // physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 2,
          // childAspectRatio: 1,
        // ),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          var item = data[index];
          // print(item['details']['mt_heroImg']);
          return GestureDetector(
              onTap: () {
                print('Monument ' + item['name'].toString() + ' clicked');
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 1)],
                    // image: DecorationImage(
                    //     // image: NetworkImage(item['details']['mt_heroImg'][0]),
                    //     fit: BoxFit.cover,
                    //     colorFilter: ColorFilter.mode(
                    //         Colors.black.withOpacity(0.3),
                    //         BlendMode.hardLight)),
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

Widget _searchBar() {
    return 
    Container(
      color: Colors.white,
      child: Material(
        elevation: 5,
        child: 
        Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _searchText,
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.go,
                onChanged: (text) {
                  setState(() {
                    print(text.toString());
                    print('---------------');
                    print(HomeBloc()..add(FetchHomeData(basicSearch,variables:{"text":_searchText.text})));
                    // var data1 = (LoadDataSuccess);
                  });
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    hintText: "Search"),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  icon: (_searchText.text.isEmpty)
                      ? Icon(Icons.search)
                      : Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      if (_searchText.text.isNotEmpty) _searchText.text = '';
                    });
                  },
                ))
          ],
        ),
      ),
    );}
  @override
  void dispose() {
    super.dispose();
  }
}
