import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import 'dart:io';
import 'package:video_player/video_player.dart';
import 'dart:async';

class Video extends StatefulWidget {
  Video({Key key}) : super(key: key);
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {

  
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  
  File _video;

  
  videoUpload() async {
    Map<String, String> headers = {
      "Accept": "application/json",
    };

    var request = http.MultipartRequest('POST', Uri.parse('http://10.0.2.2:8000/api/video'));
    request.files.add(await http.MultipartFile.fromPath('video', _video.path));
    request.headers.addAll(headers);
    var response = await request.send();
    print(response.statusCode);
    print('done');

  }



  // This funcion will helps you to pick a Video File
  _pickVideo() async {
    File video = await ImagePicker.pickVideo(source: ImageSource.gallery);
     _video = video;
  }

  Future<List<int>> _getResults() async {
    await Future.delayed(Duration(seconds: 10));
    return List<int>.generate(10, (index) => index);
  }

  
  @override
  void initState() {
    // TODO: implement initState
    print('-====video====-');
    // https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      // 'https://www.w3schools.com/html/mov_bbb.mp4',
      // 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      // 'http://159.89.203.166/butterfly.mp4',
      // 'http://10.0.2.2:8000/uploads/bbb.mp4',
    );

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Video"),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Use a FutureBuilder to display a loading spinner while waiting for the
              // VideoPlayerController to finish initializing.
              FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the VideoPlayerController has finished initialization, use
                    // the data it provides to limit the aspect ratio of the VideoPlayer.
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      // Use the VideoPlayer widget to display the video.
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    // If the VideoPlayerController is still initializing, show a
                    // loading spinner.
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
              RaisedButton(
                onPressed: _pickVideo,
                child: Text('pick video'),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                'My Awesome List',
                style: TextStyle(fontSize: 40),
              ),
              Expanded(
                child: FutureBuilder<List<int>>(
                    // perform the future delay to simulate request
                    future: _getResults(), 
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return ListView.builder(
                          itemCount: 10,
                          // Important code
                          itemBuilder: (context, index) => Shimmer.fromColors(
                              baseColor: Colors.grey[400],
                              highlightColor: Colors.white,
                              child: ListItem(index: -1)),
                        );
                      }

                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) => ListItem(index: index),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
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
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final int index;
  const ListItem({Key key, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        children: <Widget>[
          Container(
            width: 50.0,
            height: 50.0,
            margin: EdgeInsets.only(right: 15.0),
            color: Colors.blue,
          ),
          index != -1
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'This is title $index',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('This is more details'),
                    Text('One more detail'),
                  ],
                )
              : Expanded(
                  child: Container(
                    color: Colors.grey,
                  ),
                )
        ],
      ),
    );
  }
}