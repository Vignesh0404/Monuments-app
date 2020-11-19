import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:travelapp/addReviewBloc/addReview.dart';
import 'package:travelapp/monumentDetailsReviewsBloc/monumentDetailsReview.dart';
import 'package:travelapp/monumentReviewsBloc/monumentReview.dart';
import 'dart:math';
import 'styles.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

class MonumentDetails extends StatefulWidget {
  MonumentDetails(
      {this.name,
      this.desc,
      this.id,
      // this.index,
      this.eraName,
      this.galleryImage,
      this.heroImg,
      this.location,
      this.rating,
      //this.mapLocation,

      // this.numberType,
      // this.openFrom,
      // this.openTill,
      // this.phonNum,
      this.video});
  final int id;
  final String name;
  final String heroImg;
  final String location;
  final String eraName;
  final String video;
  final double rating;
  // final List openFrom;
  // final List openTill;
  // final List numberType;
  // final List mapLocation;
  final String desc;
  // final List phonNum;
  final List galleryImage;
  //final index;

  //List<String> streetsList = new List<String>.from(name);

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

  Timer _timer;
  bool showPause = false;

  bool flag = true;
  @override
  Widget build(BuildContext context) {
    Color _iconColor = Colors.black;
    String bookmark = 'Bookmark';
    String firstHalf;
    String secondHalf;
    if (widget.desc.length > 200) {
      firstHalf = widget.desc.substring(0, 200);
      secondHalf = widget.desc.substring(200, widget.desc.length);
    } else {
      firstHalf = widget.desc[0].toUpperCase() + widget.desc.substring(1);
      secondHalf = "";
    }
    return SafeArea(
      child: Scaffold(
          body: ListView(children: <Widget>[
        Stack(children: <Widget>[
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.heroImg),
                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.55), BlendMode.hardLight))),
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
                Center(
                    child: Text(
                        widget.name[0].toUpperCase() + widget.name.substring(1),
                        style: white16)),
                SizedBox(
                  height: 6,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          widget.location[0].toUpperCase() +
                              widget.location.substring(1),
                          style: white14w400),
                      Text(' • ', style: white17bold),
                      Text(widget.eraName, style: white14w400)
                    ],
                  ),
                ),
              ],
            ),
          ),
          //Video Code starts
          Padding(
            padding: EdgeInsets.only(right: 15, left: 15, bottom: 15, top: 120),
            // child:BoxDecoration(
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the video.
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    // Use the VideoPlayer widget to display the video.
                    child:
                        Stack(alignment: Alignment.center, children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            print('Video Clicked');
                            setState(() {
                              showPause = true;
                            });
                            _timer = new Timer(
                                const Duration(milliseconds: 800), () {
                              setState(() {
                                showPause = false;
                              });
                            });
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: VideoPlayer(_controller))),
                      Align(
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              // If the video is playing, pause it.
                              if (_controller.value.isPlaying) {
                                _controller.pause();
                              } else {
                                // If the video is paused, play it.
                                _controller.play();
                                showPause = true;
                                _timer = new Timer(
                                    const Duration(milliseconds: 800), () {
                                  setState(() {
                                    showPause = false;
                                  });
                                });
                              }
                            });
                          },
                          child: Icon(
                            !_controller.value.isPlaying
                                ? Icons.play_arrow
                                : showPause == true
                                    ? Icons.pause
                                    : null,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
          // )
        ]),
        // Video Code Ends
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  // Text(
                  //   widget.desc,
                  //   maxLines: 4,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                  Text(flag ? (firstHalf) : (firstHalf + secondHalf)),
                  (widget.desc.length > 200)
                      ? Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  flag = !flag;
                                });
                              },
                              child: (flag)
                                  ? Text(
                                      'Show More',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      'Show Less',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )))
                      : Text('')
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      print('bookmark clicked');
                      setState(() {
                        _iconColor = Colors.orange;
                      });
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          FlutterIcons.bookmark_border_mdi,
                          color: _iconColor,
                          size: 18,
                        ),
                        SizedBox(width: 1),
                        Text(bookmark, style: blackTextStyle)
                      ],
                    )),
                FlatButton(
                    onPressed: () {
                      print('directions clicked');
                    },
                    child: Row(
                      children: <Widget>[
                        Transform.rotate(
                          angle: -45 * pi / 180,
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                        SizedBox(width: 1),
                        Text('Directions', style: blackTextStyle)
                      ],
                    )),
                FlatButton(
                    onPressed: () {
                      print(widget.id);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new AddReview(
                                id: widget.id,
                              )));
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          FlutterIcons.add_to_list_ent,
                          color: Colors.black,
                          size: 18,
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                            child: Text('Add Review', style: blackTextStyle))
                      ],
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 15, left: 15),
              child: Row(
                children: <Widget>[
                  _returnMonument(widget.galleryImage[0], 'description'),
                  SizedBox(width: 15),
                  _returnMonument(widget.galleryImage[1], 'description')
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 15, left: 15),
              child: Row(
                children: <Widget>[
                  _returnMonument(widget.galleryImage[2], 'description'),
                  SizedBox(width: 15),
                  _returnMonument(widget.galleryImage[3], 'description')
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
            //Text('hello'),
            MonumentDetailsReview(
              id: widget.id,
              rating: widget.rating,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new AddReview(id: widget.id)));
                        },
                        child: Text(
                          'Add Review',
                          style: blackTextStyle,
                        ),
                      ),
                      Spacer(),
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new MonumentReview(
                                        id: widget.id, name: widget.name)));
                          },
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Read all reviews',
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
                  _returnGalleryImage(),
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

  Widget _returnGalleryImage() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: widget.galleryImage.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4.0),
            child: Container(
              width: 170,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                      image: NetworkImage(widget.galleryImage[index]),
                      fit: BoxFit.cover)),
            ),
          );
        },
      ),
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
                  image: (imageLocation != null &&
                          imageLocation.length != 0 &&
                          imageLocation.toString() != "[null]")
                      ? DecorationImage(
                          image: NetworkImage(imageLocation),
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
