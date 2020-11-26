import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelapp/MonumentBloc/blocs/home/monument.dart';
import 'package:travelapp/queries.dart';
import 'package:travelapp/screens/monumentDetails.dart';
import 'package:travelapp/screens/styles.dart';

// void main() {
//   Bloc.observer = MySimpleBlocObserver();
//   runApp(MyApp2());
// }

class SearchTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SearchTabState();
}

class SearchTabState extends State<SearchTab> {
  Map<String, String> variables;
  SearchTab(variables) {
    this.variables = variables;
  }

  var data;
  TextEditingController _searchText = TextEditingController();
  HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider<HomeBloc>(
            create: (BuildContext context) => homeBloc
              ..add(FetchHomeData(basicSearch,
                  variables: {"text": _searchText.text})),
            child: BlocBuilder<HomeBloc, HomeStatesMonument>(
                builder: (BuildContext context, HomeStatesMonument state) {
              if (state is Loading) {
                return SafeArea(
                    child: Scaffold(
                        backgroundColor: Color(0xFFEBEBEB),
                        body: Column(children: [
                          _searchBar(state),
                          // LinearProgressIndicator(),
                        ])
                        // appBar: _searchBar(),
                        ));
              } else if (state is LoadDataFail) {
                return Text(state.error);
              } else {
                data = (state as LoadDataSuccess).data['monuments'];

                // print(data);
                return SafeArea(
                    child: Scaffold(
                        primary: false,
                        resizeToAvoidBottomInset: false,
                        backgroundColor: Color(0xFFEBEBEB),
                        body: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _searchBar(state),
                              // Spacer(),
                              _buildMonumentWidget(),
                              // Spacer()
                            ])));
              }
            })));
  }

  Widget _emptySearch(String text) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 80),
          SvgPicture.asset('images/emptySearch.svg'),
          // Image(
          //   image: AssetImage('images/emptySearch.JPG'),
          // ),
          Text(text),
        ]);
  }

  Widget _buildMonumentWidget() {
    if (data.length == 0 && _searchText.text != "")
      return _emptySearch('No results found for "${_searchText.text}"');
    if (data.length == 0 && _searchText.text == "")
      return _emptySearch('Enter text for searching');
    return Container(
        child: Card(
      margin: EdgeInsets.only(right: 5, left: 5),
      child: ListView.separated(
        // physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 1,
          color: Colors.black45,
        ),

        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          var item = data[index];
          var id = item['id'];
          var heroImg = item['details']['mt_heroImg'][0];
          var name = item['details']["mt_name"];
          var location = item['details']["mt_location"];
          var eraName = item['era']['name'];
          var video = item['details']['mt_video'];
          var galleryImage = item['details']['mt_gallery'];
          //var openFrom = item['details']['mt_openFrom'];
          // var openTill = item['details']['mt_openTill'];
          // var numberType = item['details']['mt_numberType'];
          // var mapLocation = item['details']['mt_mapLocation'];
          var desc = item['details']['mt_description'];
          // var phoneNum = item['details']['phoneNumber'];
          var rating = item['reviews_aggregate']["aggregate"]['avg']['rating'];
          return GestureDetector(
              onTap: () {
                print('Monument ' + item['name'].toString() + ' clicked');
                Navigator.of(context).push(MaterialPageRoute(
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
              child: ListTile(
                  // dense: true,
                  leading: Container(
                      height: 90,
                      width: 70,
                      child: CircleAvatar(
                        backgroundColor: Color(0xFFCEAF41),
                        backgroundImage: NetworkImage(
                          (item['details']['mt_heroImg'] != null &&
                                  item['details']['mt_heroImg'].length != 0 &&
                                  item['details']['mt_heroImg'].toString() !=
                                      "[null]")
                              ? item['details']['mt_heroImg'][0]
                              : 'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                        ),
                      )),
                  title: _coloredText(item['details']["mt_name"].toString()),
                  subtitle:
                      _coloredsubText(item['details']["mt_location"].toString())
                  // Text(
                  //     '${item['details']["mt_location"].toString()[0].toUpperCase()}${item['details']["mt_location"].toString().substring(1)}'
                  //     // +item['monuments_x_tags'].toString()
                  //     ,
                  //     style: subtitleFontStyle),
                  ));
        },
      ),
    ));
  }

  Widget _coloredText(String text) {
    int len = _searchText.text.length;
    int loc;
    if (len > 0)
      loc = text.toUpperCase().indexOf(_searchText.text.toUpperCase());
    else
      loc = -1;
    if (loc == -1)
      return Text(
        '${text[0].toUpperCase()}${text.substring(1)}',
        style: titleFontStyle,
      );
    else {
      return RichText(
          text: TextSpan(children: [
        TextSpan(
            text:
                "${text[0].toUpperCase()}${text.substring(loc + 1, loc + len)}",
            style: goldtitleFontStyle),
        TextSpan(text: "${text.substring(loc + len)}", style: titleFontStyle)
      ]));
    }
  }

  Widget _coloredsubText(String text) {
    int len = _searchText.text.length;

    int loc;
    if (len > 0)
      loc = text.toUpperCase().indexOf(_searchText.text.toUpperCase());
    else
      loc = -1;
    if (loc < 0)
      return Text(
        '${text[0].toUpperCase()}${text.substring(1)}',
        style: subtitleFontStyle,
      );
    else {
      return RichText(
          text: TextSpan(children: [
        TextSpan(
            text:
                '${text[0].toUpperCase()}${text.substring(loc + 1, loc + len)}',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFFCEAF41),
            )),
        TextSpan(
            text: '${text.substring(loc + len)}',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ))
      ]));
    }
  }

  Widget _searchBar(HomeStatesMonument state) {
    Widget searchIcon = SvgPicture.asset('images/searchTabIcon.svg');
    return Container(
      margin: EdgeInsets.all(5),
      color: Colors.white,
      child: Material(
        elevation: 5,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: TextField(
                controller: _searchText,
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.go,
                onChanged: (text) {
                  setState(() {
                    print(homeBloc
                      ..add(FetchHomeData(basicSearch,
                          variables: {"text": _searchText.text})));
                    data = (state as LoadDataSuccess).data['monuments'];
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
                      ? searchIcon
                      : Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      if (_searchText.text.isNotEmpty) _searchText.text = '';

                      print(homeBloc
                        ..add(FetchHomeData(basicSearch,
                            variables: {"text": _searchText.text})));
                      data = (state as LoadDataSuccess).data['monuments'];
                    });
                  },
                ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
