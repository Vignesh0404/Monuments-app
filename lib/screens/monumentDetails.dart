import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'styles.dart';

class MonumentDetails extends StatefulWidget {
  MonumentDetails({Key key}) : super(key: key);

  @override
  _MonumentDetailsState createState() => _MonumentDetailsState();
}

class _MonumentDetailsState extends State<MonumentDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/caveTemple.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.55),
                          BlendMode.hardLight))),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 24,
                            color: Colors.white,
                          ),
                          onPressed: null),
                      Spacer(),
                      IconButton(
                          icon: Icon(
                            FlutterIcons.download_ant,
                            color: Colors.white,
                            size: 24,
                          ),
                          onPressed: null),
                      IconButton(
                          icon: Icon(
                            FlutterIcons.share_2_fea,
                            color: Colors.white,
                            size: 24,
                          ),
                          onPressed: null)
                    ],
                  ),
                  Center(
                      child: Text(
                    'Cave Temple',
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.white,
                        //fontWeight: FontWeight.w800,
                        fontSize: 16),
                  )),
                  SizedBox(
                    height: 6,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Mahabalipuram',
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
                        Text('310 CE - 630 CE',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Text(
                      'Mandagapattu was known for its Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec Proin gravida nibh vel velit auctor. Read more...'),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      print('bookmark clicked');
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          FlutterIcons.bookmark_border_mdi,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text('Bookmark',
                            style: TextStyle(
                                fontFamily: "openSans",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 13))
                      ],
                    )),
                FlatButton(
                    onPressed: () {
                      print('directions clicked');
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          FlutterIcons.direction_ent,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text('Directions',
                            style: TextStyle(
                                fontFamily: "openSans",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 13))
                      ],
                    )),
                FlatButton(
                    onPressed: () {
                      print('addreview clicked');
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          FlutterIcons.add_to_list_ent,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text('Add Review',
                            style: TextStyle(
                                fontFamily: "openSans",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 13))
                      ],
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, top: 8, right: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 145,
                    width: 160,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 1, color: Colors.white10)
                        ],
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                            image: AssetImage('images/caveTemple.jpg'),
                            fit: BoxFit.cover,
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.15),
                                BlendMode.hardLight))),
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.grey.shade800.withOpacity(0.6),
                                backgroundBlendMode: BlendMode.hardLight),
                            child: Container(
                                width: 40,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 13, top: 6),
                                  child: Text(
                                    'Facade - Corbells',
                                    style: white14w200,
                                  ),
                                )))
                      ],
                    ),
                  ),
                  Container(
                    height: 145,
                    width: 160,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 1, color: Colors.white10)
                        ],
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                            image: AssetImage('images/shoreTemple.jpg'),
                            fit: BoxFit.cover,
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.15),
                                BlendMode.hardLight))),
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.grey.shade800.withOpacity(0.6),
                                backgroundBlendMode: BlendMode.hardLight),
                            child: Container(
                              width: 40,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 13, top: 2),
                                child: Text(
                                  'Facade - Shafts and Square Bases',
                                  style: white14w200,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, top: 8, right: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 145,
                    width: 160,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 1, color: Colors.white10)
                        ],
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                            image: AssetImage('images/sanctum.jpg'),
                            fit: BoxFit.cover,
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.15),
                                BlendMode.hardLight))),
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.grey.shade800.withOpacity(0.6),
                                backgroundBlendMode: BlendMode.hardLight),
                            child: Container(
                              width: 40,
                              child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 13, top: 6),
                                  child: Text(
                                    'Sanctums',
                                    style: white14w200,
                                  )),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: 145,
                    width: 160,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 1, color: Colors.white10)
                        ],
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                            image: AssetImage('images/wall.jpg'),
                            fit: BoxFit.cover,
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.15),
                                BlendMode.hardLight))),
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.grey.shade800.withOpacity(0.6),
                                backgroundBlendMode: BlendMode.hardLight),
                            child: Container(
                                width: 40,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 2, right: 10),
                                  child: Text(
                                    'Sanctum Wall Paintings',
                                    style: white14w200,
                                  ),
                                )))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  height: 1.5,
                  width: double.infinity,
                  color: Colors.grey.shade400),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Reviews And Ratings',
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      ),
                      Spacer(),
                      Container(
                        height: 25,
                        width: 25,
                        //color: Colors.lightGreen[500],
                        decoration: BoxDecoration(
                            color: Color(0xFF6ECA4B),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Center(
                            child: Text(
                          '4.8',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 25.0,
                        backgroundImage:
                            NetworkImage('https://via.placeholder.com/150'),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Venky',
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "8 days ago",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: 25,
                        width: 25,
                        //color: Colors.lightGreen[500],
                        decoration: BoxDecoration(
                            color: Color(0xFF6ECA4B),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Center(
                            child: Text(
                          '5.0',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55.0),
                    child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey.shade400),
                  ),
                  SizedBox(height: 10),
                  Text(
                      'Mandagapatu was known for its Proin gravida nibh vel velit auctor aliquet. Aenesollicitudin, lorem quis bibendauctor, nisi elit consequat ipsum, nec. Read more...'),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 1.5,
                      width: double.infinity,
                      color: Colors.grey.shade400),
                  Row(
                    children: <Widget>[
                      Icon(FlutterIcons.add_to_list_ent, color: Colors.black),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Add Review',
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w700),
                      ),
                      Spacer(),
                      FlatButton(
                          onPressed: () {
                            print('read all reviews pressed');
                          },
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Read all reviews(15)',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                                size: 12,
                              )
                            ],
                          ))
                    ],
                  ),
                  Container(
                      height: 1.5,
                      width: double.infinity,
                      color: Colors.grey.shade400),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Gallery',
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: 170,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                            image: AssetImage('images/sanctum.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Tagged With',
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                      width: double.infinity,
                      child: Text(
                        'Chennai, Medivela, ECR, Ocean View, South India, South Chennai',
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            color: Colors.grey.shade600),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(
                              FlutterIcons.share_2_fea,
                              color: Colors.black,
                              size: 29,
                            ),
                            onPressed: null),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Share this monument with your friends',
                          style: blackTextStyle,
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ])),
    );
  }
}
