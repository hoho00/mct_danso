import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/widgets/widgets.dart';

class QAndAPAGE extends StatefulWidget {
  final String subject;
  final String explanation;
  final String url;
  final double startSecond;
  // final Image image;
  QAndAPAGE(
      {Key? key,
      required this.subject,
      required this.explanation,
      required this.url,
      required this.startSecond})
      : super(key: key);

  @override
  _QAndAPAGEState createState() => _QAndAPAGEState();
}

class _QAndAPAGEState extends State<QAndAPAGE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tabbarAndAppBar(title: 'Q&A', tabbar: null, enableTabBar: false),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              YoutubePlayers(
                url: widget.url,
                startSeconds: widget.startSecond,
              ),
              SizedBox(height: 20.h),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: MctSize.fifteen.getSize),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.subject,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MctSize.seventeen.getSize.sp,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(widget.explanation,
                        style:
                            TextStyle(fontSize: MctSize.fourteen.getSize.sp)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
