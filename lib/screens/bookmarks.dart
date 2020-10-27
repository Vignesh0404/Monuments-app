import 'package:flutter/material.dart';
import 'package:travelapp/screens/styles.dart';
import 'package:travelapp/widgets/deleteAlert.dart';

class Bookmarks extends StatefulWidget {
  Bookmarks({Key key}) : super(key: key);

  @override
  _BookmarksState createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  List<bool> _selected = List.generate(4, (i) => false);
  List<String> nameList = [
    'Cave Temple',
    'Shore Temple',
    'Cave Temple',
    'Shore Temple'
  ];
  List<String> locationList = [
    'Chennai',
    'Mahabalipuram',
    'Chennai',
    'Mahabalipuram'
  ];
  List<String> eraList = [
    '300 CE - 600 CE',
    '300 CE - 600 CE',
    '300 CE - 600 CE',
    '300 CE - 600 CE'
  ];
  List<String> descList = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
    '',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
    ''
  ];
  int _selectedCount = 0;
  bool _manageClicked = false;
  void handleClick(String value) {
    setState(() {
      _manageClicked = !_manageClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              bottomOpacity: 4,
              backgroundColor: Colors.white,
              actions: <Widget>[
                (_selectedCount == 0)
                    ? PopupMenuButton<String>(
                        onSelected: handleClick,
                        itemBuilder: (BuildContext context) {
                          return {(!_manageClicked)?'Manage':'Cancel'}.map((String choice) {
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
                        // Spacer(),
                        // GestureDetector(
                        //     child: Icon(
                        //       Icons.more_vert,
                        //       color: (_manageClicked)
                        //           ? Colors.deepOrange
                        //           : Colors.black,
                        //     ),
                        //     onTap: () {
                        //                   setState(() {
                        //         _manageClicked = !_manageClicked;
                        //       });
                        //     })
                      ],
                    )
                  : Row(
                      children: <Widget>[
                        Text('$_selectedCount'),
                        Spacer(),
                        GestureDetector(
                          child: Icon(Icons.delete, color: Colors.deepOrange),
                          onTap: () {
                            print(_selected.toString());
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
                        for (int i = 0; i < _selected.length; i++)
                          _selected[i] = false;
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
            ),
            body: Column(children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (_, i) {
                    return Container(
                      color: _selected[i] ? Colors.grey[200] : null,
                      child: ListTile(
                          trailing:
                              (_selectedCount != 0 || _manageClicked == true)
                                  ? ((_selected[i])
                                      ? Icon(
                                          Icons.check_box,
                                          color: Colors.deepOrange,
                                        )
                                      : Icon(Icons.check_box_outline_blank))
                                  : null,
                          leading: Container(
                            child: Image.asset('images/shoreTemple.jpg',
                                fit: BoxFit.cover),
                          ),
                          isThreeLine: true,
                          title: Text("${nameList[i]}", style: titleFontStyle),
                          subtitle: Text(
                            '${locationList[i]}' +
                                '.' +
                                '${eraList[i]}' +
                                '\n${descList[i]}',
                            style: subtitleFontStyle,
                          ),
                          onTap: () {
                            setState(() {
                              if (_selectedCount != 0 ||
                                  _manageClicked == true) {
                                if (_selected[i] == true) {
                                  _selected[i] = false;
                                  _selectedCount--;
                                } else {
                                  _selectedCount++;
                                  _selected[i] = true;
                                }
                              }
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              if (_selected[i] == false) {
                                _selected[i] = true;
                                _selectedCount++;
                              }
                            });
                          }),
                    );
                  },
                ),
              ),
            ])));
  }
}
