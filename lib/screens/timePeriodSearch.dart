import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class TimePeriodSearch extends StatefulWidget {
  TimePeriodSearch({Key key}) : super(key: key);

  @override
  _TimePeriodSearchState createState() => _TimePeriodSearchState();
}

class _TimePeriodSearchState extends State<TimePeriodSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE5CE7E),
        leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 28,
            ),
            onPressed: null),
        title: Text(
          '300 CE - 630 CE',
          style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 13, right: 13, bottom: 18, top: 20),
        child: Column(
          children: <Widget>[
            Container(
                width: double.infinity,
                child: Text(
                    "This era marked the inital phase of the 'Post Sangam' period,also called the 'Earlt Medival Age'.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock,The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from  by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham. ")),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 1.0),
              padding: EdgeInsets.all(10.0),
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 1)],
                  //border: Border.all(width: 0.5),
                  image: DecorationImage(
                      image: AssetImage('images/shoreTemple.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.hardLight)),
                  //color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(13.0)),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Shore Temple',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 7,
                        ),
                        Text('Mahabalipuram',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
