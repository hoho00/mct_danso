import 'package:flutter/material.dart';
import 'package:flutter_youtube_view/flutter_youtube_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YoutubePlayers extends StatefulWidget {
  final String url;

  const YoutubePlayers({Key key, this.url}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<YoutubePlayers>
    implements YouTubePlayerListener {
  double _currentVideoSecond = 0.0;
  String _playerState = "";
  FlutterYoutubeViewController _controller;

  @override
  void onCurrentSecond(double second) {
    print("onCurrentSecond second = $second");
    _currentVideoSecond = second;
  }

  @override
  void onError(String error) {
    print("onError error = $error");
  }

  @override
  void onReady() {
    print("onReady");
  }

  @override
  void onStateChange(String state) {
    print("onStateChange state = $state");
    setState(() {
      _playerState = state;
    });
  }

  @override
  void onVideoDuration(double duration) {
    print("onVideoDuration duration = $duration");
  }

  void _onYoutubeCreated(FlutterYoutubeViewController controller) {
    this._controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.sp),
      color: Colors.grey,
      height: 185.h,
      width: 330.w,
      child: Center(
        child: FlutterYoutubeView(
          onViewCreated: _onYoutubeCreated,
          listener: this,
          params: YoutubeParam(
            videoId: widget.url,
            showUI: true,
            showYoutube: false,
            showFullScreen: false,
            autoPlay: false,
          ),
        ),
      ),
    );
  }
}
