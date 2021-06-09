import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ShowFullScreen extends StatefulWidget {
  static const routeName = '/show-full-screen';

  const ShowFullScreen({Key key}) : super(key: key);

  @override
  _ShowFullScreenState createState() => _ShowFullScreenState();
}

class _ShowFullScreenState extends State<ShowFullScreen> {
  VideoPlayerController _controller;

  // bool _isPlaying = true;

  double _seekValue = 0;
  bool _showMedia = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        // 'https://vod-progressive.akamaized.net/exp=1623193448~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F991%2F20%2F504956348%2F2312197446.mp4~hmac=546e61e4c2c572b56a23ef9c4a57ff35ccd5dd7ba1af12e3ff0658b280a3b0fa/vimeo-prod-skyfire-std-us/01/991/20/504956348/2312197446.mp4',
        'https://github.com/JohannesMilke/video_example/blob/master/assets/video.mp4?raw=true')
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying) {
          setState(() {
            _seekValue = _controller.value.position.inSeconds.toDouble();
          });
        }
      })
      ..initialize().then((_) {
        showMedia();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  toggleVideo() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
  }

  videoSeekTo(Duration duration) {
    setState(() {
      _seekValue = duration.inSeconds.toDouble();
      _controller.seekTo(duration);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: RotatedBox(
        quarterTurns: 0,
        child: Stack(
          children: [
            _controller.value.isInitialized
                ? GestureDetector(
                    onTap: () {
                      if (_showMedia)
                        setState(() {
                          _showMedia = false;
                        });
                      else
                        showMedia();
                    },
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  )
                : Container(
                    child: Center(child: CircularProgressIndicator()),
                  ),
            _showMedia
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 150,
                      color: Colors.black.withOpacity(0.5),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_printDuration(
                                    Duration(seconds: _seekValue.toInt()))),
                                Text(
                                    _printDuration(_controller.value.duration)),
                              ],
                            ),
                          ),
                          Slider(
                            min: 0,
                            max:
                                _controller.value.duration.inSeconds.toDouble(),
                            onChanged: (val) {
                              setState(() {
                                _seekValue = val;
                              });
                            },
                            onChangeEnd: (val) {
                              setState(() {
                                _controller.seekTo(
                                    Duration(seconds: _seekValue.toInt()));
                              });
                            },
                            value: _seekValue,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  videoSeekTo(Duration.zero);
                                },
                                child: Icon(
                                  Icons.skip_previous,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                              TextButton(
                                onPressed: toggleVideo,
                                child: Icon(
                                  _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  _controller.pause();
                                  videoSeekTo(Duration.zero);
                                },
                                child: Icon(
                                  Icons.stop,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  showMedia() async {
    print('showmedia called');
    setState(() {
      _showMedia = true;
    });
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      _showMedia = false;
    });
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    List<String> finalx = [];

    if (duration.inHours != 0) {
      finalx.add(twoDigits(duration.inHours));
    }

    finalx.addAll([twoDigitMinutes, twoDigitSeconds]);

    return finalx.join(':');
  }
}
