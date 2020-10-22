import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'styles.dart';
import 'package:video_player/video_player.dart';

class MonumentDetails extends StatefulWidget {
  MonumentDetails({Key key}) : super(key: key);

  @override
  _MonumentDetailsState createState() => _MonumentDetailsState();
}

class _MonumentDetailsState extends State<MonumentDetails> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(children: <Widget>[
        //Video Code starts
        Padding(
          padding: EdgeInsets.all(15),
          child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the VideoPlayerController has finished initialization, use
                // the data it provides to limit the aspect ratio of the video.
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  // Use the VideoPlayer widget to display the video.
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                    VideoPlayer(_controller),
                    Align(

                      child:FlatButton(
                      onPressed: () {
                        setState(() {
                          // If the video is playing, pause it.
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            // If the video is paused, play it.
                            _controller.play();
                          }
                        });
                      },
                      child: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                            size: 50,
                            color: Colors.white,
                      ),
                    ),),
                  ]),
                );
              } else {
                // If the VideoPlayerController is still initializing, show a
                // loading spinner.
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        // Video Code Ends
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
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
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
                  Center(child: Text('Cave Temple', style: white16)),
                  SizedBox(
                    height: 6,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Mahabalipuram', style: white14w400),
                        Text(' • ', style: white17bold),
                        Text('310 CE - 630 CE', style: white14w400)
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
                        Text('Bookmark', style: blackTextStyle)
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
                        Text('Directions', style: blackTextStyle)
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
                        Text('Add Review', style: blackTextStyle)
                      ],
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 15, left: 15),
              child: Row(
                children: <Widget>[
                  _returnMonument(
                      'images/caveTemple.jpg', 'images/caveTemple.jpg'),
                  SizedBox(width: 15),
                  _returnMonument('images/shoreTemple.jpg',
                      'Facade - Shafts and Square Bases')
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 15, left: 15),
              child: Row(
                children: <Widget>[
                  _returnMonument('images/sanctum.jpg', 'Sanctums'),
                  SizedBox(width: 15),
                  _returnMonument('images/wall.jpg', 'Sanctum Wall Paintings')
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
                      Text('Reviews And Ratings', style: blackTextStyle),
                      Spacer(),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: greenReviewBox,
                        child: Center(
                            child: Text(
                          '4.8',
                          style: white12,
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
                            style: blackTextStyle,
                          ),
                          Text("8 days ago", style: grey14w400)
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: greenReviewBox,
                        child: Center(
                            child: Text(
                          '5.0',
                          style: white12,
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
                    'Mandagapatu was known for its Proin gravida nibh vel velit auctor aliquet. Aenesollicitudin, lorem quis bibendauctor, nisi elit consequat ipsum, nec. Read more...',
                    style: subtitleFontStyle,
                  ),
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
                        style: blackTextStyle,
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
                                style: grey14w400,
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
                    style: blackTextStyle,
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
                    style: blackTextStyle,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                      width: double.infinity,
                      child: Text(
                          'Chennai, Medivela, ECR, Ocean View, South India, South Chennai',
                          style: grey14w400)),
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

  Widget _returnMonument(String imageLocation, String imageDesc) {
    return Expanded(
        child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 1, color: Colors.white10)],
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                      image: AssetImage(imageLocation),
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
                            padding: const EdgeInsets.only(left: 13, top: 6),
                            child: Text(
                              imageDesc,
                              style: white14w200,
                            ),
                          )))
                ],
              ),
            )));
  }
}
