import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/bookmarkBloc/blocs/home/monument.dart';
import 'package:travelapp/screens/styles.dart';
import 'package:travelapp/widgets/deleteAlert.dart';

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
          // data = (state as LoadDataSuccess).data;
          // print(data);
          // print(data);
          // return Container();
          return Container(child: _buildMonumentWidget());
        }
      },
    );
  }

  int _selectedCount = 0;
  bool _manageClicked = false;
  void handleClick(String value) {
    setState(() {
      _manageClicked = !_manageClicked;
    });
  }

  List<bool> _selected = List.generate(100, (i) => false);
  List<int> _selectedID = [];
  Widget _buildMonumentWidget() {
    return Column(children: [
      _appBar(),
      Container(
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            var item = data[index];
            // print(item);
            // print(item);
            // print(_selected);
            return GestureDetector(
                // onTap: () {
                //   print('Monument ' + item['id'].toString() + ' clicked');
                // },
                child: Container(
              color: _selected[index] ? Colors.grey[200] : null,
              child: ListTile(
                  trailing: (_selectedCount != 0 || _manageClicked == true)
                      ? ((_selected[index])
                          ? Icon(
                              Icons.check_box,
                              color: Colors.deepOrange,
                            )
                          : Icon(Icons.check_box_outline_blank))
                      : null,
                  leading: Container(
                      height: 60,
                      width: 90,
                      decoration: BoxDecoration(
                          image: (item['details']['mt_heroImg'] != null &&
                                  item['details']['mt_heroImg'].length != 0 &&
                                  item['details']['mt_heroImg'].toString() != "[null]")
                              ? DecorationImage(
                                  image: NetworkImage(
                                      item['details']['mt_heroImg'][0]),
                                  fit: BoxFit.cover)
                              : DecorationImage(
                                  image:
                                      // NetworkImage(item['details']['mt_heroImg'][0]),
                                      NetworkImage(
                                          'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                  fit: BoxFit.cover))),
                  isThreeLine: true,
                  title: Text(item['name'].toString(), style: titleFontStyle),
                  subtitle: (item['details']['mt_description'] != null)
                      ? Text(
                          item['location_name'].toString() +
                              '.' +
                              item['era']['name'].toString() +
                              '\n' +
                              item['details']['mt_description']
                                  .toString()
                                  .substring(0),
                          style: subtitleFontStyle,
                          maxLines: 2,
                        )
                      : Text(item['location_name'].toString() +
                          '.' +
                          item['era']['name'].toString() +
                          '\n'),
                  onTap: () {
                    setState(() {
                      if (_selectedCount != 0 || _manageClicked == true) {
                        if (_selected[index] == true) {
                          _selected[index] = false;
                          _selectedCount--;
                        } else {
                          _selectedCount++;
                          _selected[index] = true;
                        }
                      }
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      if (_selected[index] == false) {
                        _selected[index] = true;
                        _selectedCount++;
                      }
                    });
                  }),
            ));
          },
        ),
      )
    ]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget showDeleteAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            child: Container(
              height: 165,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text('Confirm Delete', style: titleFontStyle),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        width: double.infinity,
                        child: Text(
                            'Are you sure you want to delete the bookmark?',
                            style: grey14w400),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Row(
                        children: <Widget>[
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('CANCEL', style: cancelButtonText),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          GestureDetector(
                              onTap: () {
                                _showForDelete();
                                _selectedCount = 0;
                                _selected = List.generate(100, (i) => false);
                                _selectedID = [];
                                Navigator.of(context).pop();
                                setState(() {});
                              },
                              child: Text(
                                'DELETE',
                                style: deleteButtonText,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 15)
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _appBar() {
    return AppBar(
      elevation: 0,
      bottomOpacity: 4,
      backgroundColor: Colors.white,
      actions: <Widget>[
        (_selectedCount == 0)
            ? PopupMenuButton<String>(
                onSelected: handleClick,
                itemBuilder: (BuildContext context) {
                  return {(!_manageClicked) ? 'Manage' : 'Cancel'}
                      .map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              )
            : Container(),
      ],
      title: (_selectedCount == 0)
          ? Row(
              children: <Widget>[
                Text(
                  'My Bookmarks',
                  style: largeTitleFontStyle,
                ),
              ],
            )
          : Row(
              children: <Widget>[
                Text('$_selectedCount'),
                Spacer(),
                GestureDetector(
                  child: Icon(Icons.delete, color: Colors.deepOrange),
                  onTap: () {
                    // print(_selected.toString());

                    return showDeleteAlert(context);
                  },
                )
              ],
            ),
      leading: (_manageClicked || _selectedCount != 0)
          ? IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () {
                for (int i = 0; i < _selected.length; i++) _selected[i] = false;
                setState(() {
                  _selectedCount = 0;
                  _manageClicked = false;
                });
              },
            )
          : IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
    );
  }

  void _showForDelete() {
    for (int i = 0; i < data.length; i++) {
      if (_selected[i] == true) _selectedID.add(data[i]['id']);
    }
    print('List to be deleted' + _selectedID.toString());
  }
}
