import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:project_danso/widgets/youtube_player.dart';

class DansoHistroyKind extends StatefulWidget {
  final String subject;
  final String explanation;
  final String url;
  // final Image image;
  DansoHistroyKind(
      {Key key,
      @required this.subject,
      @required this.explanation,
      @required this.url})
      : super(key: key);

  @override
  _DansoHistroyKindState createState() => _DansoHistroyKindState();
}

class _DansoHistroyKindState extends State<DansoHistroyKind> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          YoutubePlayers(
            url: widget.url,
          ),
          SizedBox(height: 20.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.subject,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(widget.explanation, style: TextStyle(fontSize: 15.sp)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
