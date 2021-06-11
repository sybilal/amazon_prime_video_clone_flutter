import 'package:amazon_prime_clone/models/home/homeModal.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShowFullScreen extends StatefulWidget {
  static const routeName = '/show-full-screen';

  const ShowFullScreen({Key key}) : super(key: key);

  @override
  _ShowFullScreenState createState() => _ShowFullScreenState();
}

class _ShowFullScreenState extends State<ShowFullScreen> {
  // bool _isPlaying = true;

  String args;
  YoutubePlayerController _ytController = YoutubePlayerController(
    initialVideoId: '',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  @override
  void initState() {
    setState(() {
      if (!_ytController.value.isFullScreen) {
        setState(() {
          _ytController.toggleFullScreenMode();
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _ytController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String videoId = ModalRoute.of(context).settings.arguments;

    _ytController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    return Material(
      color: Colors.black,
      child: RotatedBox(
        quarterTurns: 0,
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _ytController,
          ),
          builder: (context, player) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                player,
              ],
            );
          },
        ),
      ),
    );
  }
}
